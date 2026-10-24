# Handy TDLib

**This plugin is an updated fork of [i-Naji's TDLib plugin](https://github.com/i-Naji/tdlib) with Dart 3 features and new TDLib version**

## About plugin

This is a Flutter [plugin](https://pub.dev/packages/handy_tdlib) for [TDLib (Telegram Database Library)](https://github.com/tdlib) v1.8.36

This plugin is a complete TDLib's JSON interface binding package to help you create your own Telegram client.

## Installation
[Install](https://pub.dev/packages/handy_tdlib/versions/2.0.0/install) the plugin by running the following command from the project root:
```
flutter pub add handy_tdlib
```

## Initialization
This plugin supports **only** Android.

Consider running this plugin **isolated from the main thread**. Do `convertJsonToObject()`
on **separate** thread to avoid any freezes.

### Setting up

1. Set up 2 isolates with the working `SendPort` + `ReceivePort` pair.

2. Get TDLib client ID with `TdPlugin.instance.tdCreateClientId()` on invokes thread.

3. Transfer this ID to updates thread.

4. Set up `await for` on invokes thread for `ReceivePort`.

   Run `TdPlugin.instance.tdSend` on every event from `ReceivePort`. This will send
   all updates to TDLib. Consider running jsonEncode on this thread to improve UI performance.

   On the main thread, you should use `SendPort' with TdFunction to send invokes.

   > Hey, what about `extra` argument in `TdFunction.toJson`?

   You should put here any random number and save it somewhere in your class instance. This is used as a sign to detect what invoke's result have you got from updates thread. Consider using `Timer` to make timeouts for invokes.

5.  On updates thread, set up `while (true) { ... }` with something like this
    ```
    final String? response = TdPlugin.instance.tdReceive(clientId);
    if (response != null) {
      try {
        sendPort.send(convertJsonToObject(response));
      } catch (e) {
        ... some logging of this exception ...
      }
    }
    ```
    On UI thread, you'll get updates and invoke results from ReceivePort of this isolate.

### Questions?

> Hey, but how we'll separate invoke results from updates?

```
  // Only invoke results have 'extra' field.
  final bool isUpdate = object.extra == null;
```

*Library uses sealed classes, so you can use Dart 3's new `switch (...) { ... }` on object type if needed.*

*Consider importing lib/api.dart with prefix (`import '...' as ...`). Some object names are the same with `dart:io` and **Flutter**.*

## Still have questions?

Feel free to PM me in [Telegram](https://t.me/tdrkDev).

Check [HandyGram](https://github.com/HandyGram) on GitHub for some code examples.

## Usage

* [TDLib Data Repository layer in HandyGram](https://github.com/HandyGram/HandyGram/tree/main/lib/src/common/tdlib)
* **Documentation button on this pub page**
* [Official TDLib guide (a bit old)](https://core.telegram.org/tdlib/getting-started)
