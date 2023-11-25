import '../../../domain/entities/auth/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity{

  AuthResponseModel({
    required super.id,
    required super.username,
    required super.password,
    required super.name,
    required super.phone,
    required super.fcmToken,
    required super.token,
    super.image,
    required super.branchId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
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
