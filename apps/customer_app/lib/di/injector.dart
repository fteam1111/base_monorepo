import 'package:customer_app/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

/// Configure tất cả dependencies cho app
/// Injectable sẽ tự động scan và generate code cho:
/// - Các @injectable, @singleton, @lazySingleton classes
/// - Các @module classes (như LocalStorageModule)
@InjectableInit()
Future<void> configureDependencies() async {
  // Import LocalStorageModule để injectable scan được
  // Injectable sẽ tự động generate code để register các dependencies
  await locator.init();
}
