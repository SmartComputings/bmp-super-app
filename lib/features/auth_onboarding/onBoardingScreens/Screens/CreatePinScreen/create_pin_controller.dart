import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/widgets/app_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PinScreenMode { create, confirm, unlock, verifyCurrentForChange }

class CreatePinController extends ChangeNotifier {
  PinScreenMode _currentMode = PinScreenMode.create;
  String _firstPin = '';
  String _currentPin = '';
  bool _isProcessing = false;
  String? _errorText;
  int _coolDownSeconds = 5;
  bool _inputBlocked = false;
  final bool isChanging;
  final bool isUnlockMode;
  final Function(String)? onPinConfirmed;
  final Function(String)? onPinUnlock;
  final Function(String)? onPinVerify;

  CreatePinController({
    this.isChanging = false,
    this.isUnlockMode = false,
    this.onPinConfirmed,
    this.onPinUnlock,
    this.onPinVerify,
  }) {
    if (isUnlockMode) {
      _currentMode = PinScreenMode.unlock;
    } else if (isChanging) {
      _currentMode = PinScreenMode.verifyCurrentForChange;
    } else {
      _currentMode = PinScreenMode.create;
    }
  }

  // Getters
  PinScreenMode get currentMode => _currentMode;
  String get currentPin => _currentPin;
  bool get isProcessing => _isProcessing;
  String? get errorText => _errorText;
  bool get inputBlocked => _inputBlocked;

  String getTitle(BuildContext context) {
    switch (_currentMode) {
      case PinScreenMode.create:
        return L10n.of(context).createPinCode;
      case PinScreenMode.confirm:
        return L10n.of(context).financeConfirmPIN;
      case PinScreenMode.unlock:
        return L10n.of(context).pleaseEnterYourPin;
      case PinScreenMode.verifyCurrentForChange:
        return L10n.of(context).pleaseEnterYourPin;
    }
  }

  String getSubtitle(BuildContext context) {
    switch (_currentMode) {
      case PinScreenMode.create:
        return L10n.of(context).enter4DigitPin;
      case PinScreenMode.confirm:
        return L10n.of(context).reEnter4DigitPin;
      case PinScreenMode.unlock:
        return L10n.of(context).enterPinToUnlock;
      case PinScreenMode.verifyCurrentForChange:
        return L10n.of(context).enterCurrentPinToChange;
    }
  }

  void onNumberPressed(String number, BuildContext context) {
    if (_inputBlocked || _isProcessing || _currentPin.length >= 4) return;
    
    HapticFeedback.lightImpact();
    
    _currentPin += number;
    _errorText = null;
    notifyListeners();
    
    if (_currentPin.length == 4) {
      _isProcessing = true;
      notifyListeners();
      
      Future.delayed(const Duration(milliseconds: 300), () {
        _processPinInput(context);
      });
    }
  }

  void onBackspacePressed() {
    if (_inputBlocked || _isProcessing || _currentPin.isEmpty) return;
    
    HapticFeedback.selectionClick();
    
    _currentPin = _currentPin.substring(0, _currentPin.length - 1);
    notifyListeners();
  }

  void _processPinInput(BuildContext context) async {
    switch (_currentMode) {
      case PinScreenMode.create:
        _handleCreateMode();
        break;
      case PinScreenMode.confirm:
        await _handleConfirmMode(context);
        break;
      case PinScreenMode.unlock:
        await _handleUnlockMode(context);
        break;
      case PinScreenMode.verifyCurrentForChange:
        await _handleVerifyCurrentMode(context);
        break;
    }
  }

  void _handleCreateMode() {
    _firstPin = _currentPin;
    _currentMode = PinScreenMode.confirm;
    _currentPin = '';
    _isProcessing = false;
    notifyListeners();
  }

  Future<void> _handleConfirmMode(BuildContext context) async {
    if (_firstPin == _currentPin) {
      // PINs match, save to AppLock
      onPinConfirmed?.call(_currentPin);
      HapticFeedback.mediumImpact();
    } else {
      // PINs don't match
      HapticFeedback.heavyImpact();
      _errorText = L10n.of(context).pinsDoNotMatch;
      _currentPin = '';
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> _handleUnlockMode(BuildContext context) async {
    if (onPinUnlock?.call(_currentPin) == true) {
      HapticFeedback.mediumImpact();
      _inputBlocked = false;
      _isProcessing = false;
      _errorText = null;
      _currentPin = '';
      notifyListeners();
    } else {
      HapticFeedback.heavyImpact();
      _errorText = L10n.of(context).wrongPinEnteredWithCooldown(_coolDownSeconds);
      _inputBlocked = true;
      _isProcessing = false;
      _currentPin = '';
      notifyListeners();
      
      Future.delayed(Duration(seconds: _coolDownSeconds)).then((_) {
        _inputBlocked = false;
        _coolDownSeconds = (_coolDownSeconds * 2).clamp(5, 30);
        _errorText = null;
        notifyListeners();
      });
    }
  }

  Future<void> _handleVerifyCurrentMode(BuildContext context) async {
    if (onPinVerify?.call(_currentPin) == true) {
      _currentMode = PinScreenMode.create;
      _currentPin = '';
      _isProcessing = false;
      notifyListeners();
    } else {
      HapticFeedback.heavyImpact();
      _errorText = L10n.of(context).wrongPinEntered;
      _currentPin = '';
      _isProcessing = false;
      notifyListeners();
    }
  }


}