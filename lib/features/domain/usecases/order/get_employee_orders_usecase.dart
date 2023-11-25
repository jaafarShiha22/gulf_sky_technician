import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gulf_sky_technician/features/domain/repositories/order_repository.dart';

import '../../../../core/error/failure.dart';
import '../../entities/order/order_item_entity.dart';
import '../base_use_case.dart';

class GetEmployeeOrdersUseCase extends BaseUseCase<List<OrderItemEntity>, GetEmployeeOrdersParameters> {
  final OrderRepository _orderRepository;

  GetEmployeeOrdersUseCase(this._orderRepository);

  @override
  Future<Either<Failure, List<OrderItemEntity>>> call(GetEmployeeOrdersParameters parameters) async {
    return await _orderRepository.getEmployeeOrder(parameters);
  }
}


class GetEmployeeOrdersParameters extends Equatable {
  final int page;

  const GetEmployeeOrdersParameters({
    required this.page,
  });

  @override
  List<Object> get props => [page];
}
