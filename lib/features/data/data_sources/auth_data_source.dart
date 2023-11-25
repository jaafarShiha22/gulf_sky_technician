import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/api/api_result.dart';
import '../../../core/api/api_services.dart';
import '../../../core/api/urls.dart';
import '../../../core/error/failure.dart';
import '../../../core/utils/dio_utils.dart';
import '../../domain/usecases/auth/change_fcm_token_usecase.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../models/auth/auth_response_model.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthResponseModel>> login(LoginParameters parameters);

  Future<Either<Failure, AuthResponseModel>> changeFCMToken(ChangeFCMTokenParameters parameters);

}

class AuthDataSourceImpl extends AuthDataSource {
  final ApiService _apiService;

  AuthDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, AuthResponseModel>> login(LoginParameters parameters) async {
    ApiResult result = await _apiService.post(
        endPoint: URLs.login,
        data: FormData.fromMap(
          {
            'username': parameters.username,
            'password': parameters.password,
          },
        ),
        options: DioUtils.getOptions(
          accept: true,
          contentType: true,
        ));
    if (result.type == ApiResultType.success) {
      return right(AuthResponseModel.fromMap(result.data));
    } else {
      return left(Failure(message: result.message));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> changeFCMToken(ChangeFCMTokenParameters parameters) async {
    ApiResult result = await _apiService.post(
        endPoint: URLs.changeFCMToken,
        data: FormData.fromMap(
          {
            'fcm_token': parameters.fcmToken,
          },
        ),
        options: DioUtils.getOptions(
          accept: true,
          withToken: true,
          contentType: true,
        ));
    if (result.type == ApiResultType.success) {
      return right(AuthResponseModel.fromMap(result.data));
    } else {
      return left(Failure(message: result.message));
    }
  }
}
