/// Supported runtime platforms.
enum PlatformType {
  /// Android.
  android,

  /// iOS.
  ios,

  /// OpenHarmony / HarmonyOS.
  ohos,

  /// Windows.
  windows,

  /// macOS.
  macos,

  /// Linux.
  linux,

  /// Web.
  web,

  /// Unknown or unsupported platform.
  unknown;

  /// Whether this platform is normally treated as a mobile device.
  bool get isMobile {
    return this == PlatformType.android ||
        this == PlatformType.ios ||
        this == PlatformType.ohos;
  }

  /// Whether this platform is normally treated as a desktop device.
  bool get isDesktop {
    return this == PlatformType.windows ||
        this == PlatformType.macos ||
        this == PlatformType.linux;
  }
}
