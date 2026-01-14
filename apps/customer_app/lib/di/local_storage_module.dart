import 'package:injectable/injectable.dart';
import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Module để đăng ký các dependencies của local_storage package
/// Injectable sẽ tự động scan và generate code cho các @lazySingleton classes
@module
abstract class LocalStorageModule {
  // ========== SharedPreferences ==========

  /// Provide SharedPreferences instance
  /// Injectable sẽ tự động resolve singleton này
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  // ========== Token Storage ==========

  /// Provide TokenStorage implementation
  /// Sử dụng SecureTokenStorage cho production
  @lazySingleton
  TokenStorage provideTokenStorage() => SecureTokenStorage();

  // ========== Theme Storage ==========

  /// Provide ThemeStorage
  /// Injectable sẽ tự động inject SharedPreferences
  @lazySingleton
  ThemeStorage provideThemeStorage(SharedPreferences prefs) => ThemeStorage(prefs);

  // ========== Locale Storage ==========

  /// Provide LocaleStorage
  /// Injectable sẽ tự động inject SharedPreferences
  @lazySingleton
  LocaleStorage provideLocaleStorage(SharedPreferences prefs) => LocaleStorage(prefs);
}
