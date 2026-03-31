import 'dart:async';

import 'package:core/config/base_config.dart';
import 'package:customer_app/di/injector.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_dashboard/features_dashboard.dart';
import 'package:features_delivery_order/features_delivery_order.dart';
import 'package:features_home/features_home.dart';
import 'package:features_map/features_map.dart';
import 'package:features_parking_history/features_parking_history.dart';
import 'package:features_parking_location/features_parking_location.dart';
import 'package:features_qr_scanner/features_qr_scanner.dart';
import 'package:features_splash/features_splash.dart';
import 'package:features_vehicle/features_vehicle.dart';
import 'package:features_vehicle_charging/features_vehicle_charging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share/share.dart';
import 'package:upgrader/upgrader.dart';

/// GoRouter configuration for the entire app
/// Provides type-safe navigation, deep linking, and URL support
class AppRouter {
  /// Create and configure GoRouter instance
  static GoRouter createRouter({
    required AuthBloc authBloc,
    required Upgrader upgrader,
    String? initialLocation,
  }) {
    return GoRouter(
      debugLogDiagnostics: true,
      observers: [MyNavigatorObserver()],
      initialLocation: initialLocation ?? AppRoutes.splashPath,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),

      // Redirect logic for authentication guards
      redirect: (context, state) {
        final authState = authBloc.state;
        final isAuthenticated = authState is AuthAuthenticated;
        final isLoading = authState is AuthInitial || authState is AuthLoading;
        final currentLocation = state.matchedLocation;

        // Don't redirect during loading or initial state
        if (isLoading) {
          return null;
        }

        // Allow splash
        if (currentLocation == AppRoutes.splashPath) {
          return null;
        }

        // Allow login page for unauthenticated users
        if (currentLocation == AppRoutes.loginPath) {
          if (isAuthenticated) {
            return AppRoutes.dashboardPath;
          }
          return null;
        }

        // Protect all other routes - require authentication
        if (!isAuthenticated) {
          return AppRoutes.loginPath;
        }

        return null; // No redirect needed
      },

      // Error handling
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Error'), backgroundColor: Colors.red),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Route not found: ${state.matchedLocation}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.homePath),
                icon: const Icon(Icons.home),
                label: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),

