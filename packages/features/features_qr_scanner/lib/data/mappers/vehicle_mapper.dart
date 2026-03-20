import 'package:features_qr_scanner/data/models/vehicle_model_dto.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';

/// Extension to map [VehicleDto] to [VehicleEntity].
extension VehicleDtoMapper on VehicleDto {
  VehicleEntity toEntity() => VehicleEntity(
    id: id,
    serialNumber: serialNumber,
    materialCode: materialCode,
    model: model,
    manufacturingDate: manufacturingDate,
    color: color,
    status: status,
    statusLabel: statusLabel,
    warehouseImportedAt: warehouseImportedAt,
    exportedAt: exportedAt,
    storageDays: storageDays,
    qcDefectDescription: qcDefectDescription,
    factory: factory?.toEntity(),
    parkingLot: parkingLot?.toEntity(),
  );
}

/// Extension to map [VehicleFactoryDto] to [VehicleFactoryEntity].
extension VehicleFactoryDtoMapper on VehicleFactoryDto {
  VehicleFactoryEntity toEntity() =>
      VehicleFactoryEntity(id: id, name: name, address: address);
}

/// Extension to map [ParkingLotDto] to [ParkingLotEntity].
extension ParkingLotDtoMapper on ParkingLotDto {
  ParkingLotEntity toEntity() => ParkingLotEntity(
    id: id,
    name: name,
    description: description,
    parkingZoneId: parkingZoneId,
    parkingZone: parkingZone.toEntity(),
    maxCapacity: maxCapacity,
    currentOccupied: currentOccupied,
  );
}

/// Extension to map [ParkingZoneDto] to [ParkingZoneEntity].
extension ParkingZoneDtoMapper on ParkingZoneDto {
  ParkingZoneEntity toEntity() => ParkingZoneEntity(
    id: id,
    name: name,
    description: description,
    isActive: isActive,
    factoryId: factoryId,
  );
}
