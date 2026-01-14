import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppFlavor { dev, uat, prod }

class BaseConfig {
  final AppFlavor flavor;

  final String contentType;
  final String contentTypeFormUrlEncoded;
  final int httpSendTimeout;
  final int httpConnectTimeout;
  final int httpReceiveTimeout;

  final Duration dateRangePickerDuration;

  final int defaultPageSize;

  final Map<String, int> pageSizes;

  final bool bypassNotificationPermission;

  String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  String get appName => dotenv.env['APP_NAME'] ?? '';

  String get packageName => dotenv.env['PACKAGE_NAME'] ?? '';

  const BaseConfig({
    required this.flavor,
    this.contentType = 'application/json',
    this.contentTypeFormUrlEncoded = 'application/x-www-form-urlencoded',
    this.httpSendTimeout = 30000,
    this.httpConnectTimeout = 30000,
    this.httpReceiveTimeout = 30000,
    this.dateRangePickerDuration = const Duration(days: 365),
    this.defaultPageSize = 20,
    this.pageSizes = const {},
    this.bypassNotificationPermission = false,
  });
}