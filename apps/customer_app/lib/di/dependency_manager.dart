import 'package:core/core.dart';
import 'package:core/factory/bloc/factory_cubit.dart';
import 'package:core/factory/data/datasources/remote/factory_remote_datasource.dart';
import 'package:core/factory/data/repositories/factory_repository_impl.dart';
import 'package:core/factory/domain/repositories/factory_repository.dart';
import 'package:core/factory/domain/usecases/get_client_factories_usecase.dart';
import 'package:core/role/bloc/user_role_cubit.dart';
import 'package:core/role/data/datasources/remote/role_remote_datasource.dart';
import 'package:core/role/data/repositories/user_role_repository_impl.dart';
import 'package:core/role/domain/repositories/user_role_repository.dart';
import 'package:core/role/domain/usecases/get_client_roles_usecase.dart';
import 'package:customer_app/di/injector.dart';
import 'package:design_system/design_system.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_map/features_map.dart';
import 'package:features_splash/features_splash.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/localization.dart';
import 'package:network/network.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

class DependencyManager {
  static Future<void> inject(BaseConfig config) async {
    await configureDependencies();

    locator.registerLazySingleton<BaseConfig>(() => config);

    locator.registerLazySingleton(() {
      final isProd = locator<BaseConfig>().flavor == AppFlavor.prod;

      return Upgrader(
        messages: UpgraderLocalizationMessage(),
        debugLogging: !isProd,
        debugDisplayAlways: !isProd,
        debugDisplayOnce: !isProd,
        countryCode: 'US',
        languageCode: 'en',
      );
    });

    // ==================== Firebase ====================
    locator.registerLazySingleton(
      () => FirebaseAnalyticsService(
        analytics: FirebaseAnalytics.instance,
        observer: FirebaseAnalyticsObserver(
          analytics: FirebaseAnalytics.instance,
        ),
      ),
    );

    locator.registerLazySingleton(
      () =>
          FirebaseCrashlyticsService(crashlytics: FirebaseCrashlytics.instance),
    );

    locator.registerLazySingleton(() => LocalNotificationService());

    locator.registerLazySingleton(
      () => RemoteConfigService(
        firebaseCrashlyticsService: locator<FirebaseCrashlyticsService>(),
      ),
    );

    // ==================== Data Layer ====================
    locator.registerLazySingleton(() => PerformanceMonitorService());

    locator.registerLazySingleton(
      () => PerformanceInterceptor(
        performanceMonitorService: locator<PerformanceMonitorService>(),
      ),
    );

    locator.registerLazySingleton<DioHttpClientBuilder>(
      () => DioHttpClientBuilder(
        config: locator<BaseConfig>(),
        interceptorsBuilder: (dio) => [
          locator<PerformanceInterceptor>(),
        ], // Thêm các interceptor tùy chỉnh
      ),
    );

    // Data Sources
    locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<RoleRemoteDataSource>(
      () => RoleRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<FactoryRemoteDataSource>(
      () => FactoryRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    // Repositories
    locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: locator<AuthRemoteDataSource>(),
        // Uncomment when using real API/ Comment out when using real API
        tokenStorage: locator<TokenStorage>(),
      ),
    );

    // Locale Repository
    locator.registerLazySingleton<LocaleRepository>(
      () => LocaleRepositoryImpl(locator<LocaleStorage>()),
    );

    locator.registerLazySingleton<UserRoleRepository>(
      () => UserRoleRepositoryImpl(locator<RoleRemoteDataSource>()),
    );

    locator.registerLazySingleton<FactoryRepository>(
      () => FactoryRepositoryImpl(locator<FactoryRemoteDataSource>()),
    );

    // ==================== Domain Layer ====================

    // Use Cases
    locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(locator<AuthRepository>()),
    );

    locator.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(locator<AuthRepository>()),
    );

    locator.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(locator<AuthRepository>()),
    );

    locator.registerLazySingleton<GetClientRolesUseCase>(
      () => GetClientRolesUseCase(locator<UserRoleRepository>()),
    );

    locator.registerLazySingleton<GetClientFactoriesUseCase>(
      () => GetClientFactoriesUseCase(locator<FactoryRepository>()),
    );

    // Localization Use Cases
    locator.registerLazySingleton<GetSavedLocaleUseCase>(
      () => GetSavedLocaleUseCase(locator<LocaleRepository>()),
    );

    locator.registerLazySingleton<SaveLocaleUseCase>(
      () => SaveLocaleUseCase(locator<LocaleRepository>()),
    );

    // ==================== Features Splash ====================
    // // App Init Data Source
    locator.registerLazySingleton<AppInitDataSource>(
      () => AppInitDataSource(
        locator<TokenStorage>(),
        locator<SharedPreferences>(),
      ),
    );

    // App Initialization Repository
    locator.registerLazySingleton<AppInitializationRepository>(
      () => AppInitializationRepositoryImpl(locator<AppInitDataSource>()),
    );

    // App Initialization Use Cases
    locator.registerLazySingleton<InitializeAppUseCase>(
      () => InitializeAppUseCase(locator<AppInitializationRepository>()),
    );

    locator.registerLazySingleton<CheckAuthStatusUseCase>(
      () => CheckAuthStatusUseCase(locator<AppInitializationRepository>()),
    );

    // ==================== Presentation Layer ====================

    // Auth BLoC - Singleton (same instance throughout app lifecycle)
    // This is critical for maintaining authentication state across the app
    locator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        loginUseCase: locator<LoginUseCase>(),
        logoutUseCase: locator<LogoutUseCase>(),
        getCurrentUserUseCase: locator<GetCurrentUserUseCase>(),
      ),
    );

    // Splash BLoC - Factory
    locator.registerFactory<SplashBloc>(
      () => SplashBloc(
        initializeAppUseCase: locator<InitializeAppUseCase>(),
        checkAuthStatusUseCase: locator<CheckAuthStatusUseCase>(),
      ),
    );

    // Localization BLoC - Singleton (persists language selection)
    locator.registerLazySingleton<LocalizationBloc>(
      () => LocalizationBloc(
        getSavedLocaleUseCase: locator<GetSavedLocaleUseCase>(),
        saveLocaleUseCase: locator<SaveLocaleUseCase>(),
      ),
    );

    // Theme Cubit - Singleton (persists theme selection)
    locator.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(locator<ThemeStorage>()),
    );

    // UserRole Cubit - Singleton
    locator.registerLazySingleton<UserRoleCubit>(
      () => UserRoleCubit(locator<GetClientRolesUseCase>()),
    );

    // Factory Cubit - Singleton
    locator.registerLazySingleton<FactoryCubit>(
      () => FactoryCubit(locator<GetClientFactoriesUseCase>()),
    );

    // Map BLoC - Factory (new instance per page)
    locator.registerFactory<MapBloc>(() => MapBloc());

    // Deep Linking
    locator.registerLazySingleton(() => DeepLinkingService());

    locator.registerLazySingleton(
      () => DeepLinkingRepositoryImpl(service: locator<DeepLinkingService>()),
    );

    locator.registerLazySingleton(
      () => DeepLinkBloc(repository: locator<DeepLinkingRepositoryImpl>()),
    );
  }
}
