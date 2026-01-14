import 'package:core/core.dart';
import 'package:customer_app/app.dart';
import 'package:customer_app/config/firebase_options_development.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.uat');
  await initialSetup(UatConfig(), DefaultFirebaseOptions.currentPlatform);
}

class UatConfig extends BaseConfig {
  UatConfig()
    : super(
        flavor: AppFlavor.uat,
        httpConnectTimeout: 15000,
        httpSendTimeout: 15000,
        httpReceiveTimeout: 15000,
      );
}
