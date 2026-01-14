import 'package:upgrader/upgrader.dart';

class UpgraderLocalizationMessage extends UpgraderMessages {
  @override
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return 'A new version of {{appName}} is available!';
      case UpgraderMessage.buttonTitleIgnore:
        return 'Ignore';
      case UpgraderMessage.buttonTitleLater:
        return 'Later';
      case UpgraderMessage.buttonTitleUpdate:
        return 'Update Now';
      case UpgraderMessage.prompt:
        return '';
      case UpgraderMessage.releaseNotes:
        return 'Release Notes';
      case UpgraderMessage.title:
        return 'Update App?';
    }
  }
}
