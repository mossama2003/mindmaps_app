import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/login_repo.dart';

part 'sign_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  AuthRepo repo;

}
