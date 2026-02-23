import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/widgets/delivery_order_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryListPage extends StatefulWidget {
  const DeliveryListPage({super.key});

  @override
  State<DeliveryListPage> createState() => _DeliveryListPageState();
}

class _DeliveryListPageState extends State<DeliveryListPage> {
  int _selectedTabIndex = 0;

  List<Map<String, dynamic>> _tabs(BuildContext context) {
    return [
      {'label': context.l10n.allWithCount(4), 'status': null},
      {
        'label': context.l10n.preparingWithCount(2),
        'status': DeliveryOrderStatus.preparing,
      },
      {
        'label': context.l10n.readyWithCount(1),
        'status': DeliveryOrderStatus.ready,
      },
    ];
  }

  final List<Map<String, dynamic>> _mockData = [
    {
      'doCode': 'DO-2024-001',
      'status': DeliveryOrderStatus.preparing,
      'modelName': 'Klara S2',
      'colorCode': 'B02',
      'colorName': 'Blue',
      'quantity': 50,
      'deadline': '26/05/2024 08:00',
      'progress': 0.1,
    },
    {
      'doCode': 'DO-2024-002',
      'status': DeliveryOrderStatus.preparing,
      'modelName': 'Vento S',
      'colorCode': 'G03',
      'colorName': 'Grey',
      'quantity': 12,
      'deadline': '24/05/2024 17:00',
      'progress': 0.45,
    },
    {
      'doCode': 'DO-2024-003',
      'status': DeliveryOrderStatus.ready,
      'modelName': 'Feliz S',
      'colorCode': 'R01',
      'colorName': 'Red',
      'quantity': 25,
      'deadline': '23/05/2024 10:00',
      'progress': 1.0,
    },
    {
      'doCode': 'DO-2024-004',
      'status': DeliveryOrderStatus.preparing,
      'modelName': 'Evo 200',
      'colorCode': 'W01',
      'colorName': 'White',
      'quantity': 30,
      'deadline': '27/05/2024 09:00',
      'progress': 0.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final tabs = _tabs(context);

    final filteredData = _selectedTabIndex == 0
        ? _mockData
        : _mockData
              .where(
                (item) => item['status'] == tabs[_selectedTabIndex]['status'],
              )
              .toList();

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
          Container(
            color: context.theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingXS),
            child: AppSegmentedTabBar(
              selectedValue: _selectedTabIndex,
              onChanged: (value) =>
                  setState(() => _selectedTabIndex = value as int),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.paddingSM,
              ),
              items: List.generate(tabs.length, (index) {
                return AppSegmentedTabItem(
                  label: tabs[index]['label'],
                  value: index,
                );
              }),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.paddingSM),
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final item = filteredData[index];
                return DeliveryOrderCard(
                  doCode: item['doCode'],
                  status: item['status'],
                  modelName: item['modelName'],
                  colorCode: item['colorCode'],
                  colorName: item['colorName'],
                  quantity: item['quantity'],
                  deadline: item['deadline'],
                  progress: item['progress'],
                  onTap: () {
                    AppRoutes.navigateToDeliveryOrderDetail(context);
                  },
                );
              },
              separatorBuilder: (_, __) {
                return const Gap(AppSpacing.paddingSM);
              },
            ),
          ),
        ],
      ),
    );
  }
}
