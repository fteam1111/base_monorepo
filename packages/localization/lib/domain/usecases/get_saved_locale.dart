import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:localization/domain/entities/app_locale.dart';
import 'package:localization/domain/repositories/locale_repository.dart';

/// Use case to get saved locale
class GetSavedLocaleUseCase {
  final LocaleRepository repository;

  GetSavedLocaleUseCase(this.repository);

  Future<Either<ApiFailure, AppLocale?>> call() async {
    return await repository.getSavedLocale();
  }
}
