
class BuildingEntity {
  int id;
  String? name;
  String? number;
  String? description;
  String? type;
  int? roomNumber;
  String? images;
  int? branchId;
  DateTime? createdAt;
  DateTime? updatedAt;

  BuildingEntity({
    required this.id,
    this.name,
    this.number,
    this.description,
    this.type,
    this.roomNumber,
    this.images,
    this.branchId,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "number": number,
    "description": description,
    "type": type,
    "room_number": roomNumber,
    "images": images,
    "branch_id": branchId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
