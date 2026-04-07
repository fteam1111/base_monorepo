import 'package:equatable/equatable.dart';

enum VehicleAction {
  import('IMPORT'),
  moveToCharge('MOVE_TO_CHARGE'),
  moveToQc('MOVE_TO_QC'),
  assignToDo('ASSIGN_TO_DO');

  const VehicleAction(this.value);
  final String value;

  static VehicleAction fromString(String val) {
    return VehicleAction.values.firstWhere(
      (e) => e.value == val,
      orElse: () => VehicleAction.import,
    );
  }
}

class VehicleHistoryEntity extends Equatable {
  const VehicleHistoryEntity({
    required this.id,
    required this.action,
    required this.performedBy,
    required this.performedAt,
    required this.status,
    required this.performedByName,
    required this.performedByAccount,
    required this.storageDays,
    this.factoryObj,
    this.area,
    this.position,
    this.parkingLot,
    this.parkingZone,
    this.notes,
    this.deliveryOrder,
  });

  final int id;
  final VehicleAction action;
  final String performedBy;
  final DateTime? performedAt;
  final int status;
  final String? performedByName;
  final String? performedByAccount;
  final int? storageDays;
  final FactoryRefEntity? factoryObj;
  final AreaRefEntity? area;
  final LocationRefEntity? position;
  final LocationRefEntity? parkingLot;
  final LocationRefEntity? parkingZone;
  final String? notes;
  final DeliveryOrderRefEntity? deliveryOrder;

  @override
  List<Object?> get props => [
    id,
    action,
    performedBy,
    performedAt,
    status,
    performedByName,
    performedByAccount,
    storageDays,
    factoryObj,
    area,
    position,
    parkingLot,
    parkingZone,
    notes,
    deliveryOrder,
  ];
}

class DeliveryOrderRefEntity extends Equatable {
  const DeliveryOrderRefEntity({required this.id, required this.doCode});

  final int id;
  final String doCode;

  @override
  List<Object?> get props => [id, doCode];
}

class FactoryRefEntity extends Equatable {
  const FactoryRefEntity({required this.id, required this.name, this.address});
  final int id;
  final String name;
  final String? address;

  @override
  List<Object?> get props => [id, name, address];
}

class AreaRefEntity extends Equatable {
  const AreaRefEntity({required this.id, required this.name, this.type});
  final int id;
  final String name;
  final String? type;

  @override
  List<Object?> get props => [id, name, type];
}

class LocationRefEntity extends Equatable {
  const LocationRefEntity({required this.id, required this.name});
  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
