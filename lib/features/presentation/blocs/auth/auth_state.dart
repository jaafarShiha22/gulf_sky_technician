import '../../../domain/entities/auth/auth_response_entity.dart';

abstract class AuthState {
  const AuthState();
}

class Initial extends AuthState {
  const Initial();
}

class LoginLoading extends AuthState {
  const LoginLoading();
}

class LoginSucceeded extends AuthState {
  final AuthResponseEntity authResponseEntity;

  const LoginSucceeded({
    required this.authResponseEntity,
  });
}

class LoginFailed extends AuthState {
  final String errorMsg;

  const LoginFailed({
    required this.errorMsg,
  });
}


class ChangeFCMTokenLoading extends AuthState {
  const ChangeFCMTokenLoading();
}

class ChangeFCMTokenSucceeded extends AuthState {
  final AuthResponseEntity authResponseEntity;

  const ChangeFCMTokenSucceeded({
    required this.authResponseEntity,
  });
}

class ChangeFCMTokenFailed extends AuthState {
  final String errorMsg;

  const ChangeFCMTokenFailed({
    required this.errorMsg,
  });
}
