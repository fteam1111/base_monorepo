import 'package:features_delivery_order/data/models/client_vehicle_dto.dart';
import 'package:features_delivery_order/domain/entities/client_vehicle_entity.dart';

/// Extension to map [ClientVehicleDto] to [ClientVehicleEntity].
extension ClientVehicleDtoX on ClientVehicleDto {
  /// Converts [ClientVehicleDto] to [ClientVehicleEntity].
  ClientVehicleEntity toEntity() {
    return ClientVehicleEntity(
      id: id?.toString() ?? '',
      serialNumber: serialNumber ?? '',
      model: model ?? '',
      color: color ?? '',
      materialCode: materialCode,
      manufacturingDate: manufacturingDate,
      status: status,
      statusLabel: statusLabel,
      warehouseImportedAt: warehouseImportedAt,
      exportedAt: exportedAt,
      storageDays: storageDays,
      qcDefectDescription: qcDefectDescription,
      factoryName: factory?.name,
      factoryAddress: factory?.address,
    );
  }
}
