## 2.3.10
* Updated to TDLib 1.8.36 (87d881071)

## 2.3.9
* Updated to TDLib 1.8.35 (9b6ff5863)

## 2.3.8
* Fixed JSON parsing of these objects:
    * [EmojiStatuses]
    * [UpdateInstalledStickerSets]
    * [UpdateSavedNotificationSounds]
    * [UpdateAvailableMessageEffects]

## 2.3.7
* Updated to TDLib 1.8.31 (63c7d0301)

## 2.3.6
* Updated to TDLib 1.8.26 (bc9d35d99)

## 2.3.5
* Updated to TDLib 1.8.27 (d7203eb71)

## 2.3.4
* Updated README a bit

## 2.3.3
* Updated to TDLib 1.8.26
* Updated to Android Gradle Plugin 8.2
* Added android.permission.INTERNET in manifest

## 2.3.2
* Added formatting to generator
* Improved documentation

## 2.3.1
* Statically relinked TDLib

## 2.3.0
* *API changes*: changed TdObject and TdFunction type arguments' names
    * objectType -> defaultObjectId
    * instanceType -> currentObjectId
* Updated to TDLib 1.8.25
* Refactored TdPlugin (removed TdNativePlugin)

## 2.2.0
* Updated to TDLib 1.8.20

## 2.1.0
* *API changes*: TdObject has lost type argument
* *API changes*: tdlib.dart -> client.dart
* *API changes*: td_api.dart -> api.dart
* *API changes*: created lib/handy_tdlib.dart to match plugin best practices
* Switched plugin type to ffiPlugin
* Added more documentation for generated methods
* Better copyWith documentation
* Updated Android Gradle Plugin to 7.3.1
* Rebranded package to org.naji.td.handy_tdlib for better separation between this fork and original plugin
* TdObject and TdFunction documentation reworked

## 2.0.3
* Fixed Gradle errors

## 2.0.2
* Introduce convertJsonToObject and convertMapToObject
* Removed td_json_client.dart

## 2.0.1
* Correct README a bit
* Fix exports in tdlib.dart

## 2.0.0
* New Dart 3 features support: final and sealed classes
* Reworked plugin architecture to more developer-friendly one
* More things are documented now
* Dropped all platforms but android
* Removed EventSubject class (why did it even exist?)
* Removed td_client library - it's redundant

## 1.5.9
* Support null safety
* Add Support for IOS, macOs, Windows and Web.
* Update tdlib api to **v1.8.0**
* Change [MethodChannel](https://api.flutter.dev/flutter/services/MethodChannel-class.html) to [ffi](https://docs.flutter.dev/development/platform-integration/c-interop)
* Add `TdPlugin` class, TDLib Library wrapper.
* Change TdClient to functions.
* Now all `TdObject`s are constant.
* Add `copyWith` method to `TdObject`s.
* Remove `extra` from `TdFunction`, and add `extra` parameter to `toJson` method.

## 1.5.0
* Update tdlib api to **v1.7.0**

## 1.4.2
* Stop stream on `destroyClient`.

## 1.4.0
* Update tdlib api to **v1.6.10**

## 1.3.0
* Update tdlib api to **v1.6.8**

## 1.2.2
* Fix call `toJson` for _Null_ parameters (#14)
* Convert mistakenly returned int64 as a string to int (#15, #18)
* Reformat documents style

## 1.2.1
* Update tdlib api to **v1.6.7**
* new `clientEvents` method for `TdClient`, Stream events from the incoming updates and request responses from the TDLib client.

## 1.1.1
* Now getConstructor is not static

## 1.1.0
* Fix typo in generator
* Final step for example issue

## 1.0.4
* Update tdlib api to **v1.6.6**
* Remove `setLogVerbosityLevel` method.
* Add [Generator Script](/generator) that generates **tdapi**

## 1.0.2
* Update tdlib api to **v1.5.1**
* TdClient static methods
* Rollback _client identifier_ for `clientExecute` method

## 1.0.1
* Ignore `NULL` result in TDLib send method (prefer handling by user)
* Rename file names : tdapi.dart => td_api.dart, client.dart => td_client.dart 
* Rename class names : TLObject => TdObject, TLFunction => TdFunction, Client => TdClient
## 1.0.0
* Fix bug in `convertToObject` function
* Pass NULL pointer to `td_json_client_execute` instead of a previously created JSON client.(no required _client identifier_ for `clientExecute` method)

## 0.0.2
* add more description and fix cmake bug
## 0.0.1

* Initial release.
