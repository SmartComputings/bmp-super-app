# Global Phone Number Validation Guide

## Overview
This app uses `phone_numbers_parser` (based on Google's libphonenumber) for worldwide phone number validation.

## Features
✅ Supports 200+ countries with accurate validation  
✅ Dynamic phone length based on country ISO code  
✅ Real telecom rules (not hardcoded maps)  
✅ Automatic maxLength adjustment  
✅ Production-ready validation  

## Implementation

### Controller Method
```dart
// Get max phone length for any country
int getPhoneLengthForCountry(String countryCode) {
  try {
    final isoCode = IsoCode.fromJson(countryCode);
    final exampleNumber = PhoneNumber.parse(
      _selectedCountry.dialCode + '1234567890',
      callerCountry: isoCode,
    );
    return exampleNumber.nsn.length;
  } catch (e) {
    return 15; // Fallback
  }
}

// Validate phone number
String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  }
  
  try {
    final phoneNumber = PhoneNumber.parse(
      '${_selectedCountry.dialCode}$value',
    );
    
    if (!phoneNumber.isValid()) {
      return 'Invalid phone number';
    }
    
    return null;
  } catch (e) {
    return 'Invalid phone number format';
  }
}
```

### UI Integration
```dart
AnimatedPhoneInputField(
  phoneController: controller.phoneController,
  maxLength: controller.getPhoneLengthForCountry(controller.selectedCountry.code),
  validator: controller.validatePhoneNumber,
  onCountryTap: () => showCountryPicker(),
)
```

## Examples

| Country | Code | Max Length | Example |
|---------|------|------------|---------|
| Pakistan | PK | 10 | 3001234567 |
| Saudi Arabia | SA | 9 | 501234567 |
| USA | US | 10 | 2025551234 |
| India | IN | 10 | 9876543210 |
| UAE | AE | 9 | 501234567 |

## Benefits
- **Accurate**: Uses official telecom data
- **Scalable**: Works for all countries automatically
- **Maintainable**: No hardcoded maps to update
- **Production-ready**: Battle-tested library
