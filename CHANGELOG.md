## 1.2.2

* Support importing platform helpers from both Web and native targets.
* Split platform detection into conditional IO and non-IO implementations.
* Add `PlatformType` and `getPlatform()` for typed platform detection.
* Improve `Reboot` error handling and add `Reboot.maybeBegin()`.
* Add null-safe update checking helpers with invalid-date protection.
* Fix `mustUpdate` to compare `updateTime` against `latestUpdateTime` or now.
* Remove the old `haveUpdate` alias.
* Add documentation comments for the public platform and reboot APIs.
* Replace template tests with platform, update, and widget restart coverage.

## 0.2.1

* add isOHOS()

## 0.1.2

* bug fix

## 0.1.1

* begin
