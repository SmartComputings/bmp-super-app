import 'dart:ui';

import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/bg_gradient_theme.dart';
import 'package:bmp/core/localization/l10n.dart';

class ManageAccountPage extends StatefulWidget {
  const ManageAccountPage({super.key});

  @override
  State<ManageAccountPage> createState() => _ManageAccountPageState();
}

class _ManageAccountPageState extends State<ManageAccountPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
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
                const DynamicHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          L10n.of(context).profileSettings,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Profile Section
                        _buildProfileSection(),
                        const SizedBox(height: 20),
                        
                        // Settings Cards
                        _buildSettingsCard(
                          icon: Icons.flight_takeoff,
                          title: L10n.of(context).flightMode,
                          subtitle: L10n.of(context).manageYourFlightMode,
                          hasSwitch: false,
                        ),
                        const SizedBox(height: 12),
                        
                        _buildSettingsCard(
                          icon: Icons.language,
                          title: L10n.of(context).available,
                          subtitle: '',
                          hasSwitch: false,
                        ),
                        const SizedBox(height: 20),
                        
                        // Password & Security Section
                        Text(
                          L10n.of(context).passwordAndSecurity,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // _buildSettingsCard(
                        //   icon: Icons.email,
                        //   title: 'Change Email',
                        //   subtitle: 'Fluffychat@gmail.com',
                        //   hasSwitch: false,
                        // ),
                        // const SizedBox(height: 12),
                        
                        _buildSettingsCard(
                          icon: Icons.security,
                          title: L10n.of(context).twoFactorAuthentication,
                          subtitle: L10n.of(context).enableTwoFactorAuthentication,
                          hasSwitch: true,
                          switchValue: true,
                        ),
                        const SizedBox(height: 20),
                        
                        _buildSettingsCard(
                          icon: Icons.visibility,
                          title: L10n.of(context).viewActiveSessions,
                          subtitle: L10n.of(context).signingIn,
                          hasSwitch: false,
                        ),
                        const SizedBox(height: 12),
                        
                        _buildSettingsCard(
                          icon: Icons.visibility,
                          title: L10n.of(context).signingIn,
                          subtitle: '',
                          hasSwitch: false,
                        ),
                        const SizedBox(height: 30),
                        
                        // // Danger Zone
                        // const Text(
                        //   'Danger Zone',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // const SizedBox(height: 16),
                        
                        // _buildDangerCard(),
                        // const SizedBox(height: 100),
                      ],
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

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF191F5A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/wallet_dashboard/profile_image.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chrissy James',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '@chrissy_james',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool hasSwitch = false,
    bool switchValue = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF191F5A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (hasSwitch)
            Switch(
              value: switchValue,
              onChanged: (value) {
                // Handle switch change
              },
              thumbColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.green;
                  }
                  return Colors.grey;
                },
              ),
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            )
          else
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 16,
            ),
        ],
      ),
    );
  }


}