import 'package:features_parking_location/data/models/parking_lot_dto.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';

extension ParkingLotDtoMapper on ParkingLotDto {
  ParkingLotEntity toEntity() {
    return ParkingLotEntity(
      id: id ?? 0,
      name: name ?? '',
      description: description ?? '',
      parkingZoneId: parkingZoneId ?? 0,
      maxCapacity: maxCapacity ?? 0,
      currentOccupied: currentOccupied ?? 0,
    );
  }
}
