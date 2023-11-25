import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gulf_sky_technician/features/data/data_sources/order_data_source.dart';
import 'package:gulf_sky_technician/features/data/repositories/order_repository_impl.dart';
import 'package:gulf_sky_technician/features/domain/usecases/order/get_employee_orders_usecase.dart';
import 'package:gulf_sky_technician/features/presentation/cubits/maintenance_orders/maintenance_orders_cubit.dart';

import '../../features/data/data_sources/auth_data_source.dart';
import '../../features/data/repositories/auth_repository_impl.dart';
import '../../features/domain/usecases/auth/change_fcm_token_usecase.dart';
import '../../features/domain/usecases/auth/login_usecase.dart';
import '../../features/presentation/blocs/auth/auth_bloc.dart';
import '../api/api_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Dio
  final dio = Dio();
  sl.registerSingleton<Dio>(dio);

  ///Blocs && Cubits
  sl.registerFactory(() => AuthBloc(
    sl<LoginUseCase>(),
    sl<ChangeFCMTokenUseCase>(),
  ));

  sl.registerFactory(() => MaintenanceOrdersCubit(
    sl<GetEmployeeOrdersUseCase>(),
  ));

  ///use case
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl<AuthRepositoryImpl>()));
  sl.registerLazySingleton<ChangeFCMTokenUseCase>(() => ChangeFCMTokenUseCase(sl<AuthRepositoryImpl>()));

  sl.registerLazySingleton<GetEmployeeOrdersUseCase>(() => GetEmployeeOrdersUseCase(sl<OrderRepositoryImpl>()));


  ///repository
  sl.registerLazySingleton<AuthRepositoryImpl>(
        () => AuthRepositoryImpl(sl<AuthDataSourceImpl>()),
  );
sl.registerLazySingleton<OrderRepositoryImpl>(
        () => OrderRepositoryImpl(sl<OrderDataSourceImpl>()),
  );


  ///remote data source

  sl.registerLazySingleton<AuthDataSourceImpl>(
        () => AuthDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<OrderDataSourceImpl>(
        () => OrderDataSourceImpl(sl<ApiService>()),
  );

  /// services
  sl.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
}
