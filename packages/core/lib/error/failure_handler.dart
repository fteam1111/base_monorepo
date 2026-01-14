import 'package:core/error/api_failures.dart';
import 'package:core/error/exception.dart';
import 'package:core/utils/logger.dart';
import 'package:dio/dio.dart';

class FailureHandler {
  static const String _tag = 'FailureHandler';

  static ApiFailure handleFailure(Object e, {String? context}) {
    try {
      // Log exception để debug
      logger.e(_tag, error: e, stackTrace: StackTrace.current);

      if (e is DioException) {
        return _handleDioException(e, context);
      } else if (e is ServerException) {
        return _handleServerException(e);
      } else if (e is CacheException) {
        return _handleCacheException(e);
      } else if (e is OtherException) {
        return _handleOtherException(e);
      } else {
        return _handleUnknownException(e);
      }
    } catch (handlingError) {
      logger.e(_tag, error: handlingError);
      return const ApiFailure.other('An unexpected error occurred');
    }
  }

  /// Xử lý DioException - tối ưu cho BaseInterceptor đã xử lý
  static ApiFailure _handleDioException(DioException e, String? context) {
    return _dioExceptionHandling(e);
  }

  /// Fallback xử lý DioException nếu BaseInterceptor chưa xử lý
  static ApiFailure _dioExceptionHandling(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiFailure.serverTimeout();

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = _extractErrorMessage(e.response?.data);

        if (statusCode != null) {
          return _mapStatusCodeToApiFailure(statusCode, message);
        }
        return ApiFailure.serverError(message);

      case DioExceptionType.cancel:
        return const ApiFailure.other('Request was cancelled');

      case DioExceptionType.connectionError:
        return const ApiFailure.noInternet();

      case DioExceptionType.badCertificate:
        return const ApiFailure.serverError('Invalid certificate');

      case DioExceptionType.unknown:
        final message = e.message ?? 'Unknown network error';
        if (message.toLowerCase().contains('timeout')) {
          return const ApiFailure.serverTimeout();
        }
        if (message.toLowerCase().contains('connection') ||
            message.toLowerCase().contains('network')) {
          return const ApiFailure.noInternet();
        }
        return ApiFailure.other(message);
    }
  }

  /// Map status code thành ApiFailure
  static ApiFailure _mapStatusCodeToApiFailure(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return _parseBadRequestError(message);
      case 401:
        return _parseUnauthorizedError(message);
      case 403:
        return _parseForbiddenError(message);
      case 404:
        return _parseNotFoundError(message);
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
        return const ApiFailure.serverError('Server error. Please try again later.');
      default:
        return ApiFailure.serverError(
          'Request failed with status $statusCode: $message',
        );
    }
  }

  /// Parse lỗi 400 - Bad Request
  static ApiFailure _parseBadRequestError(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('email') && lowerMessage.contains('invalid')) {
      return const ApiFailure.invalidEmailAndPasswordCombination();
    }
    if (lowerMessage.contains('password')) {
      return const ApiFailure.invalidEmailAndPasswordCombination();
    }

    return ApiFailure.serverError(message);
  }

  /// Parse lỗi 401 - Unauthorized
  static ApiFailure _parseUnauthorizedError(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('token') && lowerMessage.contains('expired')) {
      return const ApiFailure.tokenExpired();
    }
    if (lowerMessage.contains('invalid') && lowerMessage.contains('token')) {
      return const ApiFailure.refreshTokenInvalid();
    }
    if (lowerMessage.contains('authentication')) {
      return const ApiFailure.authenticationFailed();
    }

    return const ApiFailure.authenticationFailed();
  }

  /// Parse lỗi 403 - Forbidden
  static ApiFailure _parseForbiddenError(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('blocked')) {
      return const ApiFailure.accountBlocked();
    }
    if (lowerMessage.contains('locked')) {
      return const ApiFailure.accountLocked();
    }
    if (lowerMessage.contains('expired')) {
      return const ApiFailure.accountExpired();
    }

    return ApiFailure.serverError('Access forbidden: $message');
  }

  /// Parse lỗi 404 - Not Found
  static ApiFailure _parseNotFoundError(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('user') && lowerMessage.contains('not found')) {
      return const ApiFailure.userNotFound();
    }
    if (lowerMessage.contains('username')) {
      return const ApiFailure.userNameNotFound();
    }

    return const ApiFailure.userNotFound();
  }

  /// Xử lý ServerException
  static ApiFailure _handleServerException(ServerException e) {
    logger.e(_tag, error: e);
    return ApiFailure.serverError(e.message);
  }

  /// Xử lý CacheException
  static ApiFailure _handleCacheException(CacheException e) {
    logger.e(_tag, error: e);
    return ApiFailure.other('Cache error: ${e.message}');
  }

  /// Xử lý OtherException
  static ApiFailure _handleOtherException(OtherException e) {
    logger.e(_tag, error: e);
    return ApiFailure.other(e.message);
  }

  /// Xử lý unknown exception
  static ApiFailure _handleUnknownException(Object e) {
    logger.e(_tag, error: e);
    return ApiFailure.other('An unexpected error occurred: ${e.toString()}');
  }

  /// Extract error message từ response data
  static String _extractErrorMessage(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      return responseData['message'] as String? ??
          responseData['error'] as String? ??
          responseData['detail'] as String? ??
          'Unknown error';
    }

    if (responseData is String) {
      return responseData;
    }

    return 'Unknown error';
  }
}

extension FailureHandlerExtension on Object {
  /// Convert exception thành ApiFailure
  ApiFailure toApiFailure({String? context}) {
    return FailureHandler.handleFailure(this, context: context);
  }
}
