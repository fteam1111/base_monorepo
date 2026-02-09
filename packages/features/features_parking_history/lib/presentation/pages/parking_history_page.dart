import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

import '../widgets/parking_history_item.dart';

class ParkingHistoryPage extends StatefulWidget {
  const ParkingHistoryPage({super.key});

  @override
  State<ParkingHistoryPage> createState() => _ParkingHistoryPageState();
}

class _ParkingHistoryPageState extends State<ParkingHistoryPage> {
  final double _spacingButtomList = 100;

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
      appBar: AppBar(title: Text(context.l10n.parkingHistoryTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.paddingXS,
                  horizontal: AppSpacing.paddingMD,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppSpacing.paddingXS),
                  child: Image.asset(
                    height: AppSpacing.medium,
                    width: AppSpacing.medium,
                    AppIcons.icSearch,
                    package: AppAssets.package,
                    color: AppColors.secondaryLight,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(AppSpacing.paddingXS),
                  child: Image.asset(
                    height: AppSpacing.medium,
                    width: AppSpacing.medium,
                    AppIcons.icScanQr,
                    package: AppAssets.package,
                    color: AppColors.secondaryLight,
                  ),
                ),
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.medium,
                AppSpacing.none,
                AppSpacing.medium,
                _spacingButtomList,
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
