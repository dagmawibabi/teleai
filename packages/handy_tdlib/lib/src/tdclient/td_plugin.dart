import 'package:ffi/ffi.dart';
import 'dart:ffi' as ffi;
import 'package:handy_tdlib/src/tdapi/tdapi.dart';
import 'dart:async';

/// TDLib instance.
///
/// In order to use this class, run [TdPlugin.initialize].
class TdPlugin {
  /// Needed to be run in order to use this class.
  static Future initialize([String? libPath]) async {
    instance = TdPlugin(
      ffi.DynamicLibrary.open(libPath ?? 'libtdjson.so'),
    );
  }

  /// Latest initialized TdPlugin instance.
  static late TdPlugin instance;

  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// TDLib methods are looked up in [dynamicLibrary].
  TdPlugin(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// TDLib methods are looked up with [lookup].
  TdPlugin.fromLookup(
    ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) lookup,
  ) : _lookup = lookup;

  late final _TdCreateClientId _tdCreateClientId =
      _lookup<ffi.NativeFunction<_TdCreateClientIdPtr>>('td_create_client_id')
          .asFunction();
  late final _TdSend _tdSend =
      _lookup<ffi.NativeFunction<_TdSendPtr>>('td_send').asFunction();
  late final _TdReceive _tdReceive =
      _lookup<ffi.NativeFunction<_TdReceivePtr>>('td_receive').asFunction();
  late final _TdExecute _tdExecute =
      _lookup<ffi.NativeFunction<_TdExecutePtr>>('td_execute').asFunction();

  /// Creates client ID for [TdPlugin.tdSend] (`clientId` argument),
  /// [TdPlugin.tdReceive] ([TdObject.clientId] after [convertJsonToObject]) and
  /// [TdPlugin.tdExecute] (to specify it, add it as a JSON "clientId" field).
  int tdCreateClientId() => _tdCreateClientId();

  /// Sends a request to TDLib. You can create a request by using [TdFunction].
  /// Use a one of predefined [TdFunction] classes, specify data in it, then
  /// you can use [TdFunction.toJson] with random `extra` number.
  ///
  /// You can get TDLib response from [TdPlugin.tdReceive] function, it comes
  /// as a [TdObject] with the same [TdObject.extra] number as you specified
  /// before. Only responses to [TdFunction] requests have
  /// `extra` defined in [TdObject].
  ///
  /// Pro tip: run [TdPlugin.tdSend] in Isolate in order to not block UI.
  /// [ReceivePort] and [SendPort] **can** transfer [TdObject] and [TdFunction].
  void tdSend(int clientId, String request) {
    final req = request.toNativeUtf8();
    _tdSend(
      clientId,
      req,
    );
    malloc.free(req);
  }

  /// Receives messages from TDLib. In order to use them conveniently from Dart,
  /// use [convertJsonToObject] function.
  ///
  /// Updates come without [TdObject.extra], responses to [TdFunction] requests
  /// come with [TdObject.extra].
  ///
  /// Pro tip: run [TdPlugin.tdReceive] in Isolate in order to not block UI.
  /// [ReceivePort] and [SendPort] **can** transfer [TdObject].
  String? tdReceive([double timeout = 1]) {
    final res = _tdReceive(timeout);
    if (res.address == ffi.nullptr.address) {
      return null;
    }
    return res.toDartString();
  }

  /// Works like [TdPlugin.tdSend], but gives you response immediately.
  /// Only some TDLib functions can work with [TdPlugin.tdExecute], check this
  /// by looking for "can work synchronously"
  /// in [TdFunction] children descriptions.
  ///
  /// Check [TdPlugin.tdSend] and [TdPlugin.tdReceive] for more info on objects
  /// parsing and creating.
  String? tdExecute(String request) {
    final req = request.toNativeUtf8();
    final res = _tdExecute(req);
    malloc.free(req);
    if (res.address == ffi.nullptr.address) {
      return null;
    }
    return res.toDartString();
  }
}

typedef _TdCreateClientIdPtr = ffi.Int32 Function();
typedef _TdCreateClientId = int Function();
typedef _TdSendPtr = ffi.Void Function(
    ffi.Int32 client, ffi.Pointer<Utf8> request);
typedef _TdSend = void Function(int client, ffi.Pointer<Utf8> request);
typedef _TdReceivePtr = ffi.Pointer<Utf8> Function(ffi.Double timeout);
typedef _TdReceive = ffi.Pointer<Utf8> Function(double timeout);
typedef _TdExecutePtr = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8> request);
typedef _TdExecute = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8> request);
