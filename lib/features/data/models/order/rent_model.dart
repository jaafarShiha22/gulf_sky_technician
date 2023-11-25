import 'package:gulf_sky_technician/features/domain/entities/order/rent_entity.dart';

import 'building_model.dart';

class RentModel extends RentEntity{

  RentModel({
    required super.id,
    required super.clientId,
    super.roomId,
    super.typeId,
    super.buildingId,
    super.branchId,
    super.from,
    super.to,
    super.images,
    super.state,
    super.note,
    super.createdAt,
    super.updatedAt,
    super.building,
  });

  factory RentModel.fromMap(Map<String, dynamic> json) => RentModel(
    id: json["id"],
    clientId: json["client_id"],
    roomId: json["room_id"],
    typeId: json["type_id"],
    buildingId: json["building_id"],
    branchId: json["branch_id"],
    from: DateTime.parse(json["from"]),
    to: json["to"] == null ? null : DateTime.parse(json["to"]),
    images: json["images"],
    state: json["state"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    building: BuildingModel.fromMap(json["building"]),
  );

}