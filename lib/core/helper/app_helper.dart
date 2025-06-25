import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../network/local/cache/cache_helper.dart';
import '../shared/controllers/app/app_cubit.dart';
import '../shared/models/user_model.dart';
import 'app_navigator.dart';

class AppHelper {
  AppHelper._();

  static UserModel? get authUser {
    return AppCubit.get(AppNavigator.context).user;
  }

  static Future closeKeyboard() async {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String timeFormat(String? time, String format) {
    if (time == null) return '';
    final String lang = CacheHelper.get(CacheKeys.lang);
    DateTime parsedTime = DateTime.parse(time).toLocal();
    String formattedTime = DateFormat(format, lang).format(parsedTime);
    return formattedTime;
  }

  static Future<DateTime?> pickDate({
    DateTime? min,
    DateTime? initial,
    DateTime? max,
  }) async {
    return await showDatePicker(
      context: AppNavigator.context,
      firstDate: min ?? DateTime.now(),
      initialDate: initial ?? min ?? DateTime.now(),
      lastDate: max ?? DateTime.parse("2222-12-31"),
    );
  }
}
