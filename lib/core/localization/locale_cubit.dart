import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

/// Cubit for managing locale/language state
class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'locale';
  final SharedPreferences _prefs;

  LocaleCubit(this._prefs)
      : super(LocaleState(locale: Locale(_prefs.getString(_localeKey) ?? 'en')));

  /// Switch to English
  Future<void> setEnglish() async {
    await _setLocale(const Locale('en'));
  }

  /// Switch to German (Deutsch)
  Future<void> setGerman() async {
    await _setLocale(const Locale('de'));
  }

  /// Set locale explicitly
  Future<void> setLocale(Locale locale) async {
    await _setLocale(locale);
  }

  Future<void> _setLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
    emit(LocaleState(locale: locale));
  }
}
