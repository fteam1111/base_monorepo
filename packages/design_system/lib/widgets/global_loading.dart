import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Global utility to show/hide loading overlays.
class GlobalLoading {
  GlobalLoading._();

  static bool isShowLoading = false;

  static void showLoadingDialog({String? status}) {
    if (isShowLoading) {
      return;
    }
    unawaited(
      EasyLoading.show(
        status: status ?? 'Đang tải...',
        maskType: EasyLoadingMaskType.black,
      ),
    );

    isShowLoading = true;
  }

  static Future<void> dismiss() async {
    await EasyLoading.dismiss();
    isShowLoading = false;
  }
}
