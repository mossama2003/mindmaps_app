import 'package:flutter/material.dart';

import '../network/local/cache/cache_helper.dart';

class AppColors {
  static String? get _theme => CacheHelper.get(CacheKeys.theme);

  static bool get _isDark => _theme == CacheKeys.dark;

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color success = Color(0xff05C212);
  static const Color warning = Color(0xffFA9D00);
  static const Color danger = Color(0xffEC1C1C);

  static const Color primary = Color(0xff375CA9);

  static const Color secondaryLight = black;
  static const Color secondaryDark = white;

  static const Color chatGray =Color(0xffEEEEEE);

  static const Color chatBlue =Color(0xff375CA9);

  static Color get secondary => _isDark ? secondaryDark : secondaryLight;

  static const Color scaffoldDark = Color(0xff131313);
  static const Color scaffoldLight = Color(0xffFCFCFC);

  static Color get scaffold => _isDark ? scaffoldDark : scaffoldLight;

  static const Color blue50 = Color(0xffebeef6);
  static const Color blue75 = Color(0xffadbcdc);
  static const Color blue100 = Color(0xff8ba0cd);
  static const Color blue200 = Color(0xff5978b8);
  static const Color blue300 = Color(0xff375ca9);
  static const Color blue400 = Color(0xff274076);
  static const Color blue500 = Color(0xff223867);

  static const Color green50 = Color(0xffe6f9e7);
  static const Color green75 = Color(0xff99e69e);
  static const Color green100 = Color(0xff6edc76);
  static const Color green200 = Color(0xff30cc3a);
  static const Color green300 = Color(0xff05c212);
  static const Color green400 = Color(0xff04880d);
  static const Color green500 = Color(0xff03760b);

  static const Color red50 = Color(0xfffde8e8);
  static const Color red75 = Color(0xfff7a2a2);
  static const Color red100 = Color(0xfff47b7b);
  static const Color red200 = Color(0xffef4343);
  static const Color red300 = Color(0xffec1c1c);
  static const Color red400 = Color(0xffa51414);
  static const Color red500 = Color(0xff901111);

  static const Color black50 = Color(0xffe7e7e7);
  static const Color black75 = Color(0xff9c9d9e);
  static const Color black100 = Color(0xff737476);
  static const Color black200 = Color(0xff36383b);
  static const Color black300 = Color(0xff0d0f13);
  static const Color black400 = Color(0xff090b0d);
  static const Color black500 = Color(0xff08090c);

  static Color _getGrey(int opacity) {
    return _isDark ? white.withAlpha(opacity) : black.withAlpha(opacity);
  }

  static Color get grey10 => _getGrey(10);

  static Color get grey20 => _getGrey(20);

  static Color get grey30 => _getGrey(30);

  static Color get grey40 => _getGrey(40);

  static Color get grey50 => _getGrey(50);

  static Color get grey60 => _getGrey(60);

  static Color get grey70 => _getGrey(70);

  static Color get grey80 => _getGrey(80);

  static Color get grey90 => _getGrey(80);

  static Color get grey100 => _isDark ? black : white;
}
