import 'package:core/core.dart';
import 'package:customer_app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.prod');
  await initialSetup(ProdConfig());
}

class ProdConfig extends BaseConfig {
  ProdConfig() : super(flavor: AppFlavor.prod);
}
