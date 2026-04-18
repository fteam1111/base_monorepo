import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/storage/theme_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeStorage _themeStorage;

  ThemeCubit(this._themeStorage) : super(ThemeMode.light) {
    _loadSavedTheme();
  }

  /// Tải theme đã lưu từ storage
  Future<void> _loadSavedTheme() async {
    final savedTheme = await _themeStorage.getSavedThemeMode();
    if (savedTheme != null) {
      debugPrint('🎨 ThemeCubit - Đã tải theme đã lưu: ${savedTheme.name}');
      emit(savedTheme);
    } else {
      debugPrint('🎨 ThemeCubit - Không có theme đã lưu, dùng theo hệ thống');
    }
  }

  /// Chế độ theme hiện tại
  ThemeMode get themeMode => state;

  /// Có đang bật dark mode không
  bool get isDarkMode => state == ThemeMode.dark;

  /// Có đang bật light mode không
  bool get isLightMode => state == ThemeMode.light;

  /// Có đang dùng chế độ theo hệ thống không
  bool get isSystemMode => state == ThemeMode.system;

  /// Thiết lập theme và lưu xuống storage
  Future<void> setThemeMode(ThemeMode mode) async {
    debugPrint('🎨 ThemeCubit - Đang set theme: ${mode.name}');
    emit(mode);
    await _themeStorage.saveThemeMode(mode);
  }

  /// Chuyển đổi qua lại giữa light và dark
  Future<void> toggleTheme() async {
    ThemeMode newMode;
    if (state == ThemeMode.light) {
      newMode = ThemeMode.dark;
    } else if (state == ThemeMode.dark) {
      newMode = ThemeMode.light;
    } else {
      newMode = ThemeMode.light;
    }
    await setThemeMode(newMode);
  }

  /// Chuyển sang dark mode
  Future<void> setDarkMode() async {
    await setThemeMode(ThemeMode.dark);
  }

  /// Chuyển sang light mode
  Future<void> setLightMode() async {
    await setThemeMode(ThemeMode.light);
  }

  /// Chuyển sang chế độ theo hệ thống
  Future<void> setSystemMode() async {
    await setThemeMode(ThemeMode.system);
  }
}
