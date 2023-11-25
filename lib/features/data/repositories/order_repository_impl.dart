import 'package:dartz/dartz.dart';
import 'package:gulf_sky_technician/core/error/failure.dart';
import 'package:gulf_sky_technician/features/data/data_sources/order_data_source.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
import 'package:gulf_sky_technician/features/domain/repositories/order_repository.dart';

import '../../domain/usecases/order/get_employee_orders_usecase.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderDataSource _orderDataSource;

  OrderRepositoryImpl(this._orderDataSource);

  @override
  Future<Either<Failure, List<OrderItemEntity>>> getEmployeeOrder(GetEmployeeOrdersParameters parameters) async => _orderDataSource.getEmployeeOrder(parameters);
}
