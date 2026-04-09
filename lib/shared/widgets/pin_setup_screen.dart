import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/app_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinSetupScreen extends StatefulWidget {
  final bool isChanging;
  final String? currentPin;

  const PinSetupScreen({
    super.key,
    this.isChanging = false,
    this.currentPin,
  });

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  String _enteredPin = '';
  String _confirmPin = '';
  bool _isConfirming = false;
  bool _isVerifyingCurrent = false;
  String? _errorText;
  bool _isProcessing = false;

  String get _title {
    if (widget.isChanging) {
      if (_isVerifyingCurrent) return L10n.of(context).pleaseEnterYourPin;
      if (_isConfirming) return 'Confirm New PIN';
      return 'Enter New PIN';
    }
    if (_isConfirming) return 'Confirm Your PIN';
    return L10n.of(context).pleaseChooseAPasscode;
  }

  void _onNumberPressed(String number) {
    if (_isProcessing) return;

    HapticFeedback.lightImpact();

    setState(() {
      if (_isConfirming) {
        if (_confirmPin.length < 4) {
          _confirmPin += number;
        }
      } else {
        if (_enteredPin.length < 4) {
          _enteredPin += number;
        }
      }
      _errorText = null;
    });

    if ((_isConfirming ? _confirmPin : _enteredPin).length == 4) {
      _processPinInput();
    }
  }

  void _onBackspacePressed() {
    if (_isProcessing) return;

    HapticFeedback.selectionClick();

    setState(() {
      if (_isConfirming) {
        if (_confirmPin.isNotEmpty) {
          _confirmPin = _confirmPin.substring(0, _confirmPin.length - 1);
        }
      } else {
        if (_enteredPin.isNotEmpty) {
          _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
        }
      }
    });
  }

  void _processPinInput() async {
    setState(() => _isProcessing = true);

    await Future.delayed(const Duration(milliseconds: 300));

    if (widget.isChanging && _isVerifyingCurrent) {
      // Verify current PIN
      if (AppLock.of(context).unlock(_enteredPin)) {
        setState(() {
          _isVerifyingCurrent = false;
          _enteredPin = '';
          _isProcessing = false;
        });
      } else {
        HapticFeedback.heavyImpact();
        setState(() {
          _errorText = 'Wrong PIN entered';
          _enteredPin = '';
          _isProcessing = false;
        });
      }
    } else if (_isConfirming) {
      // Confirm PIN
      if (_enteredPin == _confirmPin) {
        await AppLock.of(context).changePincode(_enteredPin);
        HapticFeedback.mediumImpact();

        if (mounted) {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).success,
            message: widget.isChanging
                ? L10n.of(context).pinChangedSuccessfully
                : L10n.of(context).pinSetSuccessfully,
            type: SnackbarType.success,
          );

          Navigator.of(context).pop(true);
        }
      } else {
        HapticFeedback.heavyImpact();
        setState(() {
          _errorText = 'PINs do not match';
          _confirmPin = '';
          _isProcessing = false;
        });
      }
    } else {
      // First PIN entry
      setState(() {
        _isConfirming = true;
        _isProcessing = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isVerifyingCurrent = widget.isChanging;
  }

  @override
  Widget build(BuildContext context) {
    final currentPin = _isConfirming ? _confirmPin : _enteredPin;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(71, 84, 255, 0.6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.screenHeight - 100,
            ),
            child: Column(
              children: [
                SizedBox(height: context.percentHeight * 8),

                // Title
                Text(
                  _title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.percentWidth * 6,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: context.percentHeight * 5),

                // PIN Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    final isFilled = index < currentPin.length;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(
                          horizontal: context.percentWidth * 2.5),
                      width: context.percentWidth * 4,
                      height: context.percentWidth * 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isProcessing && isFilled
                            ? Colors.amber
                            : isFilled
                                ? Colors.white
                                : Colors.white.withOpacity(0.3),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: context.percentHeight * 2),

                // Error Text
                Container(
                  height: context.percentHeight * 4,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.percentWidth * 8),
                  child: _errorText != null
                      ? Text(
                          _errorText!,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: context.percentWidth * 3.5,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox(),
                ),

                SizedBox(height: context.percentHeight * 5),

                // Number Pad
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.percentWidth * 8),
                  child: Column(
                    children: [
                      _buildNumberRow(['1', '2', '3']),
                      _buildNumberRow(['4', '5', '6']),
                      _buildNumberRow(['7', '8', '9']),
                      _buildNumberRow(['', '0', 'backspace']),
                    ],
                  ),
                ),

                SizedBox(height: context.percentHeight * 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberRow(List<String> numbers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers.map((number) {
          if (number.isEmpty) {
            return SizedBox(
              width: context.percentWidth * 15,
              height: context.percentWidth * 15,
            );
          }

          if (number == 'backspace') {
            return _buildNumberButton(
              child: Icon(
                Icons.backspace_outlined,
                color: Colors.white,
                size: context.percentWidth * 5,
              ),
              onPressed: _onBackspacePressed,
            );
          }

          return _buildNumberButton(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth * 5,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => _onNumberPressed(number),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNumberButton({
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _isProcessing ? null : onPressed,
        borderRadius: BorderRadius.circular(35),
        child: Container(
          width: context.percentWidth * 15,
          height: context.percentWidth * 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
