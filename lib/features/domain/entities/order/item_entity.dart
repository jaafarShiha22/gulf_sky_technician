class ItemEntity {
  int id;
  int orderId;
  int itemId;
  int quantity;
  int? quantityUsed;
  String state;
  String? note;
  DateTime createdAt;
  DateTime? updatedAt;

  ItemEntity({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.quantity,
    this.quantityUsed,
    required this.state,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    "id": id,
    "order_id": orderId,
    "item_id": itemId,
    "quantity": quantity,
    "quantity_used": quantityUsed,
    "state": state,
    "note": note,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}