import 'package:equatable/equatable.dart';

import '../../../domain/usecases/auth/login_usecase.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


class Login extends AuthEvent {
  final LoginParameters parameters;
  const Login({
    required this.parameters,
  });

  @override
  List<Object> get props => [];
}

class ChangeFCMToken extends AuthEvent {
  const ChangeFCMToken();

  @override
  List<Object> get props => [];
}
