/// Entity representing a Vehicle assigned to a Delivery Order.
class DeliveryOrderVehicleEntity {
  const DeliveryOrderVehicleEntity({
    required this.id,
    required this.serialNumber,
    required this.model,
    required this.color,
    required this.status,
    required this.statusLabel,
    required this.storageDays,
    this.materialCode,
    this.manufacturingDate,
    this.warehouseImportedAt,
    this.exportedAt,
  });

  final int id;
  final String serialNumber;
  final String model;
  final String color;
  final String? materialCode;
  final String? manufacturingDate;
  final int status;
  final String statusLabel;
  final String? warehouseImportedAt;
  final String? exportedAt;
  final int storageDays;
}
