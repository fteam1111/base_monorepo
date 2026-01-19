import 'package:core/core.dart';
import 'package:customer_app/di/injector.dart';
import 'package:design_system/design_system.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_home/features_home.dart';
import 'package:features_onboarding/features_onboarding.dart';
import 'package:features_splash/features_splash.dart';
import 'package:features_user/features_user.dart';
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

    locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    // Repositories
    // Using mock auth in development - switch to remote when you have real API
    locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: locator<AuthRemoteDataSource>(),
        // Uncomment when using real API/ Comment out when using real API
        tokenStorage: locator<TokenStorage>(),
      ),
    );

    locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator<UserRemoteDataSource>()),
    );

    // Locale Repository
    locator.registerLazySingleton<LocaleRepository>(
      () => LocaleRepositoryImpl(locator<LocaleStorage>()),
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

    locator.registerLazySingleton<GetUserByIdUseCase>(
      () => GetUserByIdUseCase(locator<UserRepository>()),
    );

    // Localization Use Cases
    locator.registerLazySingleton<GetSavedLocaleUseCase>(
      () => GetSavedLocaleUseCase(locator<LocaleRepository>()),
    );

    locator.registerLazySingleton<SaveLocaleUseCase>(
      () => SaveLocaleUseCase(locator<LocaleRepository>()),
    );

    // ==================== Features Home ====================

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

    // ==================== Features Onboarding ====================

    // // Onboarding Local Data Source
    locator.registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSource(locator<SharedPreferences>()),
    );

    // Onboarding Repository
    locator.registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(locator<OnboardingLocalDataSource>()),
    );

    // Onboarding Use Cases
    locator.registerLazySingleton<CompleteOnboardingUseCase>(
      () => CompleteOnboardingUseCase(locator<OnboardingRepository>()),
    );

    locator.registerLazySingleton<CheckOnboardingStatusUseCase>(
      () => CheckOnboardingStatusUseCase(locator<OnboardingRepository>()),
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

    // Network Test BLoC - Factory
    locator.registerFactory<NetworkTestBloc>(
      () => NetworkTestBloc(
        runNetworkTestsUseCase: locator<RunNetworkTestsUseCase>(),
      ),
    );

    // Splash BLoC - Factory
    locator.registerFactory<SplashBloc>(
      () => SplashBloc(
        initializeAppUseCase: locator<InitializeAppUseCase>(),
        checkAuthStatusUseCase: locator<CheckAuthStatusUseCase>(),
      ),
    );

    // Onboarding BLoC - Factory
    locator.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(
        repository: locator<OnboardingRepository>(),
        completeOnboardingUseCase: locator<CompleteOnboardingUseCase>(),
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
