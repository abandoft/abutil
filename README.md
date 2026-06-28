# Abandoft Util

Common Flutter utilities for platform detection, app subtree restart, and
version update checks.

## Platform

`abutil` can be imported from Web and native targets directly.

```dart
import 'package:abutil/abutil.dart';

if (isDesktop()) {
  // Windows, macOS, or Linux.
}
```

Available helpers:

```dart
getPlatform()

isWeb()

isIOS()
isOHOS()
isAndroid()
isMobile()

isWindows()
isMacOS()
isLinux()
isDesktop()
```

## Reboot

Wrap the app subtree with `Reboot`, then call `Reboot.begin(context)` to rebuild
that subtree with a new key.

```dart
runApp(
  const Reboot(
    child: MyApp(),
  ),
);
```

```dart
Reboot.begin(context);
```

Use `Reboot.maybeBegin(context)` when you prefer a `bool` result instead of an
exception if the context is outside a `Reboot` subtree.

## Update Checks

```dart
hasUpdate(versionCode, latestVersion);

mustUpdate(
  latestUpdateTime,
  updateTime,
  interval: const Duration(days: 122),
);
```

`mustUpdate` compares `updateTime` with `latestUpdateTime` when it is available,
or with the current time otherwise. It accepts `DateTime`, date strings, `null`,
and empty values. Invalid `updateTime` values return `false` instead of
throwing.
