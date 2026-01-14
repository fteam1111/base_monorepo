import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:share/constants/firebase_remote_config_keys.dart';
import 'package:share/firebase/crashlytics.dart';

class RemoteConfigService {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  final FirebaseCrashlyticsService firebaseCrashlyticsService;

  RemoteConfigService({required this.firebaseCrashlyticsService});

  Future<void> init() async {
    try {
      await _setConfig();
      await _setInAppDefaultValues();
      await _remoteConfig.fetchAndActivate();
    } catch (exception, stacktrace) {
      await firebaseCrashlyticsService.crashlytics.recordError(
        exception,
        stacktrace,
      );
    } finally {
      await _updateConfigs(RemoteConfigUpdate({}));
    }
  }

  /// Thiết lập giá trị mặc định cho Remote Config.
  Future<void> _setInAppDefaultValues() async {
    await _remoteConfig.setDefaults({
      FirebaseRemoteConfigKeys.forceUpdateApp: false,
      FirebaseRemoteConfigKeys.androidAppVersionName: '1.0.0',
      FirebaseRemoteConfigKeys.iosAppVersionName: '1.0.0',
    });
  }

  /// Thiết lập cấu hình fetch cho Remote Config.
  Future<void> _setConfig() async {
    if (!kIsWeb) {
      _remoteConfig.onConfigUpdated.listen(_updateConfigs, onError: (_) {});
    }
    if (kDebugMode) {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 10),
        ),
      );
    }
  }

  Future<void> _updateConfigs(RemoteConfigUpdate remoteConfigUpdate) =>
      _remoteConfig.activate();

  bool get forceUpdateApp =>
      _remoteConfig.getBool(FirebaseRemoteConfigKeys.forceUpdateApp);

  String get androidAppVersionName =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.androidAppVersionName);

  String get iosAppVersionName =>
      _remoteConfig.getString(FirebaseRemoteConfigKeys.iosAppVersionName);
}
