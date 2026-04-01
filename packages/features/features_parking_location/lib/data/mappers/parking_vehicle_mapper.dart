import 'package:features_parking_location/data/models/parking_vehicle_dto.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';

extension ParkingVehicleMapper on ParkingVehicleDto {
  ParkingVehicleEntity toEntity() {
    return ParkingVehicleEntity(
      id: id ?? 0,
      vin: serialNumber ?? '-',
      model: model ?? '-',
      color: color ?? '-',
      statusLabel: statusLabel ?? '-',
      warehouseImportedAt: warehouseImportedAt,
      agingDays: agingDays,
    );
  }
}
