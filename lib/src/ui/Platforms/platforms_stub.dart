import 'platforms_io.dart' if (dart.library.html) 'platforms_web.dart';

class PlatformsStub {
  bool isWeb() {
    return Platforms.isWeb;
  }

  bool isMobile() {
    return Platforms.isAndroid || Platforms.isIOS;
  }

  bool isDesktop() {
    return Platforms.isDesktop;
  }

  bool isAndroid() {
    return Platforms.isAndroid;
  }

  bool isIOS() {
    return Platforms.isIOS;
  }

  bool isMacOS() {
    return Platforms.isMacOS;
  }

  bool isWindows() {
    return Platforms.isWindows;
  }

  bool isLinux() {
    return Platforms.isLinux;
  }

  bool isFuchsia() {
    return Platforms.isFuchsia;
  }
}
