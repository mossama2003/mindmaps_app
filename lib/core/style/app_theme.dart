import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../network/local/cache/cache_helper.dart';
import 'app_colors.dart';
import 'app_size.dart';

enum AppThemeEnum { light, dark }

extension AppThemeExtension on AppThemeEnum {
  String get key {
    switch (this) {
      case AppThemeEnum.light:
        return CacheKeys.light;
      case AppThemeEnum.dark:
        return CacheKeys.dark;
    }
  }

  String get name {
    switch (this) {
      case AppThemeEnum.light:
        return 'settings.themes.light'.tr();
      case AppThemeEnum.dark:
        return 'settings.themes.dark'.tr();
    }
  }

  ThemeMode get mode {
    switch (this) {
      case AppThemeEnum.light:
        return ThemeMode.light;
      case AppThemeEnum.dark:
        return ThemeMode.dark;
    }
  }
}

class AppTheme {
  static AppThemeEnum? _selectedTheme;

  static Future<void> init() async {
    final isDark = CacheHelper.get(CacheKeys.theme) == CacheKeys.dark;
    _selectedTheme = isDark ? AppThemeEnum.dark : AppThemeEnum.light;
  }

  static AppThemeEnum get selectedTheme => _selectedTheme ?? AppThemeEnum.light;

  static set selectedTheme(AppThemeEnum theme) {
    _selectedTheme = theme;
    CacheHelper.save(CacheKeys.theme, theme.key);
  }

  static Brightness get lightBrightness {
    return Platform.isIOS ? Brightness.dark : Brightness.light;
  }

  static Brightness get darkBrightness {
    return Platform.isIOS ? Brightness.light : Brightness.dark;
  }

  static ThemeData get light => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.scaffoldLight,
        colorScheme: ColorScheme(
          primary: AppColors.primary,
          secondary: AppColors.secondaryLight,
          surface: AppColors.scaffoldLight,
          onSurface: AppColors.black,
          error: AppColors.danger,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: AppSize.font(16),
            fontWeight: FontWeight.w700,
          ),
          backgroundColor: AppColors.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            systemNavigationBarColor: AppColors.primary,
            statusBarBrightness: lightBrightness,
            statusBarIconBrightness: lightBrightness,
            systemNavigationBarIconBrightness: lightBrightness,
          ),
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          isDense: true,
          errorMaxLines: 5,
          isCollapsed: true,
          fillColor: AppColors.white,
          hintStyle: TextStyle(
            color: AppColors.black75,
            fontSize: AppSize.font(14),
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            fontSize: AppSize.font(14),
            fontWeight: FontWeight.w500,
            color: AppColors.black75,
          ),
          errorStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.getSize(20),
            horizontal: AppSize.getSize(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.scaffoldLight,
          titleTextStyle: TextStyle(
            fontSize: AppSize.font(18),
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          contentTextStyle: TextStyle(
            fontSize: AppSize.font(14),
            color: AppColors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(24)),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
          ),
          side: BorderSide(color: AppColors.primary),
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey30,
          ),
          checkColor: WidgetStateProperty.all(AppColors.white),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashRadius: 24,
          visualDensity: VisualDensity.compact,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey30,
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          visualDensity: VisualDensity.compact,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
          elevation: 0,
          unselectedLabelStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w400,
            color: AppColors.grey50,
          ),
          backgroundColor: AppColors.scaffoldLight,
          unselectedItemColor: AppColors.grey50,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.scaffoldLight,
        ),
        expansionTileTheme: ExpansionTileThemeData(
          collapsedBackgroundColor: AppColors.scaffoldLight,
          backgroundColor: AppColors.scaffoldLight,
          collapsedIconColor: AppColors.black,
          iconColor: AppColors.black,
          collapsedTextColor: AppColors.black,
          textColor: AppColors.black,
          tilePadding: EdgeInsets.zero,
          childrenPadding: AppSize.padding(bottom: 12),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.scaffoldDark,
        colorScheme: ColorScheme(
          primary: AppColors.primary,
          secondary: AppColors.secondaryDark,
          surface: AppColors.scaffoldDark,
          onSurface: AppColors.white,
          error: AppColors.danger,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onError: AppColors.white,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: AppSize.font(16),
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          backgroundColor: AppColors.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            systemNavigationBarColor: AppColors.primary,
            statusBarBrightness: darkBrightness,
            statusBarIconBrightness: darkBrightness,
            systemNavigationBarIconBrightness: darkBrightness,
          ),
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.black,
          isDense: true,
          errorMaxLines: 5,
          isCollapsed: true,
          hintStyle: TextStyle(
            fontSize: AppSize.font(14),
            fontWeight: FontWeight.w500,
            color: AppColors.black75,
          ),
          labelStyle: TextStyle(
            fontSize: AppSize.font(14),
            fontWeight: FontWeight.w500,
            color: AppColors.black75,
          ),
          errorStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.getSize(14),
            horizontal: AppSize.getSize(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            borderSide: BorderSide(color: AppColors.blue50),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.scaffoldDark,
          titleTextStyle: TextStyle(
            fontSize: AppSize.font(18),
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          contentTextStyle: TextStyle(
            fontSize: AppSize.font(14),
            color: AppColors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(24)),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
          ),
          side: BorderSide(color: AppColors.primary),
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey30,
          ),
          checkColor: WidgetStateProperty.all(AppColors.white),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashRadius: 24,
          visualDensity: VisualDensity.compact,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey30,
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          visualDensity: VisualDensity.compact,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
          elevation: 0,
          unselectedLabelStyle: TextStyle(
            fontSize: AppSize.font(12),
            fontWeight: FontWeight.w400,
            color: AppColors.grey50,
          ),
          backgroundColor: AppColors.scaffoldDark,
          unselectedItemColor: AppColors.grey50,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.scaffoldDark,
        ),
        expansionTileTheme: ExpansionTileThemeData(
          collapsedBackgroundColor: AppColors.scaffoldDark,
          backgroundColor: AppColors.scaffoldDark,
          collapsedIconColor: AppColors.white,
          iconColor: AppColors.white,
          collapsedTextColor: AppColors.white,
          textColor: AppColors.white,
          tilePadding: EdgeInsets.zero,
          childrenPadding: AppSize.padding(bottom: 12),
        ),
      );
}
