import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/bloc/delivery_list_bloc.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/bloc/delivery_list_event.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/bloc/delivery_list_state.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/widgets/delivery_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Page displaying a list of Delivery Orders.
class DeliveryListPage extends StatefulWidget {
  const DeliveryListPage({super.key});

  @override
  State<DeliveryListPage> createState() => _DeliveryListPageState();
}

class _DeliveryListPageState extends State<DeliveryListPage> {
  int _selectedTabIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: CustomAppBar(
        centerTitle: false,
        elevation: 0,
        title: context.l10n.deliveryOrderListTitle,
        subtitle: context.l10n.deliveryOrderBatchTitle,
      ),
      body: Column(
        children: [
          _DeliveryStatusTabBar(
            selectedIndex: _selectedTabIndex,
            onChanged: (index, status) {
              setState(() => _selectedTabIndex = index);
              context.read<DeliveryListBloc>().add(
                DeliveryListStatusFilterChanged(status),
              );
            },
          ),
          Expanded(child: _DeliveryOrderListBody(_scrollController)),
        ],
      ),
    );
  }
}

/// Tab bar for filtering delivery orders by status.
class _DeliveryStatusTabBar extends StatelessWidget {
  const _DeliveryStatusTabBar({
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final void Function(int index, DeliveryOrderStatus?) onChanged;

  static const _tabs = [
    (status: null, labelKey: _TabLabel.all),
    (status: DeliveryOrderStatus.preparing, labelKey: _TabLabel.preparing),
    (status: DeliveryOrderStatus.ready, labelKey: _TabLabel.ready),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingXS),
      child: AppSegmentedTabBar(
        selectedValue: selectedIndex,
        onChanged: (value) {
          final index = value as int;
          onChanged(index, _tabs[index].status);
        },
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingSM),
        items: List.generate(_tabs.length, (index) {
          final tab = _tabs[index];
          return AppSegmentedTabItem(
            label: tab.labelKey.resolve(context),
            value: index,
          );
        }),
      ),
    );
  }
}

/// Enum to resolve tab labels from localization.
enum _TabLabel {
  all,
  preparing,
  ready;

  String resolve(BuildContext context) {
    switch (this) {
      case _TabLabel.all:
        return context.l10n.all;
      case _TabLabel.preparing:
        return context.l10n.deliveryOrderStatusPreparing;
      case _TabLabel.ready:
        return context.l10n.deliveryOrderStatusReady;
    }
  }
}

/// List body that renders delivery order items from BLoC.
class _DeliveryOrderListBody extends StatelessWidget {
  const _DeliveryOrderListBody(this._scrollController);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryListBloc, DeliveryListState>(
      builder: (context, state) {
        return ScrollList<DeliveryOrderEntity>(
          isLoading: state.status == DeliveryListStatus.loading,
          items: state.deliveryOrders,
          onRefresh: () async {
            context.read<DeliveryListBloc>().add(
              const DeliveryListRefreshRequested(),
            );
          },
          onLoadingMore: () {
            context.read<DeliveryListBloc>().add(
              const DeliveryListLoadMoreRequested(),
            );
          },
          header: const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.paddingSM),
            child: SizedBox.shrink(),
          ),
          footer: SizedBox(
            height: context.bottomPadding + AppSpacing.paddingXL,
          ),
          itemBuilder: (context, index, item) {
            return _DeliveryOrderItem(item: item);
          },
          separatorBuilder: (context, index) {
            return const Gap(AppSpacing.paddingSM);
          },
          itemShimmerLoading: CustomCard(
            margin: EdgeInsets.symmetric(
              horizontal: context.appSpacing.pageHorizontal,
            ),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Container(),
            ),
          ),
          noRecordFoundWidget: const SizedBox.shrink(),
          controller: _scrollController,
        );
      },
    );
  }
}

/// Single delivery order item in the list.
class _DeliveryOrderItem extends StatelessWidget {
  const _DeliveryOrderItem({required this.item});

  final DeliveryOrderEntity item;

  @override
  Widget build(BuildContext context) {
    final firstItem = item.items.isNotEmpty ? item.items.first : null;

    final formattedDeadline = displayDateTimeString(
      item.updatedAt,
      DateTimeFormatString.displayDeadlineDateTimeFormat,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingSM),
      child: DeliveryOrderCard(
        doCode: item.doCode,
        status: DeliveryOrderStatus.fromString(item.status),
        modelName: firstItem?.vehicleModel ?? '',
        colorName: firstItem?.color,
        quantity: item.totalQuantity,
        deadline: formattedDeadline,
        progress: item.progress,
        onTap: () async {
          await AppRoutes.navigateToDeliveryOrderDetail(
            context,
            deliveryOrder: item,
          );
          if (context.mounted) {
            context.read<DeliveryListBloc>().add(
              const DeliveryListRefreshRequested(),
            );
          }
        },
      ),
    );
  }
}
