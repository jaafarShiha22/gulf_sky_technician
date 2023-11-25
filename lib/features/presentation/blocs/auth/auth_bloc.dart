import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../../domain/usecases/auth/change_fcm_token_usecase.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final ChangeFCMTokenUseCase _changeFCMTokenUseCase;

  AuthBloc(
    this._loginUseCase,
    this._changeFCMTokenUseCase,
  ) : super(const Initial()) {
    on<Login>((event, emit) async {
      emit(const LoginLoading());
      final result = await _loginUseCase(
        event.parameters,
      );
      result.fold(
        (l) => emit(LoginFailed(errorMsg: l.message)),
        (r) {
          GetIt.instance.registerLazySingleton<AuthResponseEntity>(() => r);
          add(const ChangeFCMToken());
          emit(LoginSucceeded(authResponseEntity: r));
        },
      );
    });
    on<ChangeFCMToken>((event, emit) async {
      emit(const ChangeFCMTokenLoading());
      await FirebaseMessaging.instance.getToken().then((fcmToken) async {
        if (fcmToken != null) {
          final result = await _changeFCMTokenUseCase(
            ChangeFCMTokenParameters(fcmToken: fcmToken),
          );
           result.fold(
            (l) async => emit(ChangeFCMTokenFailed(errorMsg: l.message)),
            (r) {
              GetIt.instance.unregister<AuthResponseEntity>();
              GetIt.instance.registerLazySingleton<AuthResponseEntity>(() => r);
              emit(ChangeFCMTokenSucceeded(authResponseEntity: r));

            },
          );
        }
      }, onError: (e) {
        emit(ChangeFCMTokenFailed(errorMsg: e.toString()));
      });
    });
  }
}
