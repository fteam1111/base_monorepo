/// Entity representing a Delivery Order from the list API.
class DeliveryOrderEntity {
  const DeliveryOrderEntity({
    required this.id,
    required this.doCode,
    required this.factoryId,
    required this.status,
    required this.totalQuantity,
    required this.fulfilledQuantity,
    required this.createdAt,
    required this.updatedAt,
    this.storeName,
    this.storeBranch,
    this.items = const [],
  });

  final int id;
  final String doCode;
  final int factoryId;
  final String? storeName;
  final String? storeBranch;

  /// Status: PENDING, PREPARING, READY
  final String status;
  final int totalQuantity;
  final int fulfilledQuantity;
  final String createdAt;
  final String updatedAt;
  final List<DeliveryOrderItemEntity> items;

  /// Progress ratio from 0.0 to 1.0.
  double get progress =>
      totalQuantity > 0 ? fulfilledQuantity / totalQuantity : 0.0;
}

/// Entity representing a line item within a Delivery Order.
class DeliveryOrderItemEntity {
  const DeliveryOrderItemEntity({
    required this.id,
    required this.vehicleModel,
    required this.color,
    required this.quantity,
  });

  final int id;
  final String vehicleModel;
  final String color;
  final int quantity;
}
