import 'dart:io';

import 'platform_type.dart';

/// Returns the current native platform.
PlatformType getPlatform() {
  if (isAndroid()) {
    return PlatformType.android;
  }
  if (isIOS()) {
    return PlatformType.ios;
  }
  if (isOHOS()) {
    return PlatformType.ohos;
  }
  if (isWindows()) {
    return PlatformType.windows;
  }
  if (isMacOS()) {
    return PlatformType.macos;
  }
  if (isLinux()) {
    return PlatformType.linux;
  }
  return PlatformType.unknown;
}

/// Whether the current native platform is mobile.
bool isMobile() => getPlatform().isMobile;

/// Whether the current runtime is Web.
bool isWeb() => false;

/// Whether the current native platform is desktop.
bool isDesktop() => getPlatform().isDesktop;

/// Whether the current native platform is Android.
bool isAndroid() => Platform.isAndroid;

/// Whether the current native platform is iOS.
bool isIOS() => Platform.isIOS;

/// Whether the current native platform is Windows.
bool isWindows() => Platform.isWindows;

/// Whether the current native platform is macOS.
bool isMacOS() => Platform.isMacOS;

/// Whether the current native platform is Linux.
bool isLinux() => Platform.isLinux;

/// Whether the current native platform is OpenHarmony / HarmonyOS.
bool isOHOS() => Platform.operatingSystem == 'ohos';
