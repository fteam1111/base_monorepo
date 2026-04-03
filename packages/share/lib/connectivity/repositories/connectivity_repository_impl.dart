import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:share/connectivity/connectivity_service.dart';
import 'package:share/connectivity/domain/connectivity_repository.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final ConnectivityService connectivityService;

  ConnectivityRepositoryImpl({required this.connectivityService});

  @override
  Stream<bool> watchNetworkAvailability() => connectivityService.getStream;

  @override
  Future<Either<ApiFailure, Unit>> initializeConnectivity() async {
    try {
      connectivityService.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
