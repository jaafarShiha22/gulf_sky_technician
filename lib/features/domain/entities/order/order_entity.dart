class OrderEntity {
  int id;
  int clientId;
  int? rentId;
  int cost;
  int employeeId;
  int? contractId;
  String payStatus;
  String? subscriptionStripe;
  int? branchId;
  int servicePartId;
  int serviceId;
  DateTime visitDate;
  int isOld;
  DateTime dateFrom;
  DateTime? dateTo;
  String? images;
  String state;
  String? address;
  String? note;
  String cause;
  DateTime createdAt;
  DateTime? updatedAt;

  OrderEntity({
    required this.id,
    required this.clientId,
    this.rentId,
    required this.cost,
    required this.employeeId,
    this.contractId,
    required this.payStatus,
    this.subscriptionStripe,
     this.branchId,
    required this.servicePartId,
    required this.serviceId,
    required this.visitDate,
    required this.isOld,
    required this.dateFrom,
    this.dateTo,
     this.images,
    required this.state,
     this.address,
    this.note,
    required this.cause,
    required this.createdAt,
     this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "client_id": clientId,
    "rent_id": rentId,
    "cost": cost,
    "employee_id": employeeId,
    "contract_id": contractId,
    "pay_status": payStatus,
    "subscribtion_stripe": subscriptionStripe,
    "branch_id": branchId,
    "service_part_id": servicePartId,
    "service_id": serviceId,
    "visit_date": "${visitDate.year.toString().padLeft(4, '0')}-${visitDate.month.toString().padLeft(2, '0')}-${visitDate.day.toString().padLeft(2, '0')}",
    "is_old": isOld,
    "date_from": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
    "date_to": dateTo,
    "images": images,
    "state": state,
    "address": address,
    "note": note,
    "cause": cause,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}