import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;

  FirebaseAnalyticsService({required this.analytics, required this.observer});
}
