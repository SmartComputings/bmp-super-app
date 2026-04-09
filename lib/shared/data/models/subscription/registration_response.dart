import 'package:equatable/equatable.dart';

/// Response model for /stripe/customers/register API
/// Contains masked email and session info for OTP verification
class RegistrationResponse extends Equatable {
  final String maskedEmail;
  final String sessionId;
  final int expiresIn;

  const RegistrationResponse({
    required this.maskedEmail,
    required this.sessionId,
    required this.expiresIn,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      maskedEmail: json['email'] as String? ?? '',
      sessionId: json['sessionId'] as String? ?? '',
      expiresIn: json['expiresIn'] as int? ?? 300,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': maskedEmail,
      'sessionId': sessionId,
      'expiresIn': expiresIn,
    };
  }

  @override
  List<Object?> get props => [maskedEmail, sessionId, expiresIn];
}
