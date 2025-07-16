part of 'parent_sign_in_cubit.dart';

abstract class ParentSignInState {}

final class ParentSignInInitial extends ParentSignInState {}

final class UpdateObscurePassword extends ParentSignInState {}

final class Loading extends ParentSignInState {}

final class Success extends ParentSignInState {}

final class Error extends ParentSignInState {}
