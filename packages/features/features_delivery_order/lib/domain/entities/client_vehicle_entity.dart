import 'package:equatable/equatable.dart';

/// Entity representing a vehicle stored at the client factory.
class ClientVehicleEntity extends Equatable {
  const ClientVehicleEntity({
    required this.id,
    required this.serialNumber,
    required this.model,
    required this.color,
    this.materialCode,
    this.manufacturingDate,
    this.status,
    this.statusLabel,
    this.warehouseImportedAt,
    this.exportedAt,
    this.storageDays,
    this.qcDefectDescription,
    this.factoryName,
    this.factoryAddress,
  });

  final String id;
  final String serialNumber;
  final String model;
  final String color;
  final String? materialCode;
  final String? manufacturingDate;
  final int? status;
  final String? statusLabel;
  final String? warehouseImportedAt;
  final String? exportedAt;
  final int? storageDays;
  final String? qcDefectDescription;
  final String? factoryName;
  final String? factoryAddress;

  // Existing getters for compatibility with UI widgets
  String? get zone => factoryName;
  String? get date => warehouseImportedAt;

  @override
  List<Object?> get props => [
    id,
    serialNumber,
    model,
    color,
    materialCode,
    manufacturingDate,
    status,
    statusLabel,
    warehouseImportedAt,
    exportedAt,
    storageDays,
    qcDefectDescription,
    factoryName,
    factoryAddress,
  ];
}
