import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/bloc/localization_event.dart';
import 'package:localization/bloc/localization_state.dart';
import 'package:localization/domain/entities/app_locale.dart';
import 'package:localization/domain/usecases/get_saved_locale.dart';
import 'package:localization/domain/usecases/save_locale.dart';

/// BLoC for managing app localization
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final GetSavedLocaleUseCase getSavedLocaleUseCase;
  final SaveLocaleUseCase saveLocaleUseCase;

  LocalizationBloc({
    required this.getSavedLocaleUseCase,
    required this.saveLocaleUseCase,
  }) : super(const LocalizationInitial()) {
    on<LoadSavedLocaleEvent>(_onLoadSavedLocale);
    on<ChangeLocaleEvent>(_onChangeLocale);
    on<ResetToSystemLocaleEvent>(_onResetToSystemLocale);
  }

  /// Load saved locale on app start
  Future<void> _onLoadSavedLocale(
    LoadSavedLocaleEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    emit(const LocalizationLoading());

    debugPrint('🌍 LocalizationBloc - Loading saved locale...');

    final result = await getSavedLocaleUseCase();

    result.fold(
      (failure) {
        debugPrint(
          '❌ LocalizationBloc - Failed to load locale: ${failure.failureMessage}',
        );
        // Fallback to English on error
        emit(
          const LocalizationLoaded(
            locale: AppLocale.english,
            isSystemLocale: true,
          ),
        );
      },
      (savedLocale) {
        if (savedLocale != null) {
          debugPrint(
            '✅ LocalizationBloc - Loaded saved locale: ${savedLocale.displayName}',
          );
          emit(LocalizationLoaded(locale: savedLocale, isSystemLocale: false));
        } else {
          debugPrint(
            'ℹ️  LocalizationBloc - No saved locale, using system default (English)',
          );
          // No saved locale, use system default
          emit(
            const LocalizationLoaded(
              locale: AppLocale.english,
              isSystemLocale: true,
            ),
          );
        }
      },
    );
  }

  /// Change app locale
  Future<void> _onChangeLocale(
    ChangeLocaleEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    debugPrint(
      '🌍 LocalizationBloc - Changing locale to: ${event.locale.displayName}',
    );

    final result = await saveLocaleUseCase(event.locale);

    result.fold(
      (failure) {
        debugPrint(
          '❌ LocalizationBloc - Failed to change locale: ${failure.failureMessage}',
        );
        emit(LocalizationError(failure.failureMessage.message));
      },
      (success) {
        if (success) {
          debugPrint('✅ LocalizationBloc - Locale changed successfully');
          emit(LocalizationLoaded(locale: event.locale, isSystemLocale: false));
        } else {
          debugPrint('❌ LocalizationBloc - Failed to save locale');
          emit(const LocalizationError('Failed to save locale'));
        }
      },
    );
  }

  /// Reset to system locale
  Future<void> _onResetToSystemLocale(
    ResetToSystemLocaleEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    debugPrint('🌍 LocalizationBloc - Resetting to system locale');

    emit(
      const LocalizationLoaded(locale: AppLocale.english, isSystemLocale: true),
    );
  }
}
