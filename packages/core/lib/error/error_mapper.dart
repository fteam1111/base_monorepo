import 'package:core/error/api_failures.dart';
import 'package:dio/dio.dart';

/// Mapper để convert server error response thành ApiFailure
class ErrorMapper {
  /// Map server error response thành ApiFailure
  static ApiFailure mapServerError(dynamic responseData, int? statusCode) {
    if (responseData is! Map<String, dynamic>) {
      return const ApiFailure.serverError('Invalid server response');
    }

    final message = _extractMessage(responseData);
    final errorCode = _extractErrorCode(responseData);

    // Map theo error code nếu có
    if (errorCode != null) {
      final mappedFailure = _mapByErrorCode(errorCode, message);
      if (mappedFailure != null) return mappedFailure;
    }

    // Map theo status code
    if (statusCode != null) {
      final mappedFailure = _mapByStatusCode(statusCode, message);
      if (mappedFailure != null) return mappedFailure;
    }

    // Map theo message content
    return _mapByMessage(message);
  }

  /// Extract message từ response data
  static String _extractMessage(Map<String, dynamic> data) {
    return data['message'] as String? ??
        data['error'] as String? ??
        data['detail'] as String? ??
        data['description'] as String? ??
        'Unknown error';
  }

  /// Extract error code từ response data
  static String? _extractErrorCode(Map<String, dynamic> data) {
    return data['code'] as String? ??
        data['error_code'] as String? ??
        data['errorCode'] as String?;
  }

  /// Map theo error code
  static ApiFailure? _mapByErrorCode(String errorCode, String message) {
    switch (errorCode.toUpperCase()) {
      case 'USER_NOT_FOUND':
        return const ApiFailure.userNotFound();
      case 'INVALID_CREDENTIALS':
      case 'INVALID_EMAIL_PASSWORD':
        return const ApiFailure.invalidEmailAndPasswordCombination();
      case 'ACCOUNT_LOCKED':
        return const ApiFailure.accountLocked();
      case 'ACCOUNT_EXPIRED':
        return const ApiFailure.accountExpired();
      case 'ACCOUNT_BLOCKED':
        return const ApiFailure.accountBlocked();
      case 'TOKEN_EXPIRED':
        return const ApiFailure.tokenExpired();
      case 'INVALID_TOKEN':
      case 'REFRESH_TOKEN_INVALID':
        return const ApiFailure.refreshTokenInvalid();
      case 'AUTHENTICATION_FAILED':
        return const ApiFailure.authenticationFailed();
      case 'PASSWORD_RESET_FAILED':
        return const ApiFailure.passwordResetFail();
      case 'USERNAME_NOT_FOUND':
        return const ApiFailure.userNameNotFound();
      case 'INVALID_DOMAIN':
        return const ApiFailure.invalidDomain();
      case 'LANGUAGE_CHANGE_FAILED':
        return const ApiFailure.languageChangeFail();
      case 'PHOTO_PERMISSION_DENIED':
        return const ApiFailure.photoPermissionFailed();
      case 'STORAGE_PERMISSION_DENIED':
        return const ApiFailure.storagePermissionFailed();
      case 'CAMERA_PERMISSION_DENIED':
        return const ApiFailure.cameraPermissionFailed(false);
      case 'CAMERA_PERMISSION_PERMANENTLY_DENIED':
        return const ApiFailure.cameraPermissionFailed(true);
      case 'DEVICE_NOT_SUPPORT_BIOMETRIC':
        return const ApiFailure.deviceNotSupportBiometric();
      case 'CANNOT_CHECK_BIOMETRICS':
        return const ApiFailure.cannotCheckBiometrics();
      case 'NO_SUPPORTED_BIOMETRICS':
        return const ApiFailure.noSupportedBiometrics();
      case 'INVALID_BIOMETRIC':
        return const ApiFailure.invalidBiometric();
      default:
        return null;
    }
  }

