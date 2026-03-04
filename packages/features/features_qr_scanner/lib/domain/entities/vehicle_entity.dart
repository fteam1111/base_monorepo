/// Entity for parking zone information.
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
  final int status;
  final String statusLabel;
  final String warehouseImportedAt;
  final String? exportedAt;
  final int storageDays;
  final String? qcDefectDescription;
  final VehicleFactoryEntity? factory;
  final ParkingLotEntity? parkingLot;
}
