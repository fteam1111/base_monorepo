import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:core/core.dart';

class DeepLinkingService {
  final _appLinks = AppLinks();
  bool _initialLinkHandled = false;
  final _deepLinkStreamController = StreamController<AppLink>.broadcast();

  DeepLinkingService();

  Future<StreamSubscription> init() async {
    if (!_initialLinkHandled) {
      final initialUri = await _appLinks.getInitialLink();
      handleDeepLink(initialUri);
      _initialLinkHandled = true;
    }

    return _appLinks.uriLinkStream.listen(handleDeepLink);
  }

  Stream<AppLink> get getStream => _deepLinkStreamController.stream;

  void handleDeepLink(Uri? deepLink) {
    if (deepLink != null) {
      _deepLinkStreamController.add(AppLink(deepLink.toString()));
    }
  }
}
