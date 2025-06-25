part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class Loading extends LoginState {}

final class Success extends LoginState {}

final class Error extends LoginState {}
