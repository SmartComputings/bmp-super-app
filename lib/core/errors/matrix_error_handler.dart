import 'dart:convert';
import 'package:flutter/material.dart';
import '../localization/l10n.dart';

class BmpMatrixError {
  final String errcode;
  final String error;
  final int statusCode;

  BmpMatrixError({
    required this.errcode,
    required this.error,
    required this.statusCode,
  });

  factory BmpMatrixError.fromResponse(dynamic response) {
    try {
      final body = response.body is String ? response.body : jsonEncode(response.body);
      final data = jsonDecode(body);
      return BmpMatrixError(
        errcode: data['errcode'] ?? 'M_UNKNOWN',
        error: data['error'] ?? 'Unknown error occurred',
        statusCode: response.statusCode ?? 500,
      );
    } catch (e) {
      return BmpMatrixError(
        errcode: 'M_UNKNOWN',
        error: 'Failed to parse error response',
        statusCode: response.statusCode ?? 500,
      );
    }
  }
}

class MatrixErrorHandler {
  static String getErrorMessage(BmpMatrixError error, BuildContext context) {
    final l10n = L10n.of(context)!;
    switch (error.errcode) {
      case 'M_FORBIDDEN':
        return 'Access denied. You don\'t have permission for this action.';
      case 'M_UNKNOWN_TOKEN':
        return 'Session expired. Please log in again.';
      case 'M_MISSING_TOKEN':
        return 'Authentication required. Please log in.';
      case 'M_BAD_JSON':
        return 'Invalid request format. Please try again.';
      case 'M_NOT_JSON':
        return 'Invalid request. Please try again.';
      case 'M_NOT_FOUND':
        return 'Requested resource not found.';
      case 'M_LIMIT_EXCEEDED':
        return 'Too many requests. Please wait before trying again.';
      case 'M_UNAUTHORIZED':
        return 'Unauthorized access. Please check your credentials.';
      case 'M_USER_DEACTIVATED':
        return 'Account has been deactivated.';
      case 'M_TOO_LARGE':
        return 'Request too large. Please reduce the size and try again.';
      case 'M_SERVER_NOT_TRUSTED':
        return 'Server connection not trusted.';
      case 'M_USER_IN_USE':
        return 'Username is already taken. Please choose a different username.';
      case 'M_THREEPID_IN_USE':
      case 'M_EMAIL_IN_USE':
        return l10n.emailAlreadyRegistered;
      case 'M_UNKNOWN':
      default:
        return error.error.isNotEmpty ? error.error : 'An unexpected error occurred. Please try again.';
    }
  }

  static String getErrorTitle(BmpMatrixError error, BuildContext context) {
    final l10n = L10n.of(context)!;
    switch (error.errcode) {
      case 'M_FORBIDDEN':
        return 'Access Denied';
      case 'M_UNKNOWN_TOKEN':
      case 'M_MISSING_TOKEN':
        return 'Authentication Required';
      case 'M_BAD_JSON':
      case 'M_NOT_JSON':
        return 'Invalid Request';
      case 'M_NOT_FOUND':
        return 'Not Found';
      case 'M_LIMIT_EXCEEDED':
        return 'Rate Limited';
      case 'M_UNAUTHORIZED':
        return 'Unauthorized';
      case 'M_USER_DEACTIVATED':
        return 'Account Deactivated';
      case 'M_TOO_LARGE':
        return 'Request Too Large';
      case 'M_SERVER_NOT_TRUSTED':
        return 'Server Error';
      case 'M_USER_IN_USE':
        return 'Username Taken';
      case 'M_THREEPID_IN_USE':
      case 'M_EMAIL_IN_USE':
        return l10n.emailAlreadyExist;
      case 'M_UNKNOWN':
      default:
        return 'Error';
    }
  }

  static bool isRetryable(BmpMatrixError error) {
    switch (error.errcode) {
      case 'M_LIMIT_EXCEEDED':
      case 'M_UNKNOWN':
        return error.statusCode >= 500;
      default:
        return false;
    }
  }
}