import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const customLogPriority = 1;
  static const apiPriority = 96;
  static const connectivityPriority = 100;
  static const int maxRetriesDefault = 3;
  static const int retryDelayMillisecondsDefault = 500;

  /// The higher the value, the higher the priority
  /// priority higher, add first
  /// priority lower, add last
  int get priority;

  void handleErrorType(DioException err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}
