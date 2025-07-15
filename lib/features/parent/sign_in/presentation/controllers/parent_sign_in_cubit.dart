import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/repos/parent_sign_in_repo.dart';

part 'parent_sign_in_state.dart';

class SignInCubit extends Cubit<ParentSignInState> {
  SignInCubit(this.repo) : super(ParentSignInInitial());
  ParentSignInRepo repo;

  static SignInCubit get(BuildContext context) => BlocProvider.of(context);

  bool obscurePassword = true;

  void updateObscurePassword() {
    obscurePassword = !obscurePassword;
    emit(UpdateObscurePassword());
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Future<void> signIn() async {
  //   if (!formKey.currentState!.validate()) return;
  //   emit(Loading());
  //   final api = await repo.signIn(
  //     SignInParam(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     ),
  //   );
  //   api.fold(
  //         (l) {
  //       emit(Error());
  //       AppToast.error(l.message);
  //     },
  //         (token) async {
  //       emit(Success());
  //       AppToast.success('sign_up.account_created'.tr());
  //       await CacheHelper.save('token', token);
  //       AppNavigator.remove(GenderScreen());
  //     },
  //   );
  // }
}