      // Route definitions
      routes: [
        // ==================== Dashboard Shell ====================
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashboardShellPage(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.dashboardPath,
                  name: AppRoutes.dashboard,
                  redirect: (context, state) => AppRoutes.homePath,
                ),
                GoRoute(
                  path: AppRoutes.homePath,
                  name: AppRoutes.home,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomePage(),
                    name: AppRoutes.home,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.parkingHistoryPath,
                  name: AppRoutes.parkingHistory,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ParkingHistoryPage(),
                    name: AppRoutes.parkingHistory,
                  ),
                ),
              ],
            ),
          ],
        ),

        GoRoute(
          path: AppRoutes.vehicleDetailPath,
          name: AppRoutes.vehicleDetail,
          pageBuilder: (context, state) {
            final vehicle = state.extra as VehicleEntity?;
            return _buildPageWithTransition(
              key: state.pageKey,
              name: AppRoutes.vehicleDetail,
              child: VehicleDetailPage(vehicle: vehicle),
            );
          },
        ),

        GoRoute(
          path: AppRoutes.chooseParkingLocationPath,
          name: AppRoutes.chooseParkingLocation,
          pageBuilder: (context, state) => _buildPageWithTransition(
            key: state.pageKey,
            name: AppRoutes.chooseParkingLocation,
            child: const ChooseParkingLocationPage(),
          ),
        ),

        GoRoute(
          path: AppRoutes.factoryMapPath,
          name: AppRoutes.factoryMap,
          pageBuilder: (context, state) => _buildPageWithTransition(
            key: state.pageKey,
            name: AppRoutes.factoryMap,
            child: const FactoryMapPage(),
          ),
        ),

        // ==================== Splash Route ====================
        GoRoute(
          path: AppRoutes.splashPath,
          name: AppRoutes.splash,
          pageBuilder: (context, state) => _buildPageWithTransition(
            key: state.pageKey,
            name: AppRoutes.splash,
            child: BlocProvider(
              create: (_) => locator<SplashBloc>(),
              child: const SplashPage(),
            ),
          ),
        ),

        // ==================== Auth Routes ====================
        GoRoute(
          path: AppRoutes.loginPath,
          name: AppRoutes.login,
          pageBuilder: (context, state) => _buildPageWithTransition(
            key: state.pageKey,
            name: AppRoutes.login,
            child: BlocProvider.value(
              value: context.read<AuthBloc>(),
              child: LoginPage(
                baseUrl: locator<BaseConfig>().baseUrl,
                loginUrl: locator<BaseConfig>().loginUrl,
              ),
            ),
          ),
        ),

        // ==================== DO Routes ====================
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) =>
                  locator<DeliveryListBloc>()..add(const DeliveryListStarted()),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: AppRoutes.doListPath,
              name: AppRoutes.doList,
              pageBuilder: (context, state) => _buildPageWithTransition(
                key: state.pageKey,
                name: AppRoutes.doList,
                child: const DeliveryListPage(),
              ),
            ),
          ],
        ),

        GoRoute(
          path: AppRoutes.doDetailPath,
          name: AppRoutes.doDetail,
          pageBuilder: (context, state) {
            final deliveryOrder = state.extra! as DeliveryOrderEntity;
            return _buildPageWithTransition(
              key: state.pageKey,
              name: AppRoutes.doDetail,
              child: BlocProvider(
                create: (_) => locator<DeliveryDetailBloc>()
                  ..add(DeliveryDetailStarted(deliveryOrder: deliveryOrder)),
                child: const DeliveryDetailPage(),
              ),
            );
          },
        ),

        // ==================== Vehicle Charging Routes ====================
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) =>
                  locator<VehicleChargingBloc>()
                    ..add(const VehicleChargingStarted()),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: AppRoutes.vehicleChargingPath,
              name: AppRoutes.vehicleCharging,
              pageBuilder: (context, state) => _buildPageWithTransition(
                key: state.pageKey,
                name: AppRoutes.vehicleCharging,
                child: const VehicleChargingPage(),
              ),
            ),
            GoRoute(
              path:
                  '${AppRoutes.vehicleChargingPath}/${AppRoutes.dischargingResultPath}',
              name: AppRoutes.dischargingResult,
              pageBuilder: (context, state) {
                final item = state.extra! as VehicleChargingEntity;
                return _buildPageWithTransition(
                  key: state.pageKey,
                  name: AppRoutes.dischargingResult,
                  child: DischargingResultPage(item: item),
                );
              },
            ),
          ],
        ),

        // ==================== QR Scanner Routes ====================
        GoRoute(
          path: AppRoutes.qrScannerPath,
          name: AppRoutes.qrScanner,
          pageBuilder: (context, state) {
            final onVehicleFound = state.extra as void Function(VehicleEntity)?;
            return _buildPageWithTransition(
              key: state.pageKey,
              name: AppRoutes.qrScanner,
              child: BlocProvider(
                create: (_) => locator<QrScanCubit>(),
                child: QrScannerPage(onVehicleFound: onVehicleFound),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Build page with custom transition animation
  static Page<dynamic> _buildPageWithTransition({
    required LocalKey key,
    required Widget child,
    required String name,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Fade transition
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }

  /// Build page with slide transition
  // ignore: unused_element
  static Page<dynamic> _buildPageWithSlideTransition({
    required LocalKey key,
    required Widget child,
    required String name,
    bool fromRight = true,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = fromRight
            ? const Offset(1.0, 0.0)
            : const Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  /// Build page with no transition (instant)
  // ignore: unused_element
  static Page<dynamic> _buildPageWithNoTransition({
    required LocalKey key,
    required Widget child,
    required String name,
  }) {
    return NoTransitionPage(key: key, child: child, name: name);
  }
}

/// Helper class to convert a Stream into a Listenable for GoRouter
/// This allows the router to refresh when the auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
