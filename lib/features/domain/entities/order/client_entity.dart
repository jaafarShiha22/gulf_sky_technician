class ClientEntity {
  int id;
  String name;
  String? company;
  String? phone;
  String? email;
  String? mobile;
  String? password;
  String? address;
  String? token;
  String? fcmToken;
  int? tenant;
  String? image;
  int? branchId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? stripeId;
  String? pmType;
  String? pmLastFour;

  ClientEntity({
    required this.id,
    required this.name,
    this.company,
    this.phone,
    this.email,
    this.mobile,
    this.password,
    this.address,
    this.token,
    this.fcmToken,
    this.tenant,
    this.image,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "company": company,
        "phone": phone,
        "email": email,
        "mobile": mobile,
        "password": password,
        "address": address,
        "token": token,
        "fcm_token": fcmToken,
        "tenant": tenant,
        "image": image,
        "branch_id": branchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "stripe_id": stripeId,
        "pm_type": pmType,
        "pm_last_four": pmLastFour,
      };
}
