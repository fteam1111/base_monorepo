// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:customer_app/di/local_storage_module.dart' as _i803;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/local_storage.dart' as _i486;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final localStorageModule = _$LocalStorageModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localStorageModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i486.TokenStorage>(
      () => localStorageModule.provideTokenStorage(),
    );
    gh.lazySingleton<_i486.ThemeStorage>(
      () =>
          localStorageModule.provideThemeStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i486.LocaleStorage>(
      () => localStorageModule.provideLocaleStorage(
        gh<_i460.SharedPreferences>(),
      ),
    );
    return this;
  }
}

class _$LocalStorageModule extends _i803.LocalStorageModule {}
