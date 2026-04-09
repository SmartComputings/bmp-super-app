import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app_settings/app_settings.dart';
import 'package:bmp/core/localization/l10n.dart';
import '../widget/empty_state.dart';

class NoInternetPage extends StatefulWidget {
  final String? returnRoute;
  final Map<String, dynamic>? returnArguments;

  const NoInternetPage({
    Key? key,
    this.returnRoute,
    this.returnArguments,
  }) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _startConnectivityListener();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _startConnectivityListener() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        if (results.isNotEmpty && 
            !results.contains(ConnectivityResult.none)) {
          _navigateBack();
        }
      },
    );
  }

  void _navigateBack() {
    if (!mounted) return;
    if (widget.returnRoute != null) {
      Navigator.of(context).pushReplacementNamed(
        widget.returnRoute!,
        arguments: widget.returnArguments,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _openWifiSettings() async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.wifi);
    } catch (e) {
      await AppSettings.openAppSettings(type: AppSettingsType.settings);
    }
  }


  @override
  Widget build(BuildContext context) {
    return EmptyState(
      iconPath: 'assets/images/no_internet.png',
      title: L10n.of(context).noInternetConnection,
      description: L10n.of(context).pleaseCheckYourInternetConnection,
      buttonName: L10n.of(context).enableWiFi,
      showButton: true,
      onButtonTap: _openWifiSettings,
    );
  }
}

// Helper class to navigate to no internet page
class NoInternetHelper {
  static void navigateToNoInternet(
    BuildContext context, {
    String? returnRoute,
    Map<String, dynamic>? returnArguments,
  }) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => NoInternetPage(
          returnRoute: returnRoute,
          returnArguments: returnArguments,
        ),
      ),
    );
  }
}