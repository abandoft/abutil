/// Default interval used by [mustUpdate].
const Duration defaultForceUpdateInterval = Duration(days: 122);

/// Returns whether [latestVersion] is newer than [versionCode].
bool hasUpdate(int versionCode, int latestVersion) {
  return versionCode < latestVersion;
}

/// Returns whether the elapsed time since [updateTime] is greater than
/// [interval].
///
/// If [latestUpdateTime] is provided and valid, it is used as the reference
/// time. Otherwise [now] is used. Invalid or empty [updateTime] values return
/// false.
bool mustUpdate(
  Object? latestUpdateTime,
  Object? updateTime, {
  DateTime? now,
  Duration interval = defaultForceUpdateInterval,
}) {
  final DateTime? updatedAt = _parseDateTime(updateTime);
  if (updatedAt == null) {
    return false;
  }

  final DateTime referenceTime =
      _parseDateTime(latestUpdateTime) ?? now ?? DateTime.now();
  return referenceTime.difference(updatedAt) > interval;
}

DateTime? _parseDateTime(Object? value) {
  if (value == null) {
    return null;
  }
  if (value is DateTime) {
    return value;
  }
  final String text = value.toString().trim();
  if (text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
