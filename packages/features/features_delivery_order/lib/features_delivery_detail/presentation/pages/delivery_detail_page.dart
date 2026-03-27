import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_detail_header_card.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_filter_section.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Page displaying delivery order detail and its vehicles.
class DeliveryDetailPage extends StatefulWidget {
  const DeliveryDetailPage({super.key});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  final double _spacingBottomList = 20;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryDetailBloc, DeliveryDetailState>(
      listener: (context, state) {
        if (state.addVehicleStatus == AddVehicleStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Vehicle added successfully')),
          );
        } else if (state.addVehicleStatus == AddVehicleStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.addVehicleFailure?.nonTranslatedFailureMessage ??
                    'Failed to add vehicle',
              ),
              backgroundColor: context.colorScheme.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final doEntity = state.deliveryOrder;
        final vehicles = state.vehicles;
        final status = doEntity != null
            ? DeliveryOrderStatus.fromString(doEntity.status)
            : DeliveryOrderStatus.pending;
        final doCode = doEntity?.doCode ?? '';

        return Scaffold(
          appBar: CustomAppBar(
            titleWidget: Text(
              context.l10n.deliveryOrderDetailTitle(doCode),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.paddingMD),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.paddingSM,
                      vertical: AppSpacing.paddingXXXS,
                    ),
                    decoration: BoxDecoration(
                      color: status.backgroundLabel(context),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(
                      status.label(context),
                      style: context.appTypography.labelSmall.copyWith(
                        color: status.labelColor(context),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: _buildBody(context, state, vehicles),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    DeliveryDetailState state,
    List vehicles,
  ) {
    if (state.status == DeliveryDetailStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == DeliveryDetailStatus.failure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.failure?.nonTranslatedFailureMessage ?? context.l10n.error,
            ),
            const Gap(AppSpacing.paddingSM),
            ElevatedButton(
              onPressed: () {
                final d0 = state.deliveryOrder;
                if (d0 != null) {
                  context.read<DeliveryDetailBloc>().add(
                    DeliveryDetailStarted(deliveryOrder: d0),
                  );
                }
              },
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      );
    }

    final doEntity = state.deliveryOrder;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                if (doEntity != null)
                  DeliveryDetailHeaderCard(
                    customerName: doEntity.storeName,
                    modelName: doEntity.items.isNotEmpty
                        ? doEntity.items.first.vehicleModel
                        : null,
                    colorCode: doEntity.items.isNotEmpty
                        ? doEntity.items.first.color
                        : null,
                    colorName: doEntity.items.isNotEmpty
                        ? doEntity.items.first.color
                        : null,
                    currentProgress: doEntity.fulfilledQuantity,
                    totalQuantity: doEntity.totalQuantity,
                  ),
                Gap(context.appSpacing.cardPadding),
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
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.medium,
            AppSpacing.none,
            AppSpacing.medium,
            _spacingBottomList,
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
                colorValue: Colors.blue,
              );
            },
          ),
        ),
      ],
    );
  }
}
