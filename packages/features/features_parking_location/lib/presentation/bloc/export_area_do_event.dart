import 'package:equatable/equatable.dart';

sealed class ExportAreaDoEvent extends Equatable {
  const ExportAreaDoEvent();

  @override
  List<Object?> get props => [];
}

final class ExportAreaDoLoad extends ExportAreaDoEvent {
  const ExportAreaDoLoad(this.areaId);

  final int areaId;

  @override
  List<Object?> get props => [areaId];
}

final class ExportAreaDoAddVehicle extends ExportAreaDoEvent {
  const ExportAreaDoAddVehicle({required this.doId, required this.vehicleId});

  final int doId;
  final String vehicleId;

  @override
  List<Object?> get props => [doId, vehicleId];
}
