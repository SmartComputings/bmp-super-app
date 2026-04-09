import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:bmp/features/chat/settings_notifications/push_rule_extensions.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'settings_notifications.dart';

class SettingsNotificationsView extends StatelessWidget {
  final SettingsNotificationsController controller;

  const SettingsNotificationsView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final pushRules = Matrix.of(context).client.globalPushRules;
    final pushCategories = [
      if (pushRules?.override?.isNotEmpty ?? false)
        (rules: pushRules?.override ?? [], kind: PushRuleKind.override),
      if (pushRules?.content?.isNotEmpty ?? false)
        (rules: pushRules?.content ?? [], kind: PushRuleKind.content),
      if (pushRules?.sender?.isNotEmpty ?? false)
        (rules: pushRules?.sender ?? [], kind: PushRuleKind.sender),
      if (pushRules?.underride?.isNotEmpty ?? false)
        (rules: pushRules?.underride ?? [], kind: PushRuleKind.underride),
    ];
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background from wallet dashboard
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: const Color(0xFF1B1C30),
                child: Stack(
                  children: [
                    BgGradientTheme(
                      position: ShapePosition.center,
                      width: screenWidth * 1.8,
                      height: screenWidth * 1.8,
                      color: const Color(0xFF363EC1),
                      opacity: 0.6,
                    ),
                    BgGradientTheme(
                      position: ShapePosition.bottomFull,
                      height: screenHeight * 0.37,
                      colors: const [Color(0xFF1B1C30), Color(0xFFA912BF)],
                      opacity: 0.8,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: context.percentHeight * 4),
                // Header from wallet dashboard
                const DynamicHeader(isInNotifications: true),
                // Notification List - Only this scrolls
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: StreamBuilder(
                      stream: Matrix.of(context).client.onSync.stream.where(
                            (syncUpdate) =>
                                syncUpdate.accountData?.any(
                                  (accountData) => accountData.type == 'm.push_rules',
                                ) ??
                                false,
                          ),
                      builder: (BuildContext context, _) {
                        return ListView(
                          children: [
                            if (pushRules != null)
                              for (final category in pushCategories) ...
                                _buildNotificationSection(
                                  context,
                                  category.kind.localized(L10n.of(context)),
                                  category.rules,
                                  category.kind,
                                ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNotificationSection(
    BuildContext context,
    String sectionTitle,
    List<PushRule> rules,
    PushRuleKind kind,
  ) {
    return [
      // Section Title
      Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 20),
        child: Text(
          sectionTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Notification Cards
      for (final rule in rules)
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B5C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rule.getPushRuleName(L10n.of(context)),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rule.getPushRuleDescription(L10n.of(context)),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: rule.enabled,
                activeColor: const Color(0xFF1929FF),
                activeTrackColor: const Color(0xFF1929FF),
                inactiveTrackColor: Colors.transparent,
                trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.transparent;
                  }
                  return Colors.white;
                }),
                trackOutlineWidth: WidgetStateProperty.all(2.0),
                thumbColor: WidgetStateProperty.all(Colors.white),
                onChanged: controller.isLoading
                    ? null
                    : rule.ruleId == '.m.rule.master'
                        ? (_) => controller.togglePushRule(kind, rule)
                        : Matrix.of(context)
                                .client
                                .allPushNotificationsMuted
                            ? null
                            : (_) => controller.togglePushRule(kind, rule),
              ),
            ],
          ),
        ),
    ];
  }
}
