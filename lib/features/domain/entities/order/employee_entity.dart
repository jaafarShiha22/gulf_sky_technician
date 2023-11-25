
class EmployeeEntity {
  int id;
  String? username;
  String? password;
  String? name;
  String? phone;
  String? fcmToken;
  String? token;
  String? image;
  int? branchId;
  DateTime? createdAt;
  DateTime? updatedAt;

  EmployeeEntity({
    required this.id,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.fcmToken,
    this.token,
    this.image,
    this.branchId,
    this.createdAt,
    this.updatedAt,
  });


  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "password": password,
    "name": name,
    "phone": phone,
    "fcm_token": fcmToken,
    "token": token,
    "image": image,
    "branch_id": branchId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}