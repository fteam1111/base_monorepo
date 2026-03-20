import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/domain/entities/app_locale.dart';
import 'package:localization/domain/repositories/locale_repository.dart';

/// Implementation of locale repository
class LocaleRepositoryImpl implements LocaleRepository {
  final LocaleStorage _storage;

  LocaleRepositoryImpl(this._storage);

  @override
  Future<Either<ApiFailure, AppLocale?>> getSavedLocale() async {
    try {
      final localeData = await _storage.getSavedLocale();

      if (localeData == null) {
        return const Right(null);
      }

      final languageCode = localeData['languageCode'];
      final countryCode = localeData['countryCode'];

      if (languageCode == null) {
        return const Right(null);
      }

      // Find matching supported locale
      final supportedLocale = AppLocale.supportedLocales.firstWhere(
        (locale) =>
            locale.languageCode == languageCode &&
            locale.countryCode == countryCode,
        orElse: () => AppLocale.english,
      );

      debugPrint(
        '✅ LocaleRepository - Retrieved locale: ${supportedLocale.displayName}',
      );
      return Right(supportedLocale);
    } catch (e) {
      debugPrint('❌ LocaleRepository - Error getting locale: $e');
      return Left(
        ApiFailure.other('Failed to get saved locale: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<ApiFailure, bool>> saveLocale(AppLocale locale) async {
    try {
      debugPrint('💾 LocaleRepository - Saving locale: ${locale.displayName}');

      final result = await _storage.saveLocale(
        locale.languageCode,
        locale.countryCode,
      );

      if (result) {
        debugPrint('✅ LocaleRepository - Locale saved successfully');
        return const Right(true);
      } else {
        debugPrint('❌ LocaleRepository - Failed to save locale');
        return const Left(ApiFailure.other('Failed to save locale'));
      }
    } catch (e) {
      debugPrint('❌ LocaleRepository - Error saving locale: $e');
      return Left(ApiFailure.other('Failed to save locale: ${e.toString()}'));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> clearLocale() async {
    try {
      debugPrint('🗑️  LocaleRepository - Clearing locale');

      final result = await _storage.clearLocale();

      if (result) {
        debugPrint('✅ LocaleRepository - Locale cleared successfully');
        return const Right(true);
      } else {
        return const Left(ApiFailure.other('Failed to clear locale'));
      }
    } catch (e) {
      debugPrint('❌ LocaleRepository - Error clearing locale: $e');
      return Left(ApiFailure.other('Failed to clear locale: ${e.toString()}'));
    }
  }
}
