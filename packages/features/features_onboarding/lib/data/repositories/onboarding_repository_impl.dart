import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/onboarding_page_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

/// Implementation of onboarding repository
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<Either<ApiFailure, List<OnboardingPageEntity>>>
  getOnboardingPages() async {
    try {
      final pages = await localDataSource.getOnboardingPages();
      return Right(pages);
    } catch (e) {
      return Left(
        ApiFailure.other('Failed to load onboarding pages: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<ApiFailure, bool>> completeOnboarding() async {
    try {
      debugPrint('📝 Onboarding - Marking as completed...');
      final result = await localDataSource.completeOnboarding();
      debugPrint('✅ Onboarding - Marked as completed: $result');
      return Right(result);
    } catch (e) {
      debugPrint('❌ Onboarding - Failed to complete: $e');
      return Left(
        ApiFailure.other('Failed to complete onboarding: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<ApiFailure, bool>> hasCompletedOnboarding() async {
    try {
      final hasCompleted = await localDataSource.hasCompletedOnboarding();
      return Right(hasCompleted);
    } catch (e) {
      return Left(
        ApiFailure.other('Failed to check onboarding status: ${e.toString()}'),
      );
    }
  }
}
