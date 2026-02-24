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
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.medium,
                AppSpacing.none,
                AppSpacing.medium,
                _spacingBottomList,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ParkingHistoryItem(
                  vin: item['vin'] as String,
                  status: item['status'] as String,
                  isLeaving: item['isLeaving'] as bool,
                  info: (item['info'] as Map).cast<String, String>(),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(height: AppSpacing.sectionPadding);
              },
            ),
          ),
        ],
      ),
    );
  }
}
