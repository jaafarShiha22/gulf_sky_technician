import '../../../domain/entities/order/item_entity.dart';

class ItemModel extends ItemEntity{


  ItemModel({
    required super.id,
    required super.orderId,
    required super.itemId,
    required super.quantity,
    super.quantityUsed,
    required super.state,
    super.note,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
    id: json["id"],
    orderId: json["order_id"],
    itemId: json["item_id"],
    quantity: json["quantity"],
    quantityUsed: json["quantity_used"],
    state: json["state"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

}