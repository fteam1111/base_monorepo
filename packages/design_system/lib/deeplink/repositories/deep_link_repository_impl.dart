import 'dart:async';

import 'package:core/core.dart';
import 'package:share/share.dart';
import 'package:dartz/dartz.dart';
import 'package:design_system/deeplink/domain/repositories/deep_link_repository.dart';

class DeepLinkingRepositoryImpl implements DeepLinkingRepository {
  final DeepLinkingService service;

  DeepLinkingRepositoryImpl({required this.service});

  @override
  Future<Either<ApiFailure, Unit>> initializeDeepLink() async {
    try {
      await service.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Stream<AppLink> watchDeepLinkValue() => service.getStream;
}
