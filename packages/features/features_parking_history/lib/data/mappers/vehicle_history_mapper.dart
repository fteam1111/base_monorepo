import 'package:features_parking_history/data/models/vehicle_history_dto.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';

extension VehicleHistoryDtoX on VehicleHistoryDto {
  VehicleHistoryEntity toEntity() {
    return VehicleHistoryEntity(
      id: id,
      action: VehicleAction.fromString(action),
      performedBy: performedBy,
      performedAt: performedAt,
      status: status,
      performedByName: performedByName,
      performedByAccount: performedByAccount,
      storageDays: storageDays,
      factoryObj: factory?.toEntity(),
      area: area?.toEntity(),
      position: position?.toEntity(),
      parkingLot: parkingLot?.toEntity(),
      parkingZone: parkingZone?.toEntity(),
      notes: notes,
      deliveryOrder: deliveryOrder?.toEntity(),
    );
  }
}

extension DeliveryOrderRefDtoX on DeliveryOrderRefDto {
  DeliveryOrderRefEntity toEntity() {
    return DeliveryOrderRefEntity(id: id, doCode: doCode);
  }
}

extension FactoryRefDtoX on FactoryRefDto {
  FactoryRefEntity toEntity() {
    return FactoryRefEntity(id: id, name: name, address: address);
  }
}

extension AreaRefDtoX on AreaRefDto {
  AreaRefEntity toEntity() {
    return AreaRefEntity(id: id, name: name, type: type);
  }
}

extension LocationRefDtoX on LocationRefDto {
  LocationRefEntity toEntity() {
    return LocationRefEntity(id: id, name: name);
  }
}
