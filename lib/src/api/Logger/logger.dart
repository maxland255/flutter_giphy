import 'package:flutter/foundation.dart';

class Logger {
  static void log(String message) {
    String timestamp = DateTime.now().toIso8601String();
    if (kDebugMode) {
      print("$timestamp | giphy_api | $message");
    }
  }
}
