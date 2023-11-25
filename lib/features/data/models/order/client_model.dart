import 'package:gulf_sky_technician/features/domain/entities/order/client_entity.dart';

class ClientModel extends ClientEntity {

  ClientModel({
    required super.id,
    required super.name,
    super.company,
    super.phone,
    super.email,
    super.mobile,
    super.password,
    super.address,
    super.token,
    super.fcmToken,
    super.tenant,
    super.image,
    super.branchId,
    super.createdAt,
    super.updatedAt,
    super.stripeId,
    super.pmType,
    super.pmLastFour,
  });

  factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
    id: json["id"],
    name: json["name"],
    company: json["company"],
    phone: json["phone"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
    address: json["address"],
    token: json["token"],
    fcmToken: json["fcm_token"],
    tenant: json["tenant"],
    image: json["image"],
    branchId: json["branch_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    stripeId: json["stripe_id"],
    pmType: json["pm_type"],
    pmLastFour: json["pm_last_four"],
  );

}
