import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Centralized app routes for the entire application
/// All feature modules should register their routes here
///
/// Using go_router path-based routing:
/// - Use paths with parameters: '/user/:id'
/// - Use query parameters: '/search?q=term'
/// - Nested routes use relative paths
class AppRoutes {
  // ==================== Route Names (for go_router) ====================

  // Splash & Onboarding Routes
  static const String splash = 'splash';

  // Dashboard Routes
  static const String dashboard = 'dashboard';

  // Home Routes
  static const String home = 'home';
  static const String parkingHistory = 'parking-history';
  static const String vehicleDetail = 'vehicle-detail';
  static const String chooseParkingLocation = 'choose-parking-location';

  // Auth Routes
  static const String login = 'login';

  // DO Routes
  static const String doList = 'do-list';
  static const String doDetail = 'do-detail';

  // ==================== Route Paths ====================

  // Root paths
  static const String splashPath = '/';
  static const String dashboardPath = '/dashboard';
  static const String homePath = '/home';
  static const String parkingHistoryPath = '/parking-history';
  static const String vehicleDetailPath = '/vehicle-detail';
  static const String chooseParkingLocationPath = '/choose-parking-location';
  static const String loginPath = '/login';
  static const String doListPath = '/do-list';
  static const String doDetailPath = '/do-detail';

  // ==================== Route Parameters ====================

  /// Keys for route arguments
  static const String userIdParam = 'userId';

  // ==================== Navigation Helpers (go_router) ====================
  // Note: These methods now require GoRouter to be accessible
  // Import: import 'package:go_router/go_router.dart';

  /// Navigate to splash page (replace all)
  static void navigateToSplash(BuildContext context) {
    context.go(splashPath);
  }

  /// Navigate to dashboard (replace all)
  static void navigateToDashboard(BuildContext context) {
    context.go(dashboardPath);
  }

  /// Navigate to home tab (replace all)
  static void navigateToHome(BuildContext context) {
    context.go(homePath);
  }

  /// Navigate to login page (replace all)
  static void navigateToLogin(BuildContext context) {
    context.go(loginPath);
  }

  static void navigateToVehicleDetail(BuildContext context) {
    context.push(vehicleDetailPath);
  }

  static void navigateToChooseParkingLocation(BuildContext context) {
    context.push(chooseParkingLocationPath);
  }

  static void navigateToDeliveryOrderList(BuildContext context) {
    context.push(doListPath);
  }

  static void navigateToDeliveryOrderDetail(BuildContext context) {
    context.push(doDetail);
  }

  /// Navigate back
  static void navigateBack(BuildContext context) {
    context.pop();
  }

  /// Check if can pop
  static bool canPop(BuildContext context) {
    return context.canPop();
  }

  /// Go to named route with parameters
  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Push named route with parameters
  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    context.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
