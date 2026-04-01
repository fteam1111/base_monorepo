import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:features_vehicle/domain/usecases/send_for_discharging_usecase.dart';
import 'package:features_vehicle/domain/usecases/send_vehicle_to_qc_usecase.dart';
import 'package:features_vehicle/presentation/cubit/vehicle_action_state.dart';

class VehicleActionCubit extends Cubit<VehicleActionState> {
  VehicleActionCubit(this._sendToQcUseCase, this._sendForDischargingUseCase)
    : super(const VehicleActionInitial());

  final SendVehicleToQcUseCase _sendToQcUseCase;
  final VehicleActionSendForDischargingUseCase _sendForDischargingUseCase;

  Future<void> sendToQc(int vehicleId, String reason) async {
    emit(const VehicleActionLoading());
    final result = await _sendToQcUseCase(vehicleId: vehicleId, reason: reason);

    result.fold(
      (failure) =>
          emit(VehicleActionFailure(failure.nonTranslatedFailureMessage)),
      (_) => emit(const VehicleActionSuccess(VehicleActionCompleted.qc)),
    );
  }

  Future<void> sendForDischarging(int vehicleId) async {
    emit(const VehicleActionLoading());
    final result = await _sendForDischargingUseCase(vehicleId: vehicleId);

    result.fold(
      (failure) =>
          emit(VehicleActionFailure(failure.nonTranslatedFailureMessage)),
      (_) => emit(const VehicleActionSuccess(VehicleActionCompleted.charging)),
    );
  }
}
