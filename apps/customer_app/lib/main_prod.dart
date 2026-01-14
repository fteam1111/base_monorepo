import 'package:core/core.dart';
import 'package:customer_app/app.dart';
import 'package:customer_app/config/firebase_options_development.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.prod');
  await initialSetup(ProdConfig(), DefaultFirebaseOptions.currentPlatform);
}

class ProdConfig extends BaseConfig {
  ProdConfig() : super(flavor: AppFlavor.prod);
}
