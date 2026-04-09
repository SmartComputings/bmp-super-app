import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigViewer extends StatelessWidget {
  const ConfigViewer({super.key});

  void _changeSetting(
    BuildContext context,
    AppSettings appSetting,
    SharedPreferences store,
    Function setState,
    String initialValue,
  ) async {
    if (appSetting is AppSettings<bool>) {
      appSetting.setItem(store, !(initialValue == 'true'));
      return;
    }

    final value = await showTextInputDialog(
      context: context,
      title: appSetting.name,
      hintText: appSetting.defaultValue.toString(),
      initialText: initialValue,
    );
    if (value == null) return;

    if (appSetting is AppSettings<String>) {
      appSetting.setItem(store, value);
    }
    if (appSetting is AppSettings<int>) {
      appSetting.setItem(store, int.parse(value));
    }
    if (appSetting is AppSettings<double>) {
      appSetting.setItem(store, double.parse(value));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).settings),
        leading: BackButton(
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            color: theme.colorScheme.errorContainer,
            child: Text(
              L10n.of(context).warning,
              style: TextStyle(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  itemCount: AppSettings.values.length,
                  itemBuilder: (context, i) {
                    final store = Matrix.of(context).store;
                    final appSetting = AppSettings.values[i];
                    var value = '';
                    if (appSetting is AppSettings<String>) {
                      value = appSetting.getItem(store);
                    }
                    if (appSetting is AppSettings<int>) {
                      value = appSetting.getItem(store).toString();
                    }
                    if (appSetting is AppSettings<bool>) {
                      value = appSetting.getItem(store).toString();
                    }
                    if (appSetting is AppSettings<double>) {
                      value = appSetting.getItem(store).toString();
                    }
                    return ListTile(
                      title: Text(appSetting.name),
                      subtitle: Text(value),
                      onTap: () => _changeSetting(
                        context,
                        appSetting,
                        store,
                        setState,
                        value,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
