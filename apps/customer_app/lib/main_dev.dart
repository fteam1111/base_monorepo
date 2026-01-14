import 'package:core/core.dart';
import 'package:customer_app/app.dart';
import 'package:customer_app/config/firebase_options_development.dart'
    as firebase_dev;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.dev');
  await initialSetup(
    DevConfig(),
    firebase_dev.DefaultFirebaseOptions.currentPlatform,
  );
}

class DevConfig extends BaseConfig {
  DevConfig()
    : super(
        flavor: AppFlavor.dev,
        httpConnectTimeout: 15000,
        httpSendTimeout: 15000,
        httpReceiveTimeout: 15000,
      );
}
