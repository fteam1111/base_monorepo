/// Vehicle status values stored as integers in the database.
enum VehicleStatus {
  inStock(1),
  discharging(2),
  defective(3),
  exported(4),
  pendingImport(5);

  const VehicleStatus(this.value);

  /// The integer value stored in the database.
  final int value;

  /// Returns a [VehicleStatus] from its integer [value], or `null`
  /// if no matching status is found.
  static VehicleStatus? fromValue(int value) {
    for (final status in VehicleStatus.values) {
      if (status.value == value) return status;
    }
    return null;
  }
}

/// Extension providing a display label for each [VehicleStatus].
extension VehicleStatusLabel on VehicleStatus {
  String get label => switch (this) {
    VehicleStatus.inStock => 'Trong kho',
    VehicleStatus.discharging => 'Sạc xả',
    VehicleStatus.defective => 'Xe lỗi',
    VehicleStatus.exported => 'Đã xuất',
    VehicleStatus.pendingImport => 'Chờ nhập',
  };
}

class ParkingZoneEntity {
  const ParkingZoneEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
    required this.factoryId,
  });

  final int id;
  final String name;
  final String description;
  final bool isActive;
  final int factoryId;
}

/// Entity for parking lot information.
class ParkingLotEntity {
  const ParkingLotEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.parkingZoneId,
    required this.parkingZone,
    required this.maxCapacity,
    required this.currentOccupied,
  });

  final int id;
  final String name;
  final String description;
  final int parkingZoneId;
  final ParkingZoneEntity parkingZone;
  final int maxCapacity;
  final int currentOccupied;
}

/// Entity for factory information.
class VehicleFactoryEntity {
  const VehicleFactoryEntity({
    required this.id,
    required this.name,
    required this.address,
  });

  final int id;
  final String name;
  final String address;
}

/// Entity representing a vehicle and its full details.
class VehicleEntity {
  const VehicleEntity({
    required this.id,
    required this.serialNumber,
    required this.materialCode,
    required this.model,
    required this.manufacturingDate,
    required this.color,
    required this.status,
    required this.statusLabel,
    required this.warehouseImportedAt,
    required this.storageDays,
    this.exportedAt,
    this.qcDefectDescription,
    this.factory,
    this.parkingLot,
  });

  final int id;
  final String serialNumber;
  final String materialCode;
  final String model;
  final String manufacturingDate;
  final String color;
  final VehicleStatus status;
  final String statusLabel;
  final String warehouseImportedAt;
  final String? exportedAt;
  final int storageDays;
  final String? qcDefectDescription;
  final VehicleFactoryEntity? factory;
  final ParkingLotEntity? parkingLot;
}
