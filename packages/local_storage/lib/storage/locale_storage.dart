import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local storage cho preferences về locale của app
class LocaleStorage {
  static const String _localeKey = 'app_locale';

  final SharedPreferences _prefs;

  LocaleStorage(this._prefs);

  /// Lưu locale vào storage
  Future<bool> saveLocale(String languageCode, String? countryCode) async {
    debugPrint(
      'LocaleStorage - Saving locale: $languageCode${countryCode != null ? '_$countryCode' : ''}',
    );

    final localeString = countryCode != null
        ? '${languageCode}_$countryCode'
        : languageCode;

    final result = await _prefs.setString(_localeKey, localeString);

    if (result) {
      debugPrint('LocaleStorage - Locale saved successfully');
    } else {
      debugPrint('LocaleStorage - Failed to save locale');
    }

    return result;
  }

  /// Lấy locale đã lưu từ storage
  Future<Map<String, String?>?> getSavedLocale() async {
    final localeString = _prefs.getString(_localeKey);

    if (localeString == null) {
      debugPrint('LocaleStorage - No saved locale found');
      return null;
    }

    debugPrint('LocaleStorage - Retrieved locale: $localeString');

    final parts = localeString.split('_');
    return {
      'languageCode': parts[0],
      'countryCode': parts.length > 1 ? parts[1] : null,
    };
  }

  /// Xóa locale đã lưu (sử dụng locale của hệ thống)
  Future<bool> clearLocale() async {
    debugPrint('LocaleStorage - Clearing saved locale');
    final result = await _prefs.remove(_localeKey);

    if (result) {
      debugPrint('LocaleStorage - Locale cleared successfully');
    }

    return result;
  }

  /// Kiểm tra xem có locale đã lưu không
  bool hasLocale() {
    return _prefs.containsKey(_localeKey);
  }
}
