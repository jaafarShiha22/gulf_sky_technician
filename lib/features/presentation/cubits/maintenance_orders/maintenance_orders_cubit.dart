import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
import 'package:gulf_sky_technician/features/domain/usecases/order/get_employee_orders_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'maintenance_orders_state.dart';

class MaintenanceOrdersCubit extends Cubit<MaintenanceOrdersState> {
  final GetEmployeeOrdersUseCase _getEmployeeOrdersUseCase;

  MaintenanceOrdersCubit(this._getEmployeeOrdersUseCase) : super(MaintenanceOrdersInitial());

  static MaintenanceOrdersCubit get(context) => BlocProvider.of<MaintenanceOrdersCubit>(context);

  Future<void> getMaintenanceOrders({
    required int page,
    required PagingController<int, OrderItemEntity> pagingController,
  }) async {
    if (page == 0) emit(MaintenanceOrdersLoading());
    var result = await _getEmployeeOrdersUseCase(GetEmployeeOrdersParameters(page: page));
    result.fold((failure) {
      emit(MaintenanceOrdersFailure(failure.message));
    }, (orders) {
      final isLastPage = orders.length < 10;
      if (isLastPage) {
        pagingController.appendLastPage(orders);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(orders, nextPageKey);
      }
      emit(MaintenanceOrdersSuccess(orders));
    });
  }
}
