import 'package:equatable/equatable.dart';

/// Define the type of action completed successfully.
enum VehicleActionCompleted { qc, charging }

sealed class VehicleActionState extends Equatable {
  const VehicleActionState();

  @override
  List<Object?> get props => [];
}

final class VehicleActionInitial extends VehicleActionState {
  const VehicleActionInitial();
}

final class VehicleActionLoading extends VehicleActionState {
  const VehicleActionLoading();
}

final class VehicleActionSuccess extends VehicleActionState {
  const VehicleActionSuccess(this.completedAction);

  final VehicleActionCompleted completedAction;

  @override
  List<Object?> get props => [completedAction];
}

final class VehicleActionFailure extends VehicleActionState {
  const VehicleActionFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
