import 'dart:async';
import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../core/logs/security_logger.dart';

class OtpInputDialog extends StatefulWidget {
  final String maskedEmail;
  final VoidCallback onResend;

  /// Optional callback to verify OTP. Returns error message if failed, null if success.
  final Future<String?> Function(String otp)? onVerify;

  const OtpInputDialog({
    super.key,
    required this.maskedEmail,
    required this.onResend,
    this.onVerify,
  });

  @override
  State<OtpInputDialog> createState() => _OtpInputDialogState();
}

class _OtpInputDialogState extends State<OtpInputDialog>
    with TickerProviderStateMixin {
  final _pinController = TextEditingController();
  final _pinFocusNode = FocusNode();

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  Timer? _otpExpiryTimer;
  int _otpRemainingSeconds = 300;
  bool _isOtpExpired = false;
  bool _isLoading = false;
  String? _errorMessage;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _animationController.forward();

    _startOtpExpiryTimer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinFocusNode.requestFocus();
    });
  }


  @override
  void dispose() {
    _animationController.dispose();
    _otpExpiryTimer?.cancel();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  void _startOtpExpiryTimer() {
    _otpRemainingSeconds = 300;
    _isOtpExpired = false;
    _otpExpiryTimer?.cancel();
    SecurityLogger.info('OTP Dialog: OTP expiry timer started (5 minutes)');

    _otpExpiryTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_otpRemainingSeconds > 0) {
            _otpRemainingSeconds--;
          } else {
            _isOtpExpired = true;
            timer.cancel();
            _errorMessage = 'OTP has expired. Please request a new OTP.';
            SecurityLogger.warning('OTP Dialog: OTP expired');
          }
        });
      }
    });
  }

  String get _formattedOtpTime {
    final minutes = _otpRemainingSeconds ~/ 60;
    final seconds = _otpRemainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          FocusScope.of(context).unfocus();
        }
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.percentWidth * 5),
            child: Container(
              width: context.percentWidth * 100,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: const BoxDecoration(
                color: Color(0x7F131EBF),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: context.percentWidth * 5.75,
                    top: context.percentHeight * 3.1,
                    child: Container(
                      width: context.percentWidth * 98.25,
                      height: context.percentHeight * 69.4,
                      decoration: const ShapeDecoration(
                        color: Color(0x7F7216BF),
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF7E24F9)),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: context.percentWidth * 5.75,
                    top: context.percentHeight * 14.4,
                    child: Container(
                      width: context.percentWidth * 98.25,
                      height: context.percentHeight * 46.1,
                      decoration: const ShapeDecoration(
                        color: Color(0x7F7216BF),
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF7E24F9)),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.percentWidth * 3.75,
                      vertical: context.percentHeight * 3.75,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          L10n.of(context).financeVerifyOTP,
                          style: const TextStyle(
                            color: Color(0xFFD2D4E5),
                            fontSize: 32,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: context.percentHeight * 0.75),
                        Text(
                          L10n.of(context).financeEnter6DigitCodeSent,
                          style: const TextStyle(
                            color: Color(0xFFD2D4E5),
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.maskedEmail,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: context.percentHeight * 1),
                        // OTP expiry countdown timer

                        SizedBox(height: context.percentHeight * 1.6),
                        _buildOtpInput(),
                        if (_errorMessage != null) ...[
                          SizedBox(height: context.percentHeight * 1.5),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.percentWidth * 2,
                            ),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                        SizedBox(height: context.percentHeight * 1),
                        _buildResendSection(),
                        SizedBox(height: context.percentHeight * 2),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: context.percentHeight * 5.6,
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0x3DF2FBF9),
                                    disabledBackgroundColor:
                                    const Color(0x3DF2FBF9)
                                        .withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        context.percentWidth * 6,
                                      ),
                                    ),
                                    elevation: 0,
                                  ),
                                  child:  Text(
                                    L10n.of(context).cancel,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: context.percentWidth * 4),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _handleSubmit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3976F8),
                                  disabledBackgroundColor:
                                  const Color(0xFF3976F8).withValues(alpha: 0.7),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      context.percentWidth * 6,
                                    ),
                                  ),
                                  elevation: 0,
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: _isLoading
                                      ? const SizedBox(
                                    key: ValueKey('loader'),
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                      : Text(
                                    key: const ValueKey('text'),
                                    L10n.of(context).verify,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpInput() {
    final defaultPinTheme = PinTheme(
      width: context.percentWidth * 12,
      height: context.percentWidth * 12,
      constraints: const BoxConstraints(maxWidth: 48, maxHeight: 48),
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: const Color(0x7F050926),
        borderRadius: BorderRadius.circular(context.percentWidth * 6.25),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color(0xFF22246F),
        border: Border.all(color: const Color(0xFF3976F8), width: 1.5),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color(0xFF22246F),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.red, width: 1.5),
      ),
    );

    return Column(
      children: [
        Pinput(
          length: 6,
          controller: _pinController,
          focusNode: _pinFocusNode,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          errorPinTheme: errorPinTheme,
          separatorBuilder: (index) => SizedBox(
            width: context.percentWidth * 1,
          ),
          obscureText: _obscureText,
          obscuringCharacter: '●',
          keyboardType: TextInputType.number,
          pinAnimationType: PinAnimationType.scale,
          animationDuration: const Duration(milliseconds: 200),
          onChanged: (value) {
            setState(() => _errorMessage = null);
          },
          onCompleted: (pin) {
            // Auto-submit when all 6 digits are entered
          },
        ),
      ],
    );
  }

  Widget _buildResendSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final canResend = _otpRemainingSeconds <= 0;

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          L10n.of(context).financeDidntReceiveCode,
          style: TextStyle(
            color: const Color(0xFFD2D4E5).withOpacity(0.7),
            fontSize: isSmallScreen ? 12 : 14,
            fontFamily: 'Work Sans',
          ),
        ),
        if (canResend)
          TextButton(
            onPressed: () {
              setState(() {
                _errorMessage = null;
                _pinController.clear();
              });
              widget.onResend();
              _startOtpExpiryTimer();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _pinFocusNode.requestFocus();
                }
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 16,
                vertical: isSmallScreen ? 4 : 8,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              L10n.of(context).financeResend,
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 12 : 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              '($_formattedOtpTime)',
              style: TextStyle(
                color: const Color(0xFFD2D4E5).withOpacity(0.6),
                fontSize: isSmallScreen ? 12 : 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (_isLoading) return;

    if (_isOtpExpired || _otpRemainingSeconds <= 0) {
      SecurityLogger.warning('OTP Dialog: Attempted to submit expired OTP');
      setState(
            () => _errorMessage = 'OTP has expired. Please request a new OTP.',
      );
      return;
    }

    final otp = _pinController.text;

    if (otp.isEmpty) {
      setState(() => _errorMessage = L10n.of(context).pleaseEnter6DigitCode);
      return;
    }

    SecurityLogger.info('OTP Dialog: Submit clicked', {
      'otpLength': otp.length,
      'maskedEmail': widget.maskedEmail,
      'remainingSeconds': _otpRemainingSeconds,
    });

    if (otp.length != 6) {
      SecurityLogger.warning(
        'OTP Dialog: Invalid OTP length',
        {'length': otp.length},
      );
      setState(() => _errorMessage = L10n.of(context).financeOTPMust6Digits);
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    if (widget.onVerify != null) {
      SecurityLogger.info('OTP Dialog: Verifying OTP inside dialog');
      final errorMessage = await widget.onVerify!(otp);

      if (!mounted) return;

      if (errorMessage != null) {
        SecurityLogger.error(
          'OTP Dialog: Verification failed',
          {'error': errorMessage},
        );
        setState(() {
          _isLoading = false;
          _errorMessage = errorMessage;
          _pinController.clear();
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _pinFocusNode.requestFocus();
          }
        });
        return;
      }

      SecurityLogger.info('OTP Dialog: Verification succeeded');
      if (mounted) {
        Navigator.of(context).pop(otp);
      }
    } else {
      SecurityLogger.info(
        'OTP Dialog: Returning OTP (no verification callback)',
      );
      Navigator.of(context).pop(otp);
    }
  }

  void showWrongOtpError() {
    if (mounted) {
      SecurityLogger.warning('OTP Dialog: Wrong OTP entered');
      setState(() {
        _isLoading = false;
        _errorMessage = L10n.of(context).financeWrongOTP;
        _pinController.clear();
        _pinFocusNode.requestFocus();
      });
    }
  }

  void showRegistrationRestartError() {
    if (mounted) {
      SecurityLogger.error('OTP Dialog: Registration restart required');
      setState(() {
        _isLoading = false;
        _errorMessage = L10n.of(context).financeInvalidOTPRestart;
      });
    }
  }

  static void showWrongOtpForDialog(BuildContext context) {
    final dialogState = context.findAncestorStateOfType<_OtpInputDialogState>();
    dialogState?.showWrongOtpError();
  }

  static void showRegistrationRestartForDialog(BuildContext context) {
    final dialogState = context.findAncestorStateOfType<_OtpInputDialogState>();
    dialogState?.showRegistrationRestartError();
  }

  static void showApiError(BuildContext context, String message) {
    final dialogState = context.findAncestorStateOfType<_OtpInputDialogState>();
    if (dialogState != null && dialogState.mounted) {
      SecurityLogger.error('OTP Dialog: API error', {'message': message});
      dialogState.setState(() {
        dialogState._isLoading = false;
        dialogState._errorMessage = message;
      });
    }
  }
}

