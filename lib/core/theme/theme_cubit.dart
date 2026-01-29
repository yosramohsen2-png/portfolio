import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

/// Cubit for managing theme state (light/dark mode)
class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(ThemeState(isDarkMode: _prefs.getBool(_themeKey) ?? false));

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final newIsDarkMode = !state.isDarkMode;
    await _prefs.setBool(_themeKey, newIsDarkMode);
    emit(ThemeState(isDarkMode: newIsDarkMode));
  }

  /// Set theme explicitly
  Future<void> setTheme(bool isDark) async {
    await _prefs.setBool(_themeKey, isDark);
    emit(ThemeState(isDarkMode: isDark));
  }
}
