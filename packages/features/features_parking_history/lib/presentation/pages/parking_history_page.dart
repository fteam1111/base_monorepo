import 'package:design_system/design_system.dart';
import 'package:features_parking_history/presentation/widgets/parking_history_item.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

import 'package:features_parking_history/presentation/widgets/parking_history_item.dart';

class ParkingHistoryPage extends StatefulWidget {
  const ParkingHistoryPage({super.key});

  @override
  State<ParkingHistoryPage> createState() => _ParkingHistoryPageState();
}

class _ParkingHistoryPageState extends State<ParkingHistoryPage> {
  final double _spacingBottomList = 100;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'vin': '1HGBH41JXMN109185',
        'status': 'Đã cập nhật vị trí',
        'isLeaving': false,
        'info': {
          'Xưởng': 'GA',
          'Khu vực': '18E-18F',
          'Vị trí': '4',
          'Thời gian': '15:35:49 - 11/03/2023',
          'Nhân viên': 'Nguyen Van B',
          'Tài khoản': 'ID123456789',
          'Số ngày đã đỗ': '32 ngày',
        },
      },
      {
        'vin': '1HGBH41JXMN109185',
        'status': 'Đã rời xe',
        'isLeaving': true,
        'info': {
          'Xưởng': 'GA',
          'Khu vực': '18E-18F',
          'Vị trí': '4',
          'Thời gian': '15:35:49 - 11/03/2023',
          'Nhân viên': 'Nguyen Van B',
          'Tài khoản': 'ID123456789',
        },
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: CustomAppBar(
        title: context.l10n.parkingHistoryTitle,
        leadingType: CustomAppBarLeadingType.none,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
            child: AppTextField.search(
              hintText: context.l10n.parkingHistoryTitle,
              suffix: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // TODO: handle QR scan action
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.paddingXS),
                  child: Image.asset(
                    AppIcons.icScanQr,
                    package: AppAssets.package,
                    height: AppSpacing.mediumLarge,
                    width: AppSpacing.mediumLarge,
                    color: AppColors.secondaryLight,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ScrollList<Map<String, dynamic>>(
              controller: _scrollController,
              isLoading: false,
              items: items,
              header: const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                child: SizedBox.shrink(),
              ),
              itemBuilder: (context, index, item) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.medium,
                    right: AppSpacing.medium,
                    bottom: index == items.length - 1 ? _spacingBottomList : 0,
                  ),
                  child: ParkingHistoryItem(
                    vin: item['vin'] as String,
                    status: item['status'] as String,
                    isLeaving: item['isLeaving'] as bool,
                    info: (item['info'] as Map).cast<String, String>(),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: AppSpacing.sectionPadding);
              },
              noRecordFoundWidget: const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
