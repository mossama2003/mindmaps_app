import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/helper/app_navigator.dart';
import 'core/style/app_theme.dart';
import 'features/parent/sign_up/presentation/screens/parent_sign_up_screen.dart';
import 'package:flutter/services.dart';
import 'core/helper/app_locals.dart';
import 'core/network/local/cache/cache_helper.dart';
import 'core/network/remote/apis/dio_helper.dart';

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
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => UserCubit()),
    // BlocProvider(create: (context) => ThemeCubit()..getSettings()),
    // ],
    // child:
    return MaterialApp(
      title: 'Mind Maps Quran',
      home: const ParentSignUpScreen(),
      theme: AppTheme.light,
      locale: context.locale,
      darkTheme: AppTheme.dark,
      navigatorKey: AppNavigator.key,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
