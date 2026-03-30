import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_detail_header_card.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_in_do_vehicle_section.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_suggested_vehicle_section.dart';
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

class _DeliveryDetailPageState extends State<DeliveryDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<DeliveryDetailBloc>().add(
          DeliveryDetailTabChanged(_tabController.index),
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryDetailBloc, DeliveryDetailState>(
      listenWhen: (previous, current) =>
          previous.addVehicleFailure != current.addVehicleFailure &&
          previous.addVehicleStatus != current.addVehicleStatus,
      listener: (context, state) {
        if (state.addVehicleStatus == AddVehicleStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.vehicleAddedSuccess)),
          );
        } else if (state.addVehicleStatus == AddVehicleStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.addVehicleFailure?.nonTranslatedFailureMessage ??
                    context.l10n.vehicleAddFailed,
              ),
              backgroundColor: context.colorScheme.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final doEntity = state.deliveryOrder;
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
          body: _DeliveryDetailBody(
            state: state,
            tabController: _tabController,
          ),
        );
      },
    );
  }
}

/// Main body content for the delivery detail page.
class _DeliveryDetailBody extends StatelessWidget {
  const _DeliveryDetailBody({required this.state, required this.tabController});

  final DeliveryDetailState state;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    if (state.status == DeliveryDetailStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == DeliveryDetailStatus.failure) {
      return _DeliveryDetailErrorView(state: state);
    }

    final doEntity = state.deliveryOrder;

    return Column(
      children: [
        if (doEntity != null) _DeliveryDetailHeaderSection(doEntity: doEntity),
        _DeliveryDetailTabBar(tabController: tabController),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              DeliverySuggestedVehicleSection(),
              DeliveryInDoVehicleSection(),
            ],
          ),
        ),
      ],
    );
  }
}

/// Error view with retry button.
class _DeliveryDetailErrorView extends StatelessWidget {
  const _DeliveryDetailErrorView({required this.state});

  final DeliveryDetailState state;

  @override
  Widget build(BuildContext context) {
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
              final doEntity = state.deliveryOrder;
              if (doEntity != null) {
                context.read<DeliveryDetailBloc>().add(
                  DeliveryDetailStarted(deliveryOrder: doEntity),
                );
              }
            },
            child: Text(context.l10n.retry),
          ),
        ],
      ),
    );
  }
}

/// Header card showing DO summary info.
class _DeliveryDetailHeaderSection extends StatelessWidget {
  const _DeliveryDetailHeaderSection({required this.doEntity});

  final DeliveryOrderEntity doEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
      child: DeliveryDetailHeaderCard(
        customerName: doEntity.storeName,
        modelName: doEntity.items.isNotEmpty
            ? doEntity.items.first.vehicleModel
            : null,
        // colorCode: doEntity.items.isNotEmpty
        //     ? doEntity.items.first.color
        //     : null,
        colorName: doEntity.items.isNotEmpty
            ? doEntity.items.first.color
            : null,
        currentProgress: doEntity.fulfilledQuantity,
        totalQuantity: doEntity.totalQuantity,
      ),
    );
  }
}

/// Pill-shaped tab bar for switching between vehicle lists.
class _DeliveryDetailTabBar extends StatelessWidget {
  const _DeliveryDetailTabBar({required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appSpacing.pageHorizontal,
      ),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        child: TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          labelColor: context.colorScheme.primary,
          unselectedLabelColor: context.colorScheme.onSurfaceVariant,
          labelStyle: context.appTypography.labelLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: context.appTypography.labelLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.dashboard_customize_outlined, size: 20),
                  const Gap(4),
                  Expanded(
                    child: Text(
                      context.l10n.deliveryOrderSuggestedVehiclesTab,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.checklist, size: 20),
                  const Gap(4),
                  Expanded(
                    child: Text(
                      context.l10n.deliveryOrderAssignedVehiclesTab,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
