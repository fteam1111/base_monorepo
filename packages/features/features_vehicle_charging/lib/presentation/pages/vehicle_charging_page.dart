import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_bloc.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_event.dart';
import 'package:features_vehicle_charging/presentation/bloc/vehicle_charging_state.dart';
import 'package:features_vehicle_charging/presentation/widgets/charging_info_dialog.dart';
import 'package:features_vehicle_charging/presentation/widgets/vehicle_charging_list.dart';
import 'package:features_vehicle_charging/presentation/widgets/vehicle_charging_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/extensions/context_ext.dart';
import 'package:share/routes/app_routes.dart';

class VehicleChargingPage extends StatefulWidget {
  const VehicleChargingPage({super.key});

  @override
  State<VehicleChargingPage> createState() => _VehicleChargingPageState();
}

class _VehicleChargingPageState extends State<VehicleChargingPage> {
  final _searchController = TextEditingController();
  final _debounce = Debounce(delay: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: CustomAppBar(
        title: context.l10n.vehicleChargingAreaTitle,
        subtitle: context.l10n.vehicleChargingAreaSubtitle,
      ),
      body: BlocBuilder<VehicleChargingBloc, VehicleChargingState>(
        builder: (context, state) {
          final isInitialLoading =
              state.status == VehicleChargingStatus.loading &&
              state.vehicles.isEmpty;
          final isLoadingMore =
              state.status == VehicleChargingStatus.loading &&
              state.vehicles.isNotEmpty;

          Widget content;
          if (state.status == VehicleChargingStatus.initial ||
              isInitialLoading) {
            content = Padding(
              padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
              child: LoadingShimmer.circular(),
            );
          } else if (state.status == VehicleChargingStatus.failure &&
              state.vehicles.isEmpty) {
            content = Center(
              child: Text(
                context.l10n.vehicleChargingFetchError,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else if (state.vehicles.isEmpty) {
            content = const _VehicleChargingEmptyView();
          } else {
            content = VehicleChargingList(
              items: state.vehicles,
              isLoading: isLoadingMore,
              onTapInfo: (item) => _showChargingInfoDialog(context, item),
              onRefresh: () async {
                final bloc = context.read<VehicleChargingBloc>();
                bloc.add(const VehicleChargingRefreshRequested());

                // Wait until status is no longer loading
                await bloc.stream.firstWhere(
                  (s) => s.status != VehicleChargingStatus.loading,
                );
              },
              onLoadMore: () {
                context.read<VehicleChargingBloc>().add(
                  const VehicleChargingLoadMoreRequested(),
                );
              },
            );
          }

          return Column(
            children: [
              _VehicleChargingWarningBanner(
                totalNeedHandle: state.vehicles.length,
              ),
              VehicleChargingSearchBar(controller: _searchController),
              Expanded(child: content),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showChargingInfoDialog(
    BuildContext context,
    VehicleChargingEntity item,
  ) async {
    final shouldDischarge = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return ChargingInfoDialog(item: item);
      },
    );

    if (shouldDischarge == true && context.mounted) {
      await AppRoutes.navigateToDischargingResult(context, extra: item);
      if (context.mounted) {
        context.read<VehicleChargingBloc>().add(
          const VehicleChargingRefreshRequested(),
        );
      }
    }
  }

  void _onSearchChanged() {
    _debounce(() {
      if (!mounted) return;
      context.read<VehicleChargingBloc>().add(
        VehicleChargingSearchRequested(_searchController.text.trim()),
      );
    });
  }
}

class _VehicleChargingWarningBanner extends StatelessWidget {
  const _VehicleChargingWarningBanner({required this.totalNeedHandle});

  final int totalNeedHandle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.small,
      ),
      color: context.appColors.warningContainer,
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: context.appColors.warning),
          const Gap(AppSpacing.small),
          Expanded(
            child: Text(
              context.l10n.vehicleChargingAgingWarning(totalNeedHandle),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.appColors.warning,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleChargingEmptyView extends StatelessWidget {
  const _VehicleChargingEmptyView();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
          ),
          child: const Icon(Icons.bolt_outlined, size: 40),
        ),
        const Gap(AppSpacing.sectionSpacing),
        Text(
          context.l10n.vehicleChargingEmptyTitle,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(AppSpacing.small),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appSpacing.pageHorizontal * 2,
          ),
          child: Text(
            context.l10n.vehicleChargingEmptySubtitle,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.tertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
