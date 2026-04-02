import 'package:features_parking_location/domain/usecases/add_vehicle_to_export_area_do_usecase.dart';
import 'package:features_parking_location/domain/usecases/get_export_area_delivery_orders_usecase.dart';
import 'package:features_parking_location/presentation/bloc/export_area_do_event.dart';
import 'package:features_parking_location/presentation/bloc/export_area_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportAreaDoBloc extends Bloc<ExportAreaDoEvent, ExportAreaDoState> {
  ExportAreaDoBloc(
    this._getExportAreaDeliveryOrdersUseCase,
    this._addVehicleToExportAreaDoUseCase,
  ) : super(const ExportAreaDoState()) {
    on<ExportAreaDoLoad>(_onLoad);
    on<ExportAreaDoAddVehicle>(_onAddVehicle);
  }

  final GetExportAreaDeliveryOrdersUseCase _getExportAreaDeliveryOrdersUseCase;
  final AddVehicleToExportAreaDoUseCase _addVehicleToExportAreaDoUseCase;

  Future<void> _onLoad(
    ExportAreaDoLoad event,
    Emitter<ExportAreaDoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ExportAreaDoStatus.loading,
        addVehicleStatus: ExportAreaDoAddVehicleStatus.initial,
      ),
    );

    final result = await _getExportAreaDeliveryOrdersUseCase(event.areaId);

    result.fold(
      (f) =>
          emit(state.copyWith(status: ExportAreaDoStatus.failure, failure: f)),
      (resultList) {
        emit(
          state.copyWith(
            status: ExportAreaDoStatus.success,
            deliveryOrders: resultList,
          ),
        );
      },
    );
  }

  Future<void> _onAddVehicle(
    ExportAreaDoAddVehicle event,
    Emitter<ExportAreaDoState> emit,
  ) async {
    emit(
      state.copyWith(addVehicleStatus: ExportAreaDoAddVehicleStatus.loading),
    );

    final result = await _addVehicleToExportAreaDoUseCase(
      AddVehicleToExportAreaDoParams(
        doId: event.doId,
        vehicleId: event.vehicleId,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          addVehicleStatus: ExportAreaDoAddVehicleStatus.failure,
          addVehicleFailure: f,
        ),
      ),
      (_) => emit(
        state.copyWith(addVehicleStatus: ExportAreaDoAddVehicleStatus.success),
      ),
    );
  }
}
