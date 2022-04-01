import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_platform/universal_platform.dart';

// ignore: avoid_classes_with_only_static_members
class DeviceInfo {
  static bool get isDesktop => UniversalPlatform.isWindows || UniversalPlatform.isMacOS || UniversalPlatform.isLinux;

  static bool get isDesktopOrWeb => isDesktop || kIsWeb == true;

  static bool get isMobile => !isDesktopOrWeb;
}
