class ServiceEntity {
  int id;
  String? nameAr;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? serviceId;

  ServiceEntity({
    required this.id,
    this.nameAr,
     this.name,
     this.createdAt,
     this.updatedAt,
    this.serviceId,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "name_ar": nameAr,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "service_id": serviceId,
  };
}