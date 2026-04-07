import 'package:equatable/equatable.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';

enum VehicleHistoryStatus { initial, loading, success, failure }

class VehicleHistoryState extends Equatable {
  const VehicleHistoryState({
    this.status = VehicleHistoryStatus.initial,
    this.allHistories = const [],
    this.page = 1,
    this.hasReachedMax = true,
    this.errorMessage,
  });

  final VehicleHistoryStatus status;
  final List<VehicleHistoryEntity> allHistories;
  final int page;
  final bool hasReachedMax;
  final String? errorMessage;

  bool get isInitial => status == VehicleHistoryStatus.initial;
  bool get isLoading => status == VehicleHistoryStatus.loading;
  bool get isSuccess => status == VehicleHistoryStatus.success;
  bool get isFailure => status == VehicleHistoryStatus.failure;

  @override
  List<Object?> get props => [
    status,
    allHistories,
    page,
    hasReachedMax,
    errorMessage,
  ];

  VehicleHistoryState copyWith({
    VehicleHistoryStatus? status,
    List<VehicleHistoryEntity>? allHistories,
    int? page,
    bool? hasReachedMax,
    String? Function()? errorMessage,
  }) {
    return VehicleHistoryState(
      status: status ?? this.status,
      allHistories: allHistories ?? this.allHistories,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
