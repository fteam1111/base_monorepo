import 'package:core/core.dart';
import 'package:core/factory/domain/entities/factory_entity.dart';
import 'package:equatable/equatable.dart';

enum FactoryStatus { initial, loading, success, failure }

final class FactoryState extends Equatable {
  const FactoryState({
    this.status = FactoryStatus.initial,
    this.factories = const <FactoryEntity>[],
    this.failure,
  });

  final FactoryStatus status;
  final List<FactoryEntity> factories;
  final ApiFailure? failure;

  FactoryState copyWith({
    FactoryStatus? status,
    List<FactoryEntity>? factories,
    ApiFailure? failure,
    bool clearFailure = false,
  }) {
    return FactoryState(
      status: status ?? this.status,
      factories: factories ?? this.factories,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [status, factories, failure];
}


