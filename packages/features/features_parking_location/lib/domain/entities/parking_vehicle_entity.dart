class ParkingVehicleEntity {
  const ParkingVehicleEntity({
    required this.id,
    required this.vin,
    required this.model,
    required this.color,
    required this.statusLabel,
    this.warehouseImportedAt,
    this.agingDays,
  });

  final int id;
  final String vin;
  final String model;
  final String color;
  final String statusLabel;
  final String? warehouseImportedAt;
  final int? agingDays;
}
