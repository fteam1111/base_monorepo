import 'dart:async';

import 'package:core/core.dart';
import 'package:customer_app/di/dependency_manager.dart';
import 'package:customer_app/di/injector.dart';
import 'package:customer_app/routes/app_router.dart';
import 'package:design_system/design_system.dart';
import 'package:features_auth/features_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/localization.dart';
import 'package:network/network.dart';
import 'package:share/share.dart';
import 'package:upgrader/upgrader.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> initialSetup({
  required BaseConfig config,
  FirebaseOptions? firebaseOptions,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyManager.inject(config);

  await Firebase.initializeApp(options: firebaseOptions);

  // Ensure Crashlytics is enabled (useful for dev crash testing).
  if (!kIsWeb) {
    await _crashlytics.setCrashlyticsCollectionEnabled(true);
  }

  // await locator<LocalNotificationService>().initFirebaseMessaging();
  // await locator<RemoteConfigService>().init();

  Bloc.observer = MyBlocObserver();
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  } else {
    FlutterError.onError = (errorDetails) {
      _crashlytics.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kIsWeb) {
        _crashlytics.recordError(error, stack);

        return true;
      }

      return false;
    };
  }

  _initializeNetworkLayer();

  if (kDebugMode) configForDebug();

  runApp(const MyApp());
}

/// Initialize network layer with token refresh interceptor
void _initializeNetworkLayer() {
  final dioClient = locator<DioHttpClientBuilder>();

  dioClient.addRefreshTokenInterceptor(
    onRefresh: (refreshToken) async {
      debugPrint('Refreshing token...');
      final tokenStorage = locator<TokenStorage>();

      final refreshDio = DioHttpClientBuilder(
        config: locator<BaseConfig>(),
      ).dio;

      try {
        final response = await refreshDio.post(
          ApiRoutes.refreshToken,
          data: {'refreshToken': refreshToken},
        );

        final body = response.data as Map<String, dynamic>;
        final tokenJson = body['data'] as Map<String, dynamic>;

        final newAccessToken = tokenJson['accessToken'] as String;
        final newRefreshToken = tokenJson['refreshToken'] as String?;

        await tokenStorage.saveAccessToken(newAccessToken);
        if (newRefreshToken != null) {
          await tokenStorage.saveRefreshToken(newRefreshToken);
        }

        debugPrint('Token refreshed successfully');

        return {
          'accessToken': newAccessToken,
          'refreshToken': newRefreshToken ?? refreshToken,
        };
      } catch (e) {
        debugPrint('Token refresh failed: $e');
        rethrow;
      }
    },
  );
}

void configForDebug() {
  debugRepaintRainbowEnabled = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.createRouter(
      authBloc: locator<AuthBloc>(),
      upgrader: locator<Upgrader>(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<AuthBloc>().add(const AuthCheckRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locator<AuthBloc>()),
        BlocProvider.value(value: locator<ThemeCubit>()),
        BlocProvider.value(value: locator<DeepLinkBloc>()),
        BlocProvider.value(
          value: locator<LocalizationBloc>()..add(const LoadSavedLocaleEvent()),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localeState) {
          final locale = localeState is LocalizationLoaded
              ? localeState.locale.toLocale()
              : null;

          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppLightTheme.theme,
                darkTheme: AppDarkTheme.theme,
                themeMode: themeMode,
                locale: locale,
                supportedLocales: AppLocale.supportedFlutterLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                routerConfig: _router,
              );
            },
          );
        },
      ),
    );
  }
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