  /// Map theo status code
  static ApiFailure? _mapByStatusCode(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return ApiFailure.serverError('Bad request: $message');
      case 401:
        return const ApiFailure.authenticationFailed();
      case 403:
        if (message.toLowerCase().contains('blocked')) {
          return const ApiFailure.accountBlocked();
        }
        if (message.toLowerCase().contains('locked')) {
          return const ApiFailure.accountLocked();
        }
        return ApiFailure.serverError('Access forbidden: $message');
      case 404:
        if (message.toLowerCase().contains('user')) {
          return const ApiFailure.userNotFound();
        }
        return ApiFailure.serverError('Not found: $message');
      case 408:
        return const ApiFailure.serverTimeout();
      case 429:
        return const ApiFailure.serverError(
          'Too many requests. Please try again later.',
        );
      case 500:
      case 502:
      case 503:
      case 504:
        return const ApiFailure.serverError(
          'Server error. Please try again later.',
        );
      default:
        return null;
    }
  }

  /// Map theo message content
  static ApiFailure _mapByMessage(String message) {
    final lowerMessage = message.toLowerCase();

    // Authentication related
    if (lowerMessage.contains('invalid') && lowerMessage.contains('password')) {
      return const ApiFailure.invalidEmailAndPasswordCombination();
    }
    if (lowerMessage.contains('user') && lowerMessage.contains('not found')) {
      return const ApiFailure.userNotFound();
    }
    if (lowerMessage.contains('username') &&
        lowerMessage.contains('not found')) {
      return const ApiFailure.userNameNotFound();
    }
    if (lowerMessage.contains('account') && lowerMessage.contains('locked')) {
      return const ApiFailure.accountLocked();
    }
    if (lowerMessage.contains('account') && lowerMessage.contains('expired')) {
      return const ApiFailure.accountExpired();
    }
    if (lowerMessage.contains('account') && lowerMessage.contains('blocked')) {
      return const ApiFailure.accountBlocked();
    }
    if (lowerMessage.contains('token') && lowerMessage.contains('expired')) {
      return const ApiFailure.tokenExpired();
    }
    if (lowerMessage.contains('authentication') &&
        lowerMessage.contains('failed')) {
      return const ApiFailure.authenticationFailed();
    }

    // Permission related
    if (lowerMessage.contains('photo') && lowerMessage.contains('permission')) {
      return const ApiFailure.photoPermissionFailed();
    }
    if (lowerMessage.contains('storage') &&
        lowerMessage.contains('permission')) {
      return const ApiFailure.storagePermissionFailed();
    }
    if (lowerMessage.contains('camera') &&
        lowerMessage.contains('permission')) {
      final permanentlyDenied = lowerMessage.contains('permanently');
      return ApiFailure.cameraPermissionFailed(permanentlyDenied);
    }

    // Biometric related
    if (lowerMessage.contains('device') && lowerMessage.contains('biometric')) {
      return const ApiFailure.deviceNotSupportBiometric();
    }
    if (lowerMessage.contains('biometric') && lowerMessage.contains('check')) {
      return const ApiFailure.cannotCheckBiometrics();
    }
    if (lowerMessage.contains('biometric') &&
        lowerMessage.contains('support')) {
      return const ApiFailure.noSupportedBiometrics();
    }
    if (lowerMessage.contains('biometric') &&
        lowerMessage.contains('invalid')) {
      return const ApiFailure.invalidBiometric();
    }

    // Network related
    if (lowerMessage.contains('timeout')) {
      return const ApiFailure.serverTimeout();
    }
    if (lowerMessage.contains('connection') ||
        lowerMessage.contains('network')) {
      return const ApiFailure.noInternet();
    }
    if (lowerMessage.contains('poor') && lowerMessage.contains('connection')) {
      return const ApiFailure.poorConnection();
    }

    // Default fallback
    return ApiFailure.serverError(message);
  }
}

/// Extension để dễ dàng map DioException
extension DioExceptionMapper on DioException {
  /// Convert DioException thành ApiFailure
  ApiFailure toApiFailure() {
    if (type == DioExceptionType.badResponse && response?.data != null) {
      return ErrorMapper.mapServerError(response!.data, response!.statusCode);
    }

    // Fallback cho các loại DioException khác
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiFailure.serverTimeout();
      case DioExceptionType.connectionError:
        return const ApiFailure.noInternet();
      case DioExceptionType.cancel:
        return const ApiFailure.other('Request was cancelled');
      case DioExceptionType.badCertificate:
        return const ApiFailure.serverError('Invalid certificate');
      case DioExceptionType.unknown:
        return ApiFailure.other(message ?? 'Unknown network error');
      case DioExceptionType.badResponse:
        return ApiFailure.other(message ?? 'Unknown network error');
    }
  }
}
