import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

abstract class DeepLinkingRepository {
  Future<Either<ApiFailure, Unit>> initializeDeepLink();

  Stream<AppLink> watchDeepLinkValue();
}
