// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
// import 'package:gulf_sky_technician/features/domain/usecases/order/get_employee_orders_usecase.dart';
//
// import '../../../domain/usecases/base_use_case.dart';
//
// part 'evacuation_orders_state.dart';
//
// class EvacuationOrdersCubit extends Cubit<EvacuationOrdersState> {
//   final GetEmployeeOrdersUseCase _getEmployeeOrdersUseCase;
//
//   EvacuationOrdersCubit(this._getEmployeeOrdersUseCase) : super(EvacuationOrdersInitial());
//
//   static EvacuationOrdersCubit get(context) => BlocProvider.of<EvacuationOrdersCubit>(context);
//
//   Future<List<OrderItemEntity>?> getEvacuationOrders() async {
//     emit(EvacuationOrdersLoading());
//     var result = await _getEmployeeOrdersUseCase(const NoParameters());
//     result.fold((failure) {
//       emit(EvacuationOrdersFailure(failure.message));
//     }, (orders) {
//       emit(EvacuationOrdersSuccess(orders));
//       return orders;
//     });
//     return null;
//   }
// }
