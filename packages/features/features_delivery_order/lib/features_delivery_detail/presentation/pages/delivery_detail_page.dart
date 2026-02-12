import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_detail_header_card.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_filter_section.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/widgets/delivery_vin_item_card.dart';
import 'package:features_delivery_order/features_delivery_list/presentation/widgets/delivery_order_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryDetailPage extends StatefulWidget {
  const DeliveryDetailPage({super.key});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  final double _spacingBottomList = 20;

  @override
  Widget build(BuildContext context) {
    final vinItems = <Map<String, dynamic>>[
      {
        'vinCode': 'VIN001234567890AA01',
        'modelName': 'Klara S2',
        'colorName': 'Blue',
        'area': 'A1',
        'position': '10',
        'fifoNumber': 1,
        'warehouseDate': '02/01/2026',
        'colorValue': Colors.blue,
      },
      {
        'vinCode': 'VIN001234567890AA02',
        'modelName': 'Klara S2',
        'colorName': 'Blue',
        'area': 'A1',
        'position': '11',
        'fifoNumber': 2,
        'warehouseDate': '02/01/2026',
        'colorValue': Colors.blue,
      },
      {
        'vinCode': 'VIN001234567890AA03',
        'modelName': 'Klara S2',
        'colorName': 'Red',
        'area': 'A1',
        'position': '05',
        'fifoNumber': 3,
        'warehouseDate': '03/01/2026',
        'colorValue': Colors.red,
      },
      {
        'vinCode': 'VIN001234567890AA04',
        'modelName': 'Vento S',
        'colorName': 'Blue',
        'area': 'B1',
        'position': '06',
        'fifoNumber': 4,
        'warehouseDate': '03/01/2026',
        'colorValue': Colors.blue,
      },
      {
        'vinCode': 'VIN009876543210BB01',
        'modelName': 'Vento S',
        'colorName': 'White',
        'area': 'B1',
        'position': '01',
        'fifoNumber': 5,
        'warehouseDate': '04/01/2026',
        'colorValue': Colors.white,
      },
      {
        'vinCode': 'VIN009876543210BB02',
        'modelName': 'Feliz S',
        'colorName': 'Red',
        'area': 'C1',
        'position': '02',
        'fifoNumber': 6,
        'warehouseDate': '04/01/2026',
        'colorValue': Colors.red,
      },
    ];

    final vinWidgets = vinItems.map((item) {
      return DeliveryVinItemCard(
        vinCode: item['vinCode'] as String,
        modelName: item['modelName'] as String,
        colorName: item['colorName'] as String,
        area: item['area'] as String,
        position: item['position'] as String,
        fifoNumber: item['fifoNumber'] as int,
        warehouseDate: item['warehouseDate'] as String,
        colorValue: item['colorValue'] as Color,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
          onPressed: () => AppRoutes.navigateBack(context),
        ),
        title: Text(
          context.l10n.deliveryOrderDetailTitle('DO-2024-001'),
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
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  DeliveryOrderStatus.preparing.label(context),
                  style: context.appTypography.labelSmall.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  const DeliveryDetailHeaderCard(
                    customerName: 'Công ty TNHH ABC',
                    modelName: 'Klara S2',
                    colorCode: 'B02',
                    colorName: 'Blue',
                    currentProgress: 0,
                    totalQuantity: 50,
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
                        context.l10n.resultsCount(vinItems.length),
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
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.medium,
              AppSpacing.none,
              AppSpacing.medium,
              _spacingBottomList,
            ),
            sliver: SliverList.separated(
              itemCount: vinWidgets.length,
              separatorBuilder: (context, index) =>
                  const Gap(AppSpacing.paddingSM),
              itemBuilder: (context, index) => vinWidgets[index],
            ),
          ),
        ],
      ),
    );
  }
}
