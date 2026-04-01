import 'package:features_parking_location/domain/usecases/add_vehicle_to_parking_lot_usecase.dart';
import 'package:features_parking_location/domain/usecases/get_parking_lots_usecase.dart';
import 'package:features_parking_location/domain/usecases/get_parking_vehicles_usecase.dart';
import 'package:features_parking_location/presentation/bloc/parking_location_event.dart';
import 'package:features_parking_location/presentation/bloc/parking_location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class ParkingLocationBloc
    extends Bloc<ParkingLocationEvent, ParkingLocationState> {
  ParkingLocationBloc(
    this._getParkingLotsUseCase,
    this._addVehicleToParkingLotUseCase,
    this._getParkingVehiclesUseCase,
  ) : super(const ParkingLocationState()) {
    on<ParkingLocationLoad>(_onLoad);
    on<ParkingLocationLoadMore>(_onLoadMore);
    on<ParkingLocationAddVehicle>(_onAddVehicle);

    // Discharging vehicles
    on<ParkingLocationLoadDischargingVehicles>(_onLoadDischarging);
    on<ParkingLocationLoadMoreDischargingVehicles>(_onLoadMoreDischarging);

    // QC vehicles
    on<ParkingLocationLoadQcVehicles>(_onLoadQC);
    on<ParkingLocationLoadMoreQcVehicles>(_onLoadMoreQC);
  }

  final GetParkingLotsUseCase _getParkingLotsUseCase;
  final AddVehicleToParkingLotUseCase _addVehicleToParkingLotUseCase;
  final GetParkingVehiclesUseCase _getParkingVehiclesUseCase;

  Future<void> _onLoad(
    ParkingLocationLoad event,
    Emitter<ParkingLocationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ParkingLocationStatus.loading,
        page: 1,
        hasReachedMax: false,
        addVehicleStatus: AddVehicleStatus.initial,
      ),
    );

    final result = await _getParkingLotsUseCase(
      page: 1,
      size: AppConstants.defaultPageSize,
    );

    result.fold(
      (f) => emit(
        state.copyWith(status: ParkingLocationStatus.failure, failure: f),
      ),
      (resultList) {
        emit(
          state.copyWith(
            status: ParkingLocationStatus.success,
            parkingLots: resultList,
            page: 1,
            hasReachedMax: resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMore(
    ParkingLocationLoadMore event,
    Emitter<ParkingLocationState> emit,
  ) async {
    if (state.hasReachedMax || state.status != ParkingLocationStatus.success) {
      return;
    }

    final nextPage = state.page + 1;
    final result = await _getParkingLotsUseCase(
      page: nextPage,
      size: AppConstants.defaultPageSize,
    );

    result.fold(
      (f) => emit(
        state.copyWith(status: ParkingLocationStatus.failure, failure: f),
      ),
      (resultList) {
        emit(
          state.copyWith(
            status: ParkingLocationStatus.success,
            parkingLots: List.of(state.parkingLots)..addAll(resultList),
            page: nextPage,
            hasReachedMax: resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }

  Future<void> _onAddVehicle(
    ParkingLocationAddVehicle event,
    Emitter<ParkingLocationState> emit,
  ) async {
    emit(state.copyWith(addVehicleStatus: AddVehicleStatus.loading));

    final result = await _addVehicleToParkingLotUseCase(
      lotId: event.lotId,
      vehicleId: event.vehicleId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          addVehicleStatus: AddVehicleStatus.failure,
          addVehicleFailure: failure,
        ),
      ),
      (_) => emit(state.copyWith(addVehicleStatus: AddVehicleStatus.success)),
    );
  }

  Future<void> _onLoadDischarging(
    ParkingLocationLoadDischargingVehicles event,
    Emitter<ParkingLocationState> emit,
  ) async {
    emit(
      state.copyWith(
        dischargingStatus: ParkingLocationStatus.loading,
        dischargingPage: 1,
        dischargingHasReachedMax: false,
      ),
    );

    final result = await _getParkingVehiclesUseCase(
      const GetParkingVehiclesParams(
        status: 2,
        page: 1,
        size: AppConstants.defaultPageSize,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          dischargingStatus: ParkingLocationStatus.failure,
          dischargingFailure: f,
        ),
      ),
      (resultList) {
        emit(
          state.copyWith(
            dischargingStatus: ParkingLocationStatus.success,
            dischargingVehicles: resultList,
            dischargingPage: 1,
            dischargingHasReachedMax:
                resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreDischarging(
    ParkingLocationLoadMoreDischargingVehicles event,
    Emitter<ParkingLocationState> emit,
  ) async {
    if (state.dischargingHasReachedMax ||
        state.dischargingStatus != ParkingLocationStatus.success) {
      return;
    }

    final nextPage = state.dischargingPage + 1;
    final result = await _getParkingVehiclesUseCase(
      GetParkingVehiclesParams(
        status: 2,
        page: nextPage,
        size: AppConstants.defaultPageSize,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          dischargingStatus: ParkingLocationStatus.failure,
          dischargingFailure: f,
        ),
      ),
      (resultList) {
        emit(
          state.copyWith(
            dischargingStatus: ParkingLocationStatus.success,
            dischargingVehicles: List.of(state.dischargingVehicles)
              ..addAll(resultList),
            dischargingPage: nextPage,
            dischargingHasReachedMax:
                resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }

  Future<void> _onLoadQC(
    ParkingLocationLoadQcVehicles event,
    Emitter<ParkingLocationState> emit,
  ) async {
    emit(
      state.copyWith(
        qcStatus: ParkingLocationStatus.loading,
        qcPage: 1,
        qcHasReachedMax: false,
      ),
    );

    final result = await _getParkingVehiclesUseCase(
      const GetParkingVehiclesParams(
        status: 3,
        page: 1,
        size: AppConstants.defaultPageSize,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(qcStatus: ParkingLocationStatus.failure, qcFailure: f),
      ),
      (resultList) {
        emit(
          state.copyWith(
            qcStatus: ParkingLocationStatus.success,
            qcVehicles: resultList,
            qcPage: 1,
            qcHasReachedMax: resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreQC(
    ParkingLocationLoadMoreQcVehicles event,
    Emitter<ParkingLocationState> emit,
  ) async {
    if (state.qcHasReachedMax ||
        state.qcStatus != ParkingLocationStatus.success) {
      return;
    }

    final nextPage = state.qcPage + 1;
    final result = await _getParkingVehiclesUseCase(
      GetParkingVehiclesParams(
        status: 3,
        page: nextPage,
        size: AppConstants.defaultPageSize,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(qcStatus: ParkingLocationStatus.failure, qcFailure: f),
      ),
      (resultList) {
        emit(
          state.copyWith(
            qcStatus: ParkingLocationStatus.success,
            qcVehicles: List.of(state.qcVehicles)..addAll(resultList),
            qcPage: nextPage,
            qcHasReachedMax: resultList.length < AppConstants.defaultPageSize,
          ),
        );
      },
    );
  }
}
