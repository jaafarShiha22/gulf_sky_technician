import 'package:gulf_sky_technician/features/data/models/order/item_model.dart';
import 'package:gulf_sky_technician/features/data/models/order/order_model.dart';
import 'package:gulf_sky_technician/features/data/models/order/service_model.dart';

import '../../../domain/entities/order/order_item_entity.dart';
import 'client_model.dart';
import 'employee_model.dart';
import 'rent_model.dart';

class OrderItemModel extends OrderItemEntity{


  OrderItemModel({
    required super.id,
    required super.order,
    required super.lng,
    required super.lat,
     super.items,
     super.servicePart,
    super.client,
    super.employee,
    super.rent,
    super.service
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> json) => OrderItemModel(
    id: json["id"],
    order: OrderModel.fromMap(json["order"]),
    lng: json["lng"],
    client: json["client"] == null ? null : ClientModel.fromMap(json["client"]),
    employee: json["employee"] == null ? null : EmployeeModel.fromMap(json["employee"]),
    rent: json["rent"] == null ? null : RentModel.fromMap(json["rent"]),
    servicePart: json["service_part"] == null ? null : ServiceModel.fromMap(json["service_part"]),
    service: json["service"] == null ? null : ServiceModel.fromMap(json["service"]),
    lat: json["lat"],
    items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromMap(x))),
  );
}
