import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// TODO: đang sửa ....
class DeliveryDetailPage extends StatelessWidget {
  const DeliveryDetailPage({super.key, this.orderId});

  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng${orderId != null ? ' #$orderId' : ''}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin đơn hàng',
                style: context.appTypography.titleLarge,
              ),
              SizedBox(height: AppSpacing.md),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mã đơn: ${orderId ?? '--'}'),
                      const SizedBox(height: AppSpacing.paddingXS),
                      const Text('Trạng thái: Đang giao'),
                      const SizedBox(height: AppSpacing.paddingXS),
                      const Text('Người nhận: --'),
                      const SizedBox(height: AppSpacing.paddingXS),
                      const Text('Địa chỉ: --'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Quay lại'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
