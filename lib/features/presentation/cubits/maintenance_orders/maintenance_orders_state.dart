part of 'maintenance_orders_cubit.dart';

abstract class MaintenanceOrdersState extends Equatable {
  const MaintenanceOrdersState();

  @override
  List<Object> get props => [];
}

class MaintenanceOrdersInitial extends MaintenanceOrdersState {}

class MaintenanceOrdersLoading extends MaintenanceOrdersState {}

class MaintenanceOrdersFailure extends MaintenanceOrdersState {
  final String errMessage;

  const MaintenanceOrdersFailure(this.errMessage);
}

class MaintenanceOrdersSuccess extends MaintenanceOrdersState {
  final List<OrderItemEntity> orders;

  const MaintenanceOrdersSuccess(this.orders);
}
