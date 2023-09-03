class CartItemModel {
  final String userId;
  final String plantId;
  final String plantImage;
  final String plantName;
  final int quantity;
  final int price;
  final int total;
  final int points;
  const CartItemModel(
      {required this.plantId,
      required this.price,
      required this.quantity,
      required this.userId,
      required this.total,
      required this.plantImage,
      required this.points,
      required this.plantName});

  //from map
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      plantId: map["plantId"] ?? "",
      price: map["price"] ?? "",
      quantity: map["quantity"] ?? "",
      total: map["total"] ?? "",
      userId: map['userId'] ?? "",
      plantImage: map['plantImage'] ?? "",
      plantName: map['plantName'] ?? "",
      points: map['points'] ?? "",
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "plantId": plantId,
      "price": price,
      "total": total,
      "quantity": quantity,
      "userId": userId,
      "plantImage": plantImage,
      "plantName": plantName,
      "points": points
    };
  }
}
