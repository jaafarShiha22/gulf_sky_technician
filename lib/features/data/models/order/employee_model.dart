
import 'package:gulf_sky_technician/features/domain/entities/order/employee_entity.dart';

class EmployeeModel  extends EmployeeEntity{

  EmployeeModel({
    required super.id,
    super.username,
    super.password,
    super.name,
    super.phone,
    super.fcmToken,
    super.token,
    super.image,
    super.branchId,
    super.createdAt,
    super.updatedAt,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> json) => EmployeeModel(
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