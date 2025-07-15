// lib/core/helper/app_locales.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../network/local/cache/cache_helper.dart';

enum AppLanguageEnum { arabic }

extension AppLanguageExtension on AppLanguageEnum {
  String get code {
    switch (this) {
      case AppLanguageEnum.arabic:
        return CacheKeys.langAr;
    }
  }

  Locale get locale {
    switch (this) {
      case AppLanguageEnum.arabic:
        return const Locale('ar', 'EG');
    }
  }

  String get displayName {
    switch (this) {
      case AppLanguageEnum.arabic:
        return 'العربية';
    }
  }
}

class AppLocales {
  static AppLanguageEnum? currentLang;
  static const supportedLanguages = AppLanguageEnum.values;

  static Locale get currentLocale =>
      currentLang?.locale ?? AppLanguageEnum.arabic.locale;

  static List<Locale> get supportedLocales =>
      supportedLanguages.map((lang) => lang.locale).toList();

  /// Call this at app startup to set [currentLang] from cache or device locale.
  static Future<void> init() async {
    final deviceLang = Intl.systemLocale.split('_')[0];
    final cachedCode = await CacheHelper.get(CacheKeys.lang) as String?;
    final defaultLang = _getLangEnum(deviceLang) ?? AppLanguageEnum.arabic;
    final selected = _getLangEnum(cachedCode) ?? defaultLang;
    currentLang = selected;

    if (cachedCode == null) {
      await CacheHelper.save(CacheKeys.lang, selected.code);
    }
  }

  /// Switches the locale and persists to cache.
  static Future<void> changeLang(
      BuildContext ctx,
      AppLanguageEnum lang,
      ) async {
    currentLang = lang;
    await ctx.setLocale(lang.locale);
    await CacheHelper.save(CacheKeys.lang, lang.code);
  }

  static AppLanguageEnum? _getLangEnum(String? code) {
    if (code == null) return null;
    for (var lang in AppLanguageEnum.values) {
      if (lang.code == code) return lang;
    }
    return null;
  }
}