// Helper function to show OTP dialog
Future<String?> showOtpDialog(
    BuildContext context, {
      required String maskedEmail,
      required VoidCallback onResend,

      /// Optional callback to verify OTP. Returns error message if failed, null if success.
      Future<String?> Function(String otp)? onVerify,
    }) {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) => OtpInputDialog(
      maskedEmail: maskedEmail,
      onResend: onResend,
      onVerify: onVerify,
    ),
  );
}

// Helper function to show OTP dialog with loading
Future<String?> showOtpDialogWithLoading(
    BuildContext context, {
      required String maskedEmail,
      required VoidCallback onResend,
    }) async {
  // Show loading first
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const AppLoadingWidget(),
              const SizedBox(height: 20),
              Text(
                L10n.of(context).financeSendingOTP,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context).financePleaseWaitSendingCode,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );

  // Wait a moment for loading to show
  await Future.delayed(const Duration(milliseconds: 500));

  // Close loading and show OTP dialog
  if (context.mounted) {
    Navigator.of(context).pop();
    return showOtpDialog(
      context,
      maskedEmail: maskedEmail,
      onResend: onResend,
    );
  }
  return null;
}

// Function to show wrong OTP error
void showWrongOtpMessage(BuildContext context) {
  _OtpInputDialogState.showWrongOtpForDialog(context);
}

// Function to show registration restart error
void showRegistrationRestartMessage(BuildContext context) {
  _OtpInputDialogState.showRegistrationRestartForDialog(context);
}

// Function to show API error in OTP dialog
void showOtpApiError(BuildContext context, String message) {
  _OtpInputDialogState.showApiError(context, message);
}
