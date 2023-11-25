import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:gulf_sky_technician/core/api/urls.dart';

import 'api_result.dart';
import 'handling_errors.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Future<Either<Failure, Map<String, dynamic>>> get({required String endPoint}) async {
  //   try {
  //     var response = await _dio.get('${URLs.baseUrl}$endPoint');
  //     if (response.data['success'] == true) {
  //       return right(response.data['data']);
  //     } else {
  //       return left(
  //         ServerFailure.fromDioError(response.data['message']),
  //       );
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

  Future<ApiResult> get({
    required String endPoint,
    required Options options,
    required dio.FormData data,
  }) async {
    try {
      final dio.Response response = await _dio.get(
        '${URLs.baseUrl}$endPoint',
        data: data,
        options: options,
      );
      if (response.data['success'] == true) {
        return ApiResult.successFromJson(response.data);
      } else {
        return ApiResult.failureFromJson(response.data);
      }
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(e));
    }
  }

  Future<ApiResult> post({required String endPoint, required Options options, required dio.FormData data}) async {
    try {
      log('Request data of ${URLs.baseUrl}$endPoint\n${data.fields}');
      final dio.Response response = await _dio.post(
        '${URLs.baseUrl}$endPoint',
        data: data,
        options: options,
      );
      if (response.data['success'] == true) {
        log('Response of ${URLs.baseUrl}$endPoint\n${response.data}');
        return ApiResult.successFromJson(response.data);
      } else {
        return ApiResult.failureFromJson(response.data);
      }
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(e));
    }
  }
}
