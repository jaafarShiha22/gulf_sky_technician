import 'package:gulf_sky_technician/features/domain/entities/order/building_entity.dart';

class RentEntity {
  int id;
  int clientId;
  int? roomId;
  int? typeId;
  int? buildingId;
  int? branchId;
  DateTime? from;
  DateTime? to;
  String? images;
  String? state;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  BuildingEntity? building;

  RentEntity({
    required this.id,
    required this.clientId,
    this.roomId,
     this.typeId,
    this.buildingId,
    this.branchId,
    this.from,
    this.to,
    this.images,
    this.state,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.building,
  });


  Map<String, dynamic> toMap() => {
    "id": id,
    "client_id": clientId,
    "room_id": roomId,
    "type_id": typeId,
    "building_id": buildingId,
    "branch_id": branchId,
    "from": from == null ? '' : "${from?.year.toString().padLeft(4, '0')}-${from?.month.toString().padLeft(2, '0')}-${from?.day.toString().padLeft(2, '0')}",
    "to": to,
    "images": images,
    "state": state,
    "note": note,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "building": building?.toMap(),
  };
}