import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/auth/auth_response_entity.dart';
import '../usecases/auth/change_fcm_token_usecase.dart';
import '../usecases/auth/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> login(LoginParameters parameters);
  Future<Either<Failure, AuthResponseEntity>> changeFCMToken(ChangeFCMTokenParameters parameters);
}
