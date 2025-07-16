import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parent_sign_up_state.dart';

class ParentSignUpCubit extends Cubit<ParentSignUpState> {
  ParentSignUpCubit() : super(ParentSignUpInitial());
}
