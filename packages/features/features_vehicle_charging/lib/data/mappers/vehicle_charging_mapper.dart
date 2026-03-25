import 'package:features_vehicle_charging/data/models/vehicle_charging_dto.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';

extension VehicleChargingMapper on VehicleModelDto {
  VehicleChargingEntity toEntity() {
    return VehicleChargingEntity(
      id: id ?? 0,
      vin: serialNumber ?? '',
      model: model ?? '',
      color: color ?? '',
      statusLabel: statusLabel ?? '',
      warehouseImportedAt: warehouseImportedAt ?? '',
      storageDays: storageDays ?? 0,
      factoryName: factory?.name ?? '',
    );
  }
}

