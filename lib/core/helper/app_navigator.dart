import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class AppNavigator {
  AppNavigator._();

  static final key = GlobalKey<NavigatorState>();

  static BuildContext get context {
    if (key.currentContext == null) {
      throw Exception('Context is not available');
    }
    return key.currentContext!;
  }

  static Future<void> push(Widget screen) {
    if (key.currentState == null) return Future.value();
    return key.currentState!.push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void replace(Widget screen) async {
    await key.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void remove(Widget screen) async {
    await key.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  static void pop() => key.currentState?.pop();

  static Future<T?> sheet<T>(Widget sheet) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: AppColors.blue50,
      enableDrag: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
      ),
      isDismissible: true,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: sheet,
      ),
    );
  }

  static Future<T?> dialog<T>(Widget dialog) {
    return showDialog<T>(context: context, builder: (_) => dialog);
  }
}
