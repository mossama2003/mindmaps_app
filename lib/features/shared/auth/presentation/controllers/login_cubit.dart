import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  LoginRepo repo;

}
