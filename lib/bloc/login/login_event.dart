part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class DoLogin extends LoginEvent {
  final LoginRequestModel model;

  DoLogin({required this.model});
}

class DoLogout extends LoginEvent {}
