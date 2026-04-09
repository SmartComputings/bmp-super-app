import 'dart:ui';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/localization/l10n.dart';
import 'done_screen.dart';
import 'package:bmp/shared/utils/snackbar.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;
  final Future<void> Function() onCompleteVerification;
  final VoidCallback onStartOver;

  const EmailVerificationPage({
    required this.email,
    required this.onCompleteVerification,
    required this.onStartOver,
    super.key,
  });

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool loading = false;
  String? error;

  Future<void> _handleCompleteVerification() async {
    print('Complete Registration button clicked');
    setState(() {
      loading = true;
      error = null;
    });

    try {
      print('Starting email verification process...');
      await widget.onCompleteVerification();
      print('Email verification completed successfully');

      // Show success message and navigate to done screen
      if (mounted) {
CustomSnackbar.show(context,          title: "",
          message: L10n.of(context).successfullyRegistered,
          type: SnackbarType.success,
        );

        // Navigate to done screen after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DoneScreen()),
        );
      }
    } catch (e) {
      print('Registration error: $e');

      if (!mounted) return;

      var errorMessage = e.toString();
      if (errorMessage.contains('Exception:')) {
        errorMessage = errorMessage.replaceFirst('Exception: ', '');
      }

      // Show user-friendly dialog
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.email_outlined,
                  size: 48,
                  color: Colors.orange,
                ),
                const SizedBox(height: 16),
                Text(
                  L10n.of(context).emailVerificationRequired,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  errorMessage.contains('not validated') ||
                          errorMessage.contains('not verified')
                      ? L10n.of(context).pleaseVerifyEmailFirst
                      : errorMessage.contains('No pending verification')
                          ? L10n.of(context).sessionExpiredStartOver
                          : L10n.of(context).pleaseVerifyEmailBeforeCompleting,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3976F8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      L10n.of(context).gotIt,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with blurred gradients
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1B1E43),
              ),
              child: Stack(
                children: [
                  // Blue gradient shapes
                  Positioned(
                    left: -60,
                    top: 80,
                    child: Container(
                      width: 300,
                      height: 220,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1929FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -35,
                    top: 440,
                    child: Container(
                      width: 225,
                      height: 220,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1929FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  // Purple gradient shapes
                  Positioned(
                    right: -25,
                    top: 440,
                    child: Container(
                      width: 330,
                      height: 225,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA912BF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Container(
                      width: 350,
                      height: 225,
                      decoration: BoxDecoration(
                        color:
                            const Color.fromARGB(255, 3, 3, 3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 7,
                    top: 150,
                    child: Container(
                      width: 225,
                      height: 225,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA912BF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  // Central blue shadow
                  Positioned(
                    left: 2,
                    top: 216,
                    child: Container(
                      width: 446,
                      height: 446,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4754FF).withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Blur overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  // Email icon with @ symbol
                  const Spacer(flex: 1),
                  // Mail image
                  Image.asset(
                    'assets/icons/Mail 1.png',
                    width: 220,
                    height: 220,
                  ),
                  const SizedBox(height: 7),
                  // Card container
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0x05092680).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          L10n.of(context).verificationEmailSent,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          L10n.of(context).pleaseCheckEmailAndVerify,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.email,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        if (error != null)
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.red.withOpacity(0.3),),
                            ),
                            child: Text(
                              error!,
                              style: GoogleFonts.poppins(
                                color: Colors.red.shade300,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          Text(
                            L10n.of(context).clickCompleteAfterVerifying,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(height: 30),
                        // Complete Registration Button
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed:
                                loading ? null : _handleCompleteVerification,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3976F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: loading
                                ? AppLoadingWidget()
                                : Text(
                                    L10n.of(context).completeRegistration,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Start Over Button
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: loading ? null : widget.onStartOver,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Colors.white, width: 1,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              L10n.of(context).startOver,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
