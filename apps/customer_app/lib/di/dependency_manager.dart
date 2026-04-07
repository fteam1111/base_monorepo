import 'package:core/core.dart';
import 'package:customer_app/di/injector.dart';
import 'package:design_system/design_system.dart';
import 'package:features_auth/features_auth.dart';
import 'package:features_delivery_order/features_delivery_order.dart';
import 'package:features_map/features_map.dart';
import 'package:features_parking_history/data/datasources/remote/parking_history_remote_datasource.dart';
import 'package:features_parking_history/data/repositories/parking_history_repository_impl.dart';
import 'package:features_parking_history/features_parking_history.dart';
import 'package:features_parking_location/features_parking_location.dart';
import 'package:features_qr_scanner/features_qr_scanner.dart';
import 'package:features_splash/features_splash.dart';
import 'package:features_vehicle/data/datasources/remote/vehicle_action_remote_datasource.dart';
import 'package:features_vehicle/data/repositories/vehicle_action_repository_impl.dart';
import 'package:features_vehicle/domain/repositories/vehicle_action_repository.dart';
import 'package:features_vehicle/domain/usecases/send_for_discharging_usecase.dart';
import 'package:features_vehicle/domain/usecases/send_vehicle_to_qc_usecase.dart';
import 'package:features_vehicle/presentation/cubit/vehicle_action_cubit.dart';
import 'package:features_vehicle_charging/features_vehicle_charging.dart';
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
    locator.registerLazySingleton<VehicleChargingRemoteDataSource>(
      () =>
          VehicleChargingRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<DeliveryOrderRemoteDataSource>(
      () => DeliveryOrderRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<VehicleRemoteDataSource>(
      () => VehicleRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<VehicleActionRemoteDataSource>(
      () => VehicleActionRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );

    locator.registerLazySingleton<ParkingHistoryRemoteDataSource>(
      () => ParkingHistoryRemoteDataSource(locator<DioHttpClientBuilder>().dio),
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
    locator.registerLazySingleton<VehicleChargingRepository>(
      () => VehicleChargingRepositoryImpl(
        locator<VehicleChargingRemoteDataSource>(),
      ),
    );

    locator.registerLazySingleton<DeliveryOrderRepository>(
      () =>
          DeliveryOrderRepositoryImpl(locator<DeliveryOrderRemoteDataSource>()),
    );

    locator.registerLazySingleton<VehicleRepository>(
      () => VehicleRepositoryImpl(locator<VehicleRemoteDataSource>()),
    );

    locator.registerLazySingleton<VehicleActionRepository>(
      () =>
          VehicleActionRepositoryImpl(locator<VehicleActionRemoteDataSource>()),
    );
    locator.registerLazySingleton<IParkingHistoryRepository>(
      () => ParkingHistoryRepositoryImpl(
        locator<ParkingHistoryRemoteDataSource>(),
      ),
    );
    locator.registerLazySingleton<ParkingLocationRemoteDataSource>(
      () =>
          ParkingLocationRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );
    locator.registerLazySingleton<ParkingLocationRepository>(
      () => ParkingLocationRepositoryImpl(
        locator<ParkingLocationRemoteDataSource>(),
      ),
    );

    locator.registerLazySingleton<ExportAreaRemoteDataSource>(
      () => ExportAreaRemoteDataSource(locator<DioHttpClientBuilder>().dio),
    );
    locator.registerLazySingleton<ExportAreaRepository>(
      () => ExportAreaRepositoryImpl(locator<ExportAreaRemoteDataSource>()),
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
    locator.registerLazySingleton<GetVehicleChargingListUseCase>(
      () => GetVehicleChargingListUseCase(locator<VehicleChargingRepository>()),
    );
    locator.registerLazySingleton<SendForDischargingUseCase>(
      () => SendForDischargingUseCase(locator<VehicleChargingRepository>()),
    );

    locator.registerLazySingleton<GetVehicleBySerialUseCase>(
      () => GetVehicleBySerialUseCase(locator<VehicleRepository>()),
    );

    // Vehicle Action Use Cases
    locator.registerLazySingleton<SendVehicleToQcUseCase>(
      () => SendVehicleToQcUseCase(locator<VehicleActionRepository>()),
    );
    locator.registerLazySingleton<VehicleActionSendForDischargingUseCase>(
      () => VehicleActionSendForDischargingUseCase(
        locator<VehicleActionRepository>(),
      ),
    );

    // Delivery Order Use Cases
    locator.registerLazySingleton<GetDeliveryOrderListUseCase>(
      () => GetDeliveryOrderListUseCase(locator<DeliveryOrderRepository>()),
    );
    locator.registerLazySingleton<GetDeliveryOrderVehiclesUseCase>(
      () => GetDeliveryOrderVehiclesUseCase(locator<DeliveryOrderRepository>()),
    );
    locator.registerLazySingleton<AddVehicleToDeliveryOrderUseCase>(
      () =>
          AddVehicleToDeliveryOrderUseCase(locator<DeliveryOrderRepository>()),
    );
    locator.registerLazySingleton<GetClientVehiclesUseCase>(
      () => GetClientVehiclesUseCase(locator<DeliveryOrderRepository>()),
    );

    // Parking Location Use Cases
    locator.registerLazySingleton<GetParkingLotsUseCase>(
      () => GetParkingLotsUseCase(locator<ParkingLocationRepository>()),
    );
    locator.registerLazySingleton<AddVehicleToParkingLotUseCase>(
      () => AddVehicleToParkingLotUseCase(locator<ParkingLocationRepository>()),
    );
    locator.registerLazySingleton<GetParkingVehiclesUseCase>(
      () => GetParkingVehiclesUseCase(locator<ParkingLocationRepository>()),
    );

    locator.registerLazySingleton<GetVehicleHistoriesUseCase>(
      () => GetVehicleHistoriesUseCase(locator<IParkingHistoryRepository>()),
    );

    locator.registerLazySingleton<GetAvailableExportAreasUseCase>(
      () => GetAvailableExportAreasUseCase(locator<ExportAreaRepository>()),
    );
    locator.registerLazySingleton<GetExportAreaDeliveryOrdersUseCase>(
      () => GetExportAreaDeliveryOrdersUseCase(locator<ExportAreaRepository>()),
    );
    locator.registerLazySingleton<AddVehicleToExportAreaDoUseCase>(
      () => AddVehicleToExportAreaDoUseCase(locator<ExportAreaRepository>()),
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

    locator.registerFactory<ParkingLocationBloc>(
      () => ParkingLocationBloc(
        locator<GetParkingLotsUseCase>(),
        locator<AddVehicleToParkingLotUseCase>(),
        locator<GetParkingVehiclesUseCase>(),
        locator<GetAvailableExportAreasUseCase>(),
      ),
    );

    locator.registerFactory<ExportAreaDoBloc>(
      () => ExportAreaDoBloc(
        locator<GetExportAreaDeliveryOrdersUseCase>(),
        locator<AddVehicleToExportAreaDoUseCase>(),
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

    // Vehicle Action Cubit - Factory
    locator.registerFactory<VehicleActionCubit>(
      () => VehicleActionCubit(
        locator<SendVehicleToQcUseCase>(),
        locator<VehicleActionSendForDischargingUseCase>(),
      ),
    );

    // Vehicle charging BLoC - Factory (new instance per page)
    locator.registerFactory<VehicleChargingBloc>(
      () => VehicleChargingBloc(
        getVehicleChargingListUseCase: locator<GetVehicleChargingListUseCase>(),
        authBloc: locator<AuthBloc>(),
        sendForDischargingUseCase: locator<SendForDischargingUseCase>(),
      ),
    );

    // Delivery List BLoC - Factory (new instance per page)
    locator.registerFactory<DeliveryListBloc>(
      () => DeliveryListBloc(
        getDeliveryOrderListUseCase: locator<GetDeliveryOrderListUseCase>(),
      ),
    );

    // Delivery Detail BLoC - Factory (new instance per page)
    locator.registerFactory<DeliveryDetailBloc>(
      () => DeliveryDetailBloc(
        getDeliveryOrderVehiclesUseCase:
            locator<GetDeliveryOrderVehiclesUseCase>(),
        addVehicleToDeliveryOrderUseCase:
            locator<AddVehicleToDeliveryOrderUseCase>(),
        getClientVehiclesUseCase: locator<GetClientVehiclesUseCase>(),
      ),
    );

    // Map BLoC - Factory (new instance per page)
    locator.registerFactory<MapBloc>(() => MapBloc());

    // QR Scanner Cubit - Factory (new instance per page)
    locator.registerFactory<QrScanCubit>(
      () => QrScanCubit(locator<GetVehicleBySerialUseCase>()),
    );

    // Vehicle History Bloc - Factory
    locator.registerFactory<VehicleHistoryBloc>(
      () => VehicleHistoryBloc(locator<GetVehicleHistoriesUseCase>()),
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
