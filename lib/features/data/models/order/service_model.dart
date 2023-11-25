import 'package:gulf_sky_technician/features/domain/entities/order/service_entity.dart';

class ServiceModel extends ServiceEntity {

  ServiceModel({
    required super.id,
    super.nameAr,
    super.name,
    super.createdAt,
    super.updatedAt,
    super.serviceId,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    nameAr: json["name_ar"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    serviceId: json["service_id"],
  );

}