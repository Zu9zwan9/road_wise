import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:road_wise/platform_adaptive_app.dart';

void main() {
  // Set up error handling for production
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      // In production, log to analytics service
      // analyticsService.logError(details.exception, details.stack);
    }
  };

  // Enable platform-specific optimizations
  WidgetsFlutterBinding.ensureInitialized();

  // Run the platform-adaptive app
  runApp(const PlatformAdaptiveApp());
}
