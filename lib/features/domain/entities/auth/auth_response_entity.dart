class AuthResponseEntity {
  int id;
  String username;
  String password;
  String name;
  String phone;
  String fcmToken;
  String token;
  dynamic image;
  int branchId;
  DateTime createdAt;
  DateTime updatedAt;

  AuthResponseEntity({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.fcmToken,
    required this.token,
    this.image,
    required this.branchId,
    required this.createdAt,
    required this.updatedAt,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  factory AuthResponseEntity.fromMap(Map<String, dynamic> json) => AuthResponseEntity(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    phone: json["phone"],
    fcmToken: json["fcm_token"],
    token: json["token"],
    image: json["image"],
    branchId: json["branch_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
