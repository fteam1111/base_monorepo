import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Entity representing app locale
class AppLocale extends Equatable {
  final String languageCode;
  final String? countryCode;
  final String displayName;

  const AppLocale({
    required this.languageCode,
    this.countryCode,
    required this.displayName,
  });

  /// Convert to Flutter Locale
  Locale toLocale() {
    return Locale(languageCode, countryCode);
  }

  /// Create from Flutter Locale
  factory AppLocale.fromLocale(Locale locale, String displayName) {
    return AppLocale(
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
      displayName: displayName,
    );
  }

  /// Supported locales
  static const AppLocale english = AppLocale(
    languageCode: 'en',
    countryCode: 'US',
    displayName: 'English',
  );

  static const AppLocale vietnamese = AppLocale(
    languageCode: 'vi',
    countryCode: 'VI_VN',
    displayName: 'Vietnamese',
  );

  /// Get all supported locales
  static List<AppLocale> get supportedLocales => [english, vietnamese];

  /// Get all supported Flutter locales
  static List<Locale> get supportedFlutterLocales =>
      supportedLocales.map((e) => e.toLocale()).toList();

  @override
  List<Object?> get props => [languageCode, countryCode];

  @override
  String toString() =>
      'AppLocale($languageCode${countryCode != null ? '_$countryCode' : ''})';
}
