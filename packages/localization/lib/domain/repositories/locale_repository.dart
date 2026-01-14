import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:localization/domain/entities/app_locale.dart';

/// Repository interface for locale operations
abstract class LocaleRepository {
  /// Get saved locale
  Future<Either<ApiFailure, AppLocale?>> getSavedLocale();

  /// Save locale preference
  Future<Either<ApiFailure, bool>> saveLocale(AppLocale locale);

  /// Clear saved locale (use system locale)
  Future<Either<ApiFailure, bool>> clearLocale();
}
