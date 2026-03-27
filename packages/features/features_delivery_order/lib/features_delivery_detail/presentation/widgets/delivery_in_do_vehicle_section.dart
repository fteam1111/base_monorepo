import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryInDoVehicleSection extends StatelessWidget {
  const DeliveryInDoVehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryDetailBloc, DeliveryDetailState>(
      builder: (context, state) {
        final vehicles = state.vehicles;
        final isLoading = state.status == DeliveryDetailStatus.loading;

        if (isLoading && vehicles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vehicles.isEmpty) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
              sliver: SliverToBoxAdapter(
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
                          'DANH SÁCH XE ĐÃ GÁN',
                          style: context.appTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
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
              ),
            ),
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
                  return DeliveryVinItemCard(
                    vinCode: vehicle.serialNumber,
                    modelName: vehicle.model,
                    colorName: vehicle.color,
                    area: '',
                    position: '',
                    fifoNumber: index + 1,
                    warehouseDate: vehicle.warehouseImportedAt ?? '',
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
