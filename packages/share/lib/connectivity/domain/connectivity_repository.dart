import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

abstract class ConnectivityRepository {
  Future<Either<ApiFailure, Unit>> initializeConnectivity();

  Stream<bool> watchNetworkAvailability();
}
