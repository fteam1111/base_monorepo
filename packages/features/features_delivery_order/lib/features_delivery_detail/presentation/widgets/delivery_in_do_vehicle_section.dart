import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryInDoVehicleSection extends StatefulWidget {
  const DeliveryInDoVehicleSection({super.key});

  @override
  State<DeliveryInDoVehicleSection> createState() =>
      _DeliveryInDoVehicleSectionState();
}

class _DeliveryInDoVehicleSectionState
    extends State<DeliveryInDoVehicleSection> {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryDetailBloc, DeliveryDetailState>(
      builder: (context, state) {
        final vehicles = state.vehicles;
        final isLoading = state.status == DeliveryDetailStatus.loading;

        final header = Padding(
          padding: EdgeInsets.fromLTRB(
            context.appSpacing.pageHorizontal,
            context.appSpacing.pageHorizontal,
            context.appSpacing.pageHorizontal,
            AppSpacing.paddingSM,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.list_alt_outlined,
                    color: context.colorScheme.onSurface,
                  ),
                  const Gap(AppSpacing.paddingXXXS),
                  Text(
                    context.l10n.deliveryOrderAssignedVehiclesTab,
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
        );

        return ScrollList<DeliveryOrderVehicleEntity>(
          controller: _scrollController,
          isLoading: isLoading,
          items: vehicles,
          header: header,
          onRefresh: () async {
            context.read<DeliveryDetailBloc>().add(
              const DeliveryDetailRefreshVehiclesRequested(),
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
              child: DeliveryVinItemCard(
                vinCode: vehicle.serialNumber,
                modelName: vehicle.model,
                colorName: vehicle.color,
                area: '',
                position: '',
                fifoNumber: index + 1,
                warehouseDate: vehicle.warehouseImportedAt ?? '',
              ),
            );
          },
        );
      },
    );
  }
}
