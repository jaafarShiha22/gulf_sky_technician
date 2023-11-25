
import 'package:gulf_sky_technician/features/domain/entities/order/building_entity.dart';

class BuildingModel extends BuildingEntity{

  BuildingModel({
    required super.id,
    super.name,
    super.number,
    super.description,
    super.type,
    super.roomNumber,
    super.images,
    super.branchId,
    super.createdAt,
    super.updatedAt,
  });

  factory BuildingModel.fromMap(Map<String, dynamic> json) => BuildingModel(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    description: json["description"],
    type: json["type"],
    roomNumber: json["room_number"],
    images: json["images"],
    branchId: json["branch_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
