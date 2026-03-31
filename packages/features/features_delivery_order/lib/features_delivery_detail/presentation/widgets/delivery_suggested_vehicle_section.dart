import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/client_vehicle_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_filter_section.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/vehicle_scan_confirmation_dialog.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:share/share.dart';

/// Section showing suggested vehicles for pick-up with filter.
class DeliverySuggestedVehicleSection extends StatefulWidget {
  const DeliverySuggestedVehicleSection({super.key});

  @override
  State<DeliverySuggestedVehicleSection> createState() =>
      _DeliverySuggestedVehicleSectionState();
}

class _DeliverySuggestedVehicleSectionState
    extends State<DeliverySuggestedVehicleSection> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onVehicleTap(ClientVehicleEntity vehicle) async {
    final confirmed = await VehicleScanConfirmationDialog.show(
      context,
      vinCode: vehicle.serialNumber,
      zoneName: vehicle.zone ?? '',
    );

    if (confirmed != true || !mounted) return;

    unawaited(
      AppRoutes.navigateToQrScanner(
        context,
        onVehicleFound: (scannedVehicle) {
          context.pop();
          if (!mounted) return;
          _handleScannedVehicle(scannedVehicle, vehicle.serialNumber);
        },
      ),
    );
  }

  void _handleScannedVehicle(
    VehicleEntity scannedVehicle,
    String selectedSerialNumber,
  ) {
    final clientVehicle = ClientVehicleEntity(
      id: scannedVehicle.id.toString(),
      serialNumber: scannedVehicle.serialNumber,
      model: scannedVehicle.model,
      color: scannedVehicle.color,
      materialCode: scannedVehicle.materialCode,
      manufacturingDate: scannedVehicle.manufacturingDate,
      status: scannedVehicle.status.value,
      statusLabel: scannedVehicle.statusLabel,
      warehouseImportedAt: scannedVehicle.warehouseImportedAt,
      exportedAt: scannedVehicle.exportedAt,
      storageDays: scannedVehicle.storageDays,
      qcDefectDescription: scannedVehicle.qcDefectDescription,
      factoryName: scannedVehicle.factory?.name,
      factoryAddress: scannedVehicle.factory?.address,
      parkingLotName: scannedVehicle.parkingLot?.name,
      parkingZoneName: scannedVehicle.parkingLot?.parkingZone.name,
    );

    context.read<DeliveryDetailBloc>().add(
      DeliveryDetailScannedVinReceived(
        scannedVehicle: clientVehicle,
        selectedVehicleSerialNumber: selectedSerialNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryDetailBloc, DeliveryDetailState>(
      builder: (context, state) {
        final vehicles = state.suggestedVehicles;
        final isLoading =
            state.suggestedVehiclesStatus == DeliveryDetailStatus.loading;

        final isReady =
            state.deliveryOrder?.status.toUpperCase() ==
                DeliveryOrderStatus.ready.apiValue ||
            (state.deliveryOrder?.fulfilledQuantity ?? 0) >=
                (state.deliveryOrder?.totalQuantity ?? 1);

        final header = Padding(
          padding: EdgeInsets.fromLTRB(
            context.appSpacing.pageHorizontal,
            context.appSpacing.pageHorizontal,
            context.appSpacing.pageHorizontal,
            AppSpacing.paddingSM,
          ),
          child: Column(
            children: [
              const DeliveryFilterSection(),
              Gap(context.appSpacing.cardPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        color: context.colorScheme.onSurface,
                      ),
                      const Gap(AppSpacing.paddingXXXS),
                      Text(
                        context.l10n.deliveryOrderPickupGuideTitle,
                        style: context.appTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  if (!isLoading)
                    Text(
                      context.l10n.resultsCount(vehicles.length),
                      style: context.appTypography.labelSmall.copyWith(
                        color: context.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.5,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );

        return ScrollList<ClientVehicleEntity>(
          controller: _scrollController,
          isLoading: isLoading,
          items: vehicles,
          header: header,
          onRefresh: () async {
            context.read<DeliveryDetailBloc>().add(
              const DeliveryDetailSuggestedVehiclesRequested(),
            );
          },
          footer: SizedBox(
            height: context.bottomPadding + AppSpacing.paddingXL,
          ),
          noRecordFoundWidget: Padding(
            padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
            child: Center(
              child: Text(
                context.l10n.noData,
                style: context.appTypography.bodyMedium,
              ),
            ),
          ),
          itemShimmerLoading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.appSpacing.pageHorizontal,
            ),
            child: CustomCard(
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Container(),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Gap(AppSpacing.paddingSM),
          itemBuilder: (context, index, vehicle) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.appSpacing.pageHorizontal,
              ),
              child: GestureDetector(
                onTap: isReady ? null : () => _onVehicleTap(vehicle),
                child: DeliveryVinItemCard(
                  vinCode: vehicle.serialNumber,
                  modelName: vehicle.model,
                  colorName: vehicle.color,
                  area: vehicle.parkingZoneName ?? '',
                  position: vehicle.parkingLotName ?? '',
                  fifoNumber: index + 1,
                  warehouseDate: vehicle.date ?? '',
                  isDisabled: isReady,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
