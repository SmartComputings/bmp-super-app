class ErrorExtractor {
  static String extractMessage(Map<String, dynamic> responseData, [String defaultMessage = 'Unknown error']) {
    // PayCrypto Error Format at root: msg or message (highest priority)
    if (responseData['msg'] != null && responseData['msg'].toString().isNotEmpty) {
      return _decodeHtmlEntities(responseData['msg']);
    }
    
    // Source Key Error Format: error.source.key (highest priority for field-specific errors)
    if (responseData['error'] != null && 
        responseData['error'] is Map &&
        responseData['error']['source'] != null &&
        responseData['error']['source'] is Map &&
        responseData['error']['source']['key'] != null &&
        responseData['error']['source']['key'] is Map) {
      final sourceKey = responseData['error']['source']['key'] as Map<String, dynamic>;
      if (sourceKey.isNotEmpty) {
        // Combine all field errors: "field_name: error_message"
        final errorMessages = <String>[];
        for (final entry in sourceKey.entries) {
          final fieldName = entry.key.replaceAll('.', ' ').replaceAll('_', ' ');
          final errorValue = entry.value?.toString() ?? '';
          errorMessages.add('$fieldName $errorValue');
        }
        if (errorMessages.isNotEmpty) {
          return _decodeHtmlEntities(errorMessages.join(', '));
        }
      }
    }
    
    // OTP Error Format: error.error.message with remaining_attempts
    if (responseData['error'] != null && 
        responseData['error'] is Map && 
        responseData['error']['error'] != null &&
        responseData['error']['error'] is Map &&
        responseData['error']['error']['message'] != null) {
      var message = responseData['error']['error']['message'].toString();
      
      // Replace {remaining_attempts} placeholder
      if (message.contains('{remaining_attempts}') && 
          responseData['error']['error']['remaining_attempts'] != null) {
        final attempts = responseData['error']['error']['remaining_attempts'];
        message = message.replaceAll('{remaining_attempts}', attempts.toString());
      }
      
      return _decodeHtmlEntities(message);
    }
    
    // Validation Error Format: errors as List - errors[0].originalMessage or errors[0].message
    if (responseData['errors'] != null && responseData['errors'] is List) {
      final errors = responseData['errors'] as List;
      if (errors.isNotEmpty) {
        final errorMessages = <String>[];
        for (final error in errors) {
          if (error is Map) {
            // Prioritize originalMessage over message
            if (error['originalMessage'] != null) {
              errorMessages.add(_decodeHtmlEntities(error['originalMessage'].toString()));
            } else if (error['message'] != null) {
              errorMessages.add(_decodeHtmlEntities(error['message'].toString()));
            }
          }
        }
        if (errorMessages.isNotEmpty) {
          return errorMessages.join(', ');
        }
      }
    }
    
    // Error Format: errors as String (e.g., duplicate email error from backend)
    if (responseData['errors'] != null && responseData['errors'] is String) {
      String errorStr = responseData['errors'] as String;
      
      // Make duplicate email error more user-friendly
      if (errorStr.contains('Duplicate entry') && errorStr.contains('email')) {
        return 'This email is already registered. Please use a different email address.';
      }
      
      return _decodeHtmlEntities(errorStr);
    }
    
    // Standard Error Format: message
    if (responseData['message'] != null && responseData['message'].toString().isNotEmpty) {
      return _decodeHtmlEntities(responseData['message']);
    }
    
    // Bridge Error Format: error.message
    if (responseData['error'] != null) {
      if (responseData['error'] is String) {
        return _decodeHtmlEntities(responseData['error']);
      } else if (responseData['error'] is Map && responseData['error']['message'] != null) {
        return _decodeHtmlEntities(responseData['error']['message']);
      }
    }
    
    // PayCrypto Error Format: data.msg
    if (responseData['data'] != null && 
        responseData['data'] is Map && 
        responseData['data']['msg'] != null) {
      return _decodeHtmlEntities(responseData['data']['msg']);
    }
    
    return defaultMessage;
  }
  
  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('{remaining_attempts}', '0'); // Fallback if not replaced
  }
}