import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../network/local/cache/cache_helper.dart';
import '../../../style/app_theme.dart';
import '../../models/user_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(BuildContext ctx) => BlocProvider.of(ctx);

  AppThemeEnum? selectTheme = AppTheme.selectedTheme;

  void updateSelectedTheme(AppThemeEnum val) {
    selectTheme = val;
    emit(UpdateTheme());
  }

  UserModel? user;

  // Future<UserModel?> getAuth() async {
  //   final repo = AuthRepoImpel();
  //   final api = await repo.getAuth();
  //   api.fold(
  //     (error) async {
  //       AppToast.error(error.message);
  //       await CacheHelper.remove(CacheKeys.token);
  //       user = null;
  //     },
  //     (result) {
  //       user = result;
  //     },
  //   );
  //   return user;
  // }

  Future<void> logoutAuth() async {
    user = null;
    await CacheHelper.remove(CacheKeys.token);
  }
}
