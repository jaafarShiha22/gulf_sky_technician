// import 'package:dartz/dartz.dart';
// import 'package:gulf_sky_technician/features/domain/repositories/order_repository.dart';
//
// import '../../../../core/error/failure.dart';
// import '../../entities/order/order_item_entity.dart';
// import '../base_use_case.dart';
//
// class GetEmployeeEvacuationOrdersUseCase extends BaseUseCase<List<OrderItemEntity>, NoParameters> {
//   final OrderRepository _orderRepository;
//
//   GetEmployeeEvacuationOrdersUseCase(this._orderRepository);
//
//   @override
//   Future<Either<Failure, List<OrderItemEntity>>> call(NoParameters parameters) async {
//     return await _orderRepository.getEmployeeOrder();
//   }
// }