import '../../../domain/entities/order/order_entity.dart';

class OrderModel extends OrderEntity{

  OrderModel({
    required super.id,
    required super.clientId,
    super.rentId,
    required super.cost,
    required super.employeeId,
    super.contractId,
    required super.payStatus,
    super.subscriptionStripe,
     super.branchId,
    required super.servicePartId,
    required super.serviceId,
    required super.visitDate,
    required super.isOld,
    required super.dateFrom,
    super.dateTo,
     super.images,
    required super.state,
     super.address,
    super.note,
    required super.cause,
    required super.createdAt,
     super.updatedAt,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    clientId: json["client_id"],
    rentId: json["rent_id"],
    cost: json["cost"],
    employeeId: json["employee_id"],
    contractId: json["contract_id"],
    payStatus: json["pay_status"],
    subscriptionStripe: json["subscribtion_stripe"],
    branchId: json["branch_id"],
    servicePartId: json["service_part_id"],
    serviceId: json["service_id"],
    visitDate: DateTime.parse(json["visit_date"]),
    isOld: json["is_old"],
    dateFrom: DateTime.parse(json["date_from"]),
    dateTo: json["date_to"],
    images: json["images"],
    state: json["state"],
    address: json["address"],
    note: json["note"],
    cause: json["cause"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );
}