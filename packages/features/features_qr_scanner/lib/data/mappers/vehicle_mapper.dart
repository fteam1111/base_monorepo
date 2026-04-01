import 'package:features_qr_scanner/data/models/vehicle_model_dto.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';

/// Extension to map [VehicleDto] to [VehicleEntity].
extension VehicleDtoMapper on VehicleDto {
  VehicleEntity toEntity() => VehicleEntity(
    id: id ?? 0,
    serialNumber: serialNumber ?? '',
    materialCode: materialCode ?? '',
    model: model ?? '',
    manufacturingDate: manufacturingDate ?? '',
    color: color ?? '',
    status: VehicleStatus.fromValue(status ?? 1) ?? VehicleStatus.inStock,
    statusLabel: statusLabel ?? '',
    warehouseImportedAt: warehouseImportedAt ?? '',
    exportedAt: exportedAt,
    storageDays: storageDays ?? 0,
    qcDefectDescription: qcDefectDescription,
    factory: factory?.toEntity(),
    parkingLot: parkingLot?.toEntity(),
  );
}

/// Extension to map [VehicleFactoryDto] to [VehicleFactoryEntity].
extension VehicleFactoryDtoMapper on VehicleFactoryDto {
  VehicleFactoryEntity toEntity() => VehicleFactoryEntity(
    id: id ?? 0,
    name: name ?? '',
    address: address ?? '',
  );
}

/// Extension to map [ParkingLotDto] to [ParkingLotEntity].
extension ParkingLotDtoMapper on ParkingLotDto {
  ParkingLotEntity toEntity() => ParkingLotEntity(
    id: id ?? 0,
    name: name ?? '',
    description: description ?? '',
    parkingZoneId: parkingZoneId ?? 0,
    parkingZone:
        parkingZone?.toEntity() ??
        const ParkingZoneEntity(
          id: 0,
          name: '',
          description: '',
          isActive: false,
          factoryId: 0,
        ),
    maxCapacity: maxCapacity ?? 0,
    currentOccupied: currentOccupied ?? 0,
  );
}

/// Extension to map [ParkingZoneDto] to [ParkingZoneEntity].
extension ParkingZoneDtoMapper on ParkingZoneDto {
  ParkingZoneEntity toEntity() => ParkingZoneEntity(
    id: id ?? 0,
    name: name ?? '',
    description: description ?? '',
    isActive: isActive ?? false,
    factoryId: factoryId ?? 0,
  );
}
