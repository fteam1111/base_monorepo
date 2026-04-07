import 'package:core/core.dart';
import 'package:core/model/base_pagination_response.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';

abstract class IParkingHistoryRepository {
  Future<Either<ApiFailure, Pagination<List<VehicleHistoryEntity>>>>
  getVehicleHistory(int vehicleId, int page, int size);
}
