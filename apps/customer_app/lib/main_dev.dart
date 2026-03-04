import 'package:core/core.dart';
import 'package:customer_app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:customer_app/config/firebase_options_development.dart'
    as firebase_development;

Future<void> main() async {
  await dotenv.load(fileName: '.env.dev');
  await initialSetup(
    config: DevConfig(),
    firebaseOptions:
        firebase_development.DefaultFirebaseOptions.currentPlatform,
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
