import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_filter_section.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliverySuggestedVehicleSection extends StatelessWidget {
  const DeliverySuggestedVehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryDetailBloc, DeliveryDetailState>(
      builder: (context, state) {
        final vehicles = state.suggestedVehicles;
        final isLoading =
            state.suggestedVehiclesStatus == DeliveryDetailStatus.loading;

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
              sliver: SliverToBoxAdapter(
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
                              color: context.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (vehicles.isEmpty)
              const SliverFillRemaining(
                child: Center(child: Text('Không có dữ liệu')),
              )
            else
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.appSpacing.pageHorizontal,
                  0,
                  context.appSpacing.pageHorizontal,
                  context.appSpacing.pageVertical,
                ),
                sliver: SliverList.separated(
                  itemCount: vehicles.length,
                  separatorBuilder: (context, index) =>
                      const Gap(AppSpacing.paddingSM),
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return GestureDetector(
                      onTap: () {
                        // Request to add vehicle to DO
                        context.read<DeliveryDetailBloc>().add(
                          DeliveryDetailAddVehicleRequested(
                            vehicleId: vehicle.id,
                          ),
                        );
                      },
                      child: DeliveryVinItemCard(
                        vinCode: vehicle.serialNumber,
                        modelName: vehicle.model,
                        colorName: vehicle.color,
                        area: vehicle.zone ?? '',
                        position: '',
                        fifoNumber: index + 1,
                        warehouseDate: vehicle.date ?? '',
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
