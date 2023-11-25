import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth/change_fcm_token_usecase.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../data_sources/auth_data_source.dart';
import '../models/auth/auth_response_model.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, AuthResponseModel>> login(LoginParameters parameters) async {
    return await authDataSource.login(parameters);
  }

  @override
  Future<Either<Failure, AuthResponseModel>> changeFCMToken(ChangeFCMTokenParameters parameters) async {
    return await authDataSource.changeFCMToken(parameters);
  }

}