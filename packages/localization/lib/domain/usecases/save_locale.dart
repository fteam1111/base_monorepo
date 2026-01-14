import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:localization/domain/entities/app_locale.dart';
import 'package:localization/domain/repositories/locale_repository.dart';

/// Use case to save locale preference
class SaveLocaleUseCase {
  final LocaleRepository repository;

  SaveLocaleUseCase(this.repository);

  Future<Either<ApiFailure, bool>> call(AppLocale locale) async {
    return await repository.saveLocale(locale);
  }
}
