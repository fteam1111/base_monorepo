import 'package:equatable/equatable.dart';

class ExportAreaEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final int capacity;
  final int currentCapacity;
  final int availableCapacity;
  final int factoryId;

  const ExportAreaEntity({
    required this.id,
    required this.name,
    this.address = '',
    required this.capacity,
    required this.currentCapacity,
    required this.availableCapacity,
    required this.factoryId,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    capacity,
    currentCapacity,
    availableCapacity,
    factoryId,
  ];
}
