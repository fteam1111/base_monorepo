import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Global logger instance với cấu hình sẵn
///
/// Logger sẽ tự động tắt trong release mode để tối ưu performance
///
/// Ví dụ:
/// ```dart
/// // Log thông thường
/// logger.d('Debug message');
/// logger.i('Info message');
/// logger.w('Warning message');
/// logger.e('Error message', error: exception, stackTrace: stackTrace);
///
/// // Log với tag
/// logger.d('User logged in', tag: 'Auth');
///
/// // Log object
/// logger.d({'userId': 123, 'name': 'John'});
///
/// // Log trong try-catch
/// try {
///   // Some code
/// } catch (e, stackTrace) {
///   logger.e('Error occurred', error: e, stackTrace: stackTrace);
/// }
/// ```
///
/// Các level log:
/// - `logger.t()` - Trace (chi tiết nhất)
/// - `logger.d()` - Debug
/// - `logger.i()` - Info
/// - `logger.w()` - Warning
/// - `logger.e()` - Error
/// - `logger.f()` - Fatal
final Logger logger = Logger(
  printer: PrettyPrinter(
    // dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
  level: kReleaseMode ? Level.off : Level.trace,
);
