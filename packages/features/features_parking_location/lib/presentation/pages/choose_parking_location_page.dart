import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';
import 'package:features_parking_location/domain/entities/parking_lot_entity.dart';
import 'package:features_parking_location/domain/entities/parking_vehicle_entity.dart';
import 'package:features_parking_location/presentation/bloc/parking_location_bloc.dart';
import 'package:features_parking_location/presentation/bloc/parking_location_event.dart';
import 'package:features_parking_location/presentation/bloc/parking_location_state.dart';
import 'package:features_parking_location/presentation/widgets/parking_export_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_grid_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_list_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_selection_bottom_sheet.dart';
import 'package:features_parking_location/presentation/widgets/parking_tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

enum ParkingTab { finished, charging, export, qc }

class ChooseParkingLocationPage extends StatefulWidget {
  const ChooseParkingLocationPage({
    super.key,
    this.initialTab = ParkingTab.finished,
    this.vehicleId,
    this.canAddVehicleToDo = true,
  });

  final ParkingTab initialTab;
  final int? vehicleId;
  final bool canAddVehicleToDo;

  @override
  State<ChooseParkingLocationPage> createState() =>
      _ChooseParkingLocationPageState();
}

class _ChooseParkingLocationPageState extends State<ChooseParkingLocationPage> {
  late ParkingTab _selectedTab;

  late final ScrollController _finishedController;
  late final ScrollController _chargingController;
  late final ScrollController _exportController;
  late final ScrollController _qcController;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
    _finishedController = ScrollController();
    _chargingController = ScrollController();
    _exportController = ScrollController();
    _qcController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ParkingLocationBloc>().add(
          const ParkingLocationLoadDischargingVehicles(),
        );
        context.read<ParkingLocationBloc>().add(
          const ParkingLocationLoadQcVehicles(),
        );

