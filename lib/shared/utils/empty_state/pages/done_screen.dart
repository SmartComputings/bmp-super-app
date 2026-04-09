import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app_settings/app_settings.dart';
import 'package:go_router/go_router.dart';
import 'package:bmp/core/localization/l10n.dart';

import '../widget/empty_state.dart';

class DoneScreen extends StatefulWidget {
  final String? returnRoute;
  final Map<String, dynamic>? returnArguments;

  const DoneScreen({
    Key? key,
    this.returnRoute,
    this.returnArguments,
  }) : super(key: key);

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
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
        if (results.isNotEmpty && !results.contains(ConnectivityResult.none)) {
          _navigateBack();
        }
      },
    );
  }

  void _navigateBack() {
    if (!mounted) return;
    if (widget.returnRoute != null) {
      context.go(widget.returnRoute!);
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> Go_Back() async {
    try {
      if (widget.returnRoute != null) {
        context.go(widget.returnRoute!);
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    } catch (e) {
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: EmptyState(
        iconPath: 'assets/icons/Done 1.png',
        title: L10n.of(context).done,
        description: L10n.of(context).taskCompletedSuccessfully,
        buttonName: L10n.of(context).goBack,
        showButton: true,
        onButtonTap: Go_Back,
        isSvg: true,
      ),
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
        builder: (context) => DoneScreen(
          returnRoute: returnRoute,
          returnArguments: returnArguments,
        ),
      ),
    );
  }
}
