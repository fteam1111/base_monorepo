class VehicleChargingEntity {
  const VehicleChargingEntity({
    required this.id,
    required this.vin,
    required this.model,
    required this.color,
    required this.statusLabel,
    required this.warehouseImportedAt,
    required this.storageDays,
    required this.factoryName,
  });

  final int id;
  final String vin;
  final String model;
  final String color;
  final String statusLabel;
  final String warehouseImportedAt;
  final int storageDays;
  final String factoryName;

  /// Aging days is equivalent to storage days in current API.
  int get agingDays => storageDays;

  VehicleChargingEntity copyWith({
    int? id,
    String? vin,
    String? model,
    String? color,
    String? statusLabel,
    String? warehouseImportedAt,
    int? storageDays,
    String? factoryName,
  }) {
    return VehicleChargingEntity(
      id: id ?? this.id,
      vin: vin ?? this.vin,
      model: model ?? this.model,
      color: color ?? this.color,
      statusLabel: statusLabel ?? this.statusLabel,
      warehouseImportedAt: warehouseImportedAt ?? this.warehouseImportedAt,
      storageDays: storageDays ?? this.storageDays,
      factoryName: factoryName ?? this.factoryName,
    );
  }
}
