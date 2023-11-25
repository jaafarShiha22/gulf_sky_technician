import 'package:gulf_sky_technician/features/domain/entities/order/item_entity.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_entity.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/rent_entity.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/service_entity.dart';

import 'client_entity.dart';
import 'employee_entity.dart';

class OrderItemEntity {
  int id;
  OrderEntity order;
  String lng;
  String lat;
  RentEntity? rent;
  ServiceEntity? service;
  ServiceEntity? servicePart;
  ClientEntity? client;
  EmployeeEntity? employee;

  List<ItemEntity>? items;

  OrderItemEntity({
    required this.id,
    required this.order,
    required this.lng,
    required this.lat,
    required this.items,
     this.rent,
     this.service,
     this.servicePart,
     this.client,
     this.employee,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "order": order.toMap(),
    "lng": lng,
    "lat": lat,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}
