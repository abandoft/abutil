# Abandoft常用工具类

## 判断系统平台

```dart
isWeb()

isIOS()
isAndroid()
isMobile()

isWindows()
isMacOS()
isLinux()
isDesktop()

isOHOS()   // OpenHarmony
```

## 重启应用

```dart
Reboot(MyApp)

rebootApp();
```

## 检查更新时间

```dart
haveUpdate(int versionCode, int latestVersion)
mustUpdate(var latestUpdateTime, String updateTime)
```