bool haveUpdate(int versionCode, int latestVersion) {
  if (versionCode < latestVersion) {
    return true;
  } else {
    return false;
  }
}

bool mustUpdate(var latestUpdateTime, String updateTime) {
  if (latestUpdateTime.isNotEmpty) {
    if (DateTime.tryParse(latestUpdateTime)!
            .difference(DateTime.tryParse(updateTime)!)
            .inHours >
        24 * 365 / 3) {
      return true;
    } else {
      return false;
    }
  } else if (DateTime.now().difference(DateTime.tryParse(updateTime)!).inHours >
      24 * 365 / 3) {
    return true;
  } else {
    return false;
  }
}
