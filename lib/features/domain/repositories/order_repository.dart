import 'package:dartz/dartz.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';

import '../../../core/error/failure.dart';
import '../usecases/order/get_employee_orders_usecase.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderItemEntity>>> getEmployeeOrder(GetEmployeeOrdersParameters parameters);
}