        final factoryId =
            context.read<FactoryCubit>().state.factories.firstOrNull?.id ?? 1;
        context.read<ParkingLocationBloc>().add(
          ParkingLocationLoadExportAreas(factoryId: factoryId),
        );
      }
    });
  }

  @override
  void dispose() {
    _finishedController.dispose();
    _chargingController.dispose();
    _exportController.dispose();
    _qcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceContainerLowest,
      appBar: CustomAppBar(
        centerTitle: false,
        title: context.l10n.chooseParkingLocation,
        subtitle: context.l10n.businessAreaClassification,
        onBack: () => AppRoutes.navigateToHome(context),
      ),
      body: Column(
        children: [
          ParkingTabBarSection(
            selectedTab: _selectedTab,
            onTabChanged: (tab) => setState(() => _selectedTab = tab),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.appSpacing.pageHorizontal,
              ),
              child: _buildTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case ParkingTab.finished:
        return BlocConsumer<ParkingLocationBloc, ParkingLocationState>(
          listenWhen: (previous, current) =>
              previous.addVehicleStatus != current.addVehicleStatus,
          listener: (context, state) {
            if (state.addVehicleStatus == AddVehicleStatus.loading) {
              GlobalLoading.showLoadingDialog();
            } else {
              GlobalLoading.dismiss();
              if (state.addVehicleStatus == AddVehicleStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.addVehicleFailure?.nonTranslatedFailureMessage ??
                          context.l10n.error,
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return ScrollableGridView<ParkingLotEntity>(
              controller: _finishedController,
              footer: SizedBox(height: context.bottomPadding + AppSpacing.xxl),
              isLoading: state.status == ParkingLocationStatus.loading,
              items: state.parkingLots,
              noRecordFoundWidget: const SizedBox.shrink(),
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.gridSpacing,
              crossAxisSpacing: AppSpacing.gridSpacing,
              childAspectRatio: 0.87,
              onRefresh: () async {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoad(),
                );
              },
              onLoadingMore: () {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoadMore(),
                );
              },
              itemBuilder: (context, index, item) {
                return ParkingGridItem(
                  label: item.name,
                  current: item.currentOccupied,
                  total: item.maxCapacity,
                  onPressed: () {
                    ParkingSelectionBottomSheet.show(
                      context,
                      factory: '-', // Not available in API DTO directly
                      area: item.description,
                      position: item.name,
                      onConfirm: () {
                        // Dismiss the bottom sheet
                        Navigator.of(context).pop();

                        if (widget.vehicleId != null) {
                          context.read<ParkingLocationBloc>().add(
                            ParkingLocationAddVehicle(
                              lotId: item.id,
                              vehicleId: widget.vehicleId!,
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              },
            );
          },
        );

      case ParkingTab.charging:
        return BlocBuilder<ParkingLocationBloc, ParkingLocationState>(
          builder: (context, state) {
            return ScrollList<ParkingVehicleEntity>(
              controller: _chargingController,
              footer: SizedBox(height: context.bottomPadding + AppSpacing.xxl),
              isLoading:
                  state.dischargingStatus == ParkingLocationStatus.loading,
              items: state.dischargingVehicles,
              noRecordFoundWidget: const SizedBox.shrink(),
              onRefresh: () async {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoadDischargingVehicles(),
                );
              },
              onLoadingMore: () {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoadMoreDischargingVehicles(),
                );
              },
              itemBuilder: (context, index, item) {
                return ParkingListItem(
                  vin: item.vin,
                  model: item.model,
                  station: item.color,
                  entryTime: item.warehouseImportedAt ?? '-',
                );
              },
            );
          },
        );

      case ParkingTab.export:
        return BlocBuilder<ParkingLocationBloc, ParkingLocationState>(
          builder: (context, state) {
            return ScrollList<ExportAreaEntity>(
              controller: _exportController,
              footer: SizedBox(height: context.bottomPadding + AppSpacing.xxl),
              isLoading:
                  state.exportAreasStatus == ParkingLocationStatus.loading,
              items: state.exportAreas,
              noRecordFoundWidget: const SizedBox.shrink(),
              onRefresh: () async {
                final factoryId =
                    context
                        .read<FactoryCubit>()
                        .state
                        .factories
                        .firstOrNull
                        ?.id ??
                    1;
                context.read<ParkingLocationBloc>().add(
                  ParkingLocationLoadExportAreas(factoryId: factoryId),
                );
              },
              itemBuilder: (context, index, item) {
                return ParkingExportItem(
                  name: item.name,
                  currentCapacity: item.currentCapacity,
                  capacity: item.capacity,
                  onPressed: () {
                    AppRoutes.navigateToExportAreaDeliveryOrders(
                      context,
                      areaId: item.id,
                      areaName: item.name,
                      vehicleId: widget.vehicleId?.toString(),
                      canAddVehicleToDo: widget.canAddVehicleToDo,
                    );
                  },
                );
              },
            );
          },
        );

      case ParkingTab.qc:
        return BlocBuilder<ParkingLocationBloc, ParkingLocationState>(
          builder: (context, state) {
            return ScrollList<ParkingVehicleEntity>(
              controller: _qcController,
              footer: SizedBox(height: context.bottomPadding + AppSpacing.xxl),
              isLoading: state.qcStatus == ParkingLocationStatus.loading,
              items: state.qcVehicles,
              noRecordFoundWidget: const SizedBox.shrink(),
              onRefresh: () async {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoadQcVehicles(),
                );
              },
              onLoadingMore: () {
                context.read<ParkingLocationBloc>().add(
                  const ParkingLocationLoadMoreQcVehicles(),
                );
              },
              itemBuilder: (context, index, item) {
                return ParkingListItem(
                  vin: item.vin,
                  model: item.model,
                  station: item.color,
                  entryTime: item.warehouseImportedAt ?? '-',
                );
              },
            );
          },
        );
    }
  }
}
