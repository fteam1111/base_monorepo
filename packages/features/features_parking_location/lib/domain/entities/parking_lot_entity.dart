import 'package:equatable/equatable.dart';

class ParkingLotEntity extends Equatable {
  const ParkingLotEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.parkingZoneId,
    required this.maxCapacity,
    required this.currentOccupied,
  });

  final int id;
  final String name;
  final String description;
  final int parkingZoneId;
  final int maxCapacity;
  final int currentOccupied;

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    parkingZoneId,
    maxCapacity,
    currentOccupied,
  ];
}
