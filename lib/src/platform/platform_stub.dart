import 'package:flutter/foundation.dart';

import 'platform_type.dart';

/// Returns the current platform for non-IO targets.
PlatformType getPlatform() => kIsWeb ? PlatformType.web : PlatformType.unknown;

/// Whether the current platform is mobile.
bool isMobile() => false;

/// Whether the current runtime is Web.
bool isWeb() => kIsWeb;

/// Whether the current platform is desktop.
bool isDesktop() => false;

/// Whether the current platform is Android.
bool isAndroid() => false;

/// Whether the current platform is iOS.
bool isIOS() => false;

/// Whether the current platform is Windows.
bool isWindows() => false;

/// Whether the current platform is macOS.
bool isMacOS() => false;

/// Whether the current platform is Linux.
bool isLinux() => false;

/// Whether the current platform is OpenHarmony / HarmonyOS.
bool isOHOS() => false;
