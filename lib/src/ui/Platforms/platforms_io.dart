import 'dart:io';

import 'package:flutter/foundation.dart';

class Platforms {
  static final bool isAndroid = Platform.isAndroid;
  static final bool isIOS = Platform.isIOS;
  static const bool isWeb = kIsWeb;
  static final bool isDesktop =
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  static final bool isMacOS = Platform.isMacOS;
  static final bool isWindows = Platform.isWindows;
  static final bool isLinux = Platform.isLinux;
  static final bool isFuchsia = Platform.isFuchsia;
}
