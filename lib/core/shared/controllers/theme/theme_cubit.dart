import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/app_navigator.dart';
import '../../../network/local/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);

  ThemeMode? mode;
  bool isDark = false;

  Future getSettings() async {
    final String theme = await CacheHelper.get('theme');
    if (theme == 'dark') {
      mode = ThemeMode.dark;
      isDark = true;
    } else if (theme == 'light') {
      mode = ThemeMode.light;
      isDark = false;
    }
    emit(ThemeInitial());
  }
}

void changeThemeMode() {
  final bool isDark = CacheHelper.get('theme') == 'dark';
  CacheHelper.save('theme', isDark ? 'light' : 'dark');
  final context = AppNavigator.key.currentState!.context;
  ThemeCubit.get(context).getSettings();
  restartApplication();
}

void restartApplication() {
  /// Restart the application
  // AppNavigator.remove(const HomeLayoutScreen());
}

class ThemeChangeObserver extends WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {}
}
