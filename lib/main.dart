import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmaps_app/features/parent_sign_up/presentation/pages/parent_sign_up_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper/app_locals.dart';
import 'core/helper/app_navigator.dart';
import 'core/network/local/cache/cache_helper.dart';
import 'core/network/remote/apis/dio_helper.dart';
import 'core/style/app_theme.dart';
import 'features/intro/presentation/screens/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// SHARED PREFERENCES INIT
  await CacheHelper.init();

  /// LANGUAGE INIT
  await EasyLocalization.ensureInitialized();
  await AppLocales.init();

  /// API INIT [DIO]
  DioHelper.init();

  /// SET DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.delayed(const Duration(milliseconds: 300));

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      startLocale: AppLocales.currentLocale,
      fallbackLocale: AppLocales.currentLocale,
      supportedLocales: AppLocales.supportedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          title: 'Mind Maps Quran',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          home: ParentSignUpScreen(),
        );
      },
    );
  }
}
