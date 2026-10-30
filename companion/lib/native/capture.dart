// Fast screen frames: GDI scales the screen straight into a small bitmap
// (StretchBlt, halftone), draws the mouse pointer, and GDI+ encodes JPEG
// natively. Runs in its own isolate (see [CaptureWorker]).

import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

final _user32 = DynamicLibrary.open('user32.dll');
final _gdi32 = DynamicLibrary.open('gdi32.dll');
final _gdiplus = DynamicLibrary.open('gdiplus.dll');
final _ole32 = DynamicLibrary.open('ole32.dll');
final _kernel32 = DynamicLibrary.open('kernel32.dll');

final _getDC = _user32.lookupFunction<IntPtr Function(IntPtr), int Function(int)>('GetDC');
final _releaseDC = _user32.lookupFunction<Int32 Function(IntPtr, IntPtr), int Function(int, int)>('ReleaseDC');
final _getCursorInfo = _user32.lookupFunction<Int32 Function(Pointer<Uint8>), int Function(Pointer<Uint8>)>('GetCursorInfo');
final _getIconInfo = _user32.lookupFunction<Int32 Function(IntPtr, Pointer<Uint8>), int Function(int, Pointer<Uint8>)>('GetIconInfo');
final _drawIconEx = _user32.lookupFunction<Int32 Function(IntPtr, Int32, Int32, IntPtr, Int32, Int32, Uint32, IntPtr, Uint32), int Function(int, int, int, int, int, int, int, int, int)>('DrawIconEx');
final _getSystemMetrics = _user32.lookupFunction<Int32 Function(Int32), int Function(int)>('GetSystemMetrics');
final _enumDisplayMonitors = _user32.lookupFunction<Int32 Function(IntPtr, Pointer<Void>, Pointer<NativeFunction<_MonitorProc>>, IntPtr), int Function(int, Pointer<Void>, Pointer<NativeFunction<_MonitorProc>>, int)>('EnumDisplayMonitors');
final _getMonitorInfo = _user32.lookupFunction<Int32 Function(IntPtr, Pointer<Uint8>), int Function(int, Pointer<Uint8>)>('GetMonitorInfoW');

final _createCompatibleDC = _gdi32.lookupFunction<IntPtr Function(IntPtr), int Function(int)>('CreateCompatibleDC');
final _createCompatibleBitmap = _gdi32.lookupFunction<IntPtr Function(IntPtr, Int32, Int32), int Function(int, int, int)>('CreateCompatibleBitmap');
final _selectObject = _gdi32.lookupFunction<IntPtr Function(IntPtr, IntPtr), int Function(int, int)>('SelectObject');
final _bitBlt = _gdi32.lookupFunction<Int32 Function(IntPtr, Int32, Int32, Int32, Int32, IntPtr, Int32, Int32, Uint32), int Function(int, int, int, int, int, int, int, int, int)>('BitBlt');
final _stretchBlt = _gdi32.lookupFunction<Int32 Function(IntPtr, Int32, Int32, Int32, Int32, IntPtr, Int32, Int32, Int32, Int32, Uint32), int Function(int, int, int, int, int, int, int, int, int, int, int)>('StretchBlt');
final _setStretchBltMode = _gdi32.lookupFunction<Int32 Function(IntPtr, Int32), int Function(int, int)>('SetStretchBltMode');
final _setBrushOrgEx = _gdi32.lookupFunction<Int32 Function(IntPtr, Int32, Int32, Pointer<Void>), int Function(int, int, int, Pointer<Void>)>('SetBrushOrgEx');
final _deleteObject = _gdi32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('DeleteObject');
final _deleteDC = _gdi32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('DeleteDC');

final _gdiplusStartup = _gdiplus.lookupFunction<Int32 Function(Pointer<IntPtr>, Pointer<Uint8>, Pointer<Void>), int Function(Pointer<IntPtr>, Pointer<Uint8>, Pointer<Void>)>('GdiplusStartup');
final _gdipCreateBitmapFromHBITMAP = _gdiplus.lookupFunction<Int32 Function(IntPtr, IntPtr, Pointer<IntPtr>), int Function(int, int, Pointer<IntPtr>)>('GdipCreateBitmapFromHBITMAP');
final _gdipSaveImageToStream = _gdiplus.lookupFunction<Int32 Function(IntPtr, IntPtr, Pointer<Uint8>, Pointer<Uint8>), int Function(int, int, Pointer<Uint8>, Pointer<Uint8>)>('GdipSaveImageToStream');
final _gdipDisposeImage = _gdiplus.lookupFunction<Int32 Function(IntPtr), int Function(int)>('GdipDisposeImage');

final _createStreamOnHGlobal = _ole32.lookupFunction<Int32 Function(IntPtr, Int32, Pointer<IntPtr>), int Function(int, int, Pointer<IntPtr>)>('CreateStreamOnHGlobal');
final _getHGlobalFromStream = _ole32.lookupFunction<Int32 Function(IntPtr, Pointer<IntPtr>), int Function(int, Pointer<IntPtr>)>('GetHGlobalFromStream');
final _globalLock = _kernel32.lookupFunction<Pointer<Uint8> Function(IntPtr), Pointer<Uint8> Function(int)>('GlobalLock');
final _globalUnlock = _kernel32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('GlobalUnlock');

typedef _MonitorProc = Int32 Function(IntPtr, IntPtr, Pointer<Int32>, IntPtr);
typedef _SeekNative = Int32 Function(IntPtr, Int64, Uint32, Pointer<Uint64>);
typedef _SeekDart = int Function(int, int, int, Pointer<Uint64>);
typedef _ReleaseNative = Uint32 Function(IntPtr);
typedef _ReleaseDart = int Function(int);

/// A screen rectangle in physical pixels.
typedef ScreenRect = ({int x, int y, int width, int height});

/// One monitor.
typedef Monitor = ({int x, int y, int width, int height, bool primary});

/// A captured, encoded frame and where it came from.
typedef Frame = ({Uint8List jpeg, int width, int height, ScreenRect source});

final _monitors = <Monitor>[];

int _onMonitor(int hMonitor, int hdc, Pointer<Int32> rect, int data) {
  final info = calloc<Uint8>(40);
  try {
    info.cast<Uint32>()[0] = 40;
    var primary = false;
    if (_getMonitorInfo(hMonitor, info) != 0) primary = (info.cast<Uint32>()[9] & 1) == 1;
    _monitors.add((x: rect[0], y: rect[1], width: rect[2] - rect[0], height: rect[3] - rect[1], primary: primary));
  } finally {
    calloc.free(info);
  }
  return 1;
}

/// Every monitor, the primary one first.
List<Monitor> listMonitors() {
  _monitors.clear();
  _enumDisplayMonitors(0, nullptr, Pointer.fromFunction<_MonitorProc>(_onMonitor, 0), 0);
  final out = [..._monitors]..sort((a, b) => a.primary == b.primary ? (a.y != b.y ? a.y - b.y : a.x - b.x) : (a.primary ? -1 : 1));
  return out;
}

var _gdiplusReady = false;

void _startGdiplus() {
  if (_gdiplusReady) return;
  final token = calloc<IntPtr>();
  final input = calloc<Uint8>(24);
  try {
    input.cast<Uint32>()[0] = 1; // GdiplusVersion
    final r = _gdiplusStartup(token, input, nullptr);
    if (r != 0) throw StateError('GDI+ did not start ($r).');
    _gdiplusReady = true;
  } finally {
    calloc.free(input);
    calloc.free(token);
  }
}

void _guid(Pointer<Uint8> at, int d1, int d2, int d3, List<int> d4) {
  final b = ByteData.sublistView(at.asTypedList(16));
  b.setUint32(0, d1, Endian.little);
  b.setUint16(4, d2, Endian.little);
  b.setUint16(6, d3, Endian.little);
  for (var i = 0; i < 8; i++) {
    b.setUint8(8 + i, d4[i]);
  }
}

/// Captures [source] scaled to [outWidth]×[outHeight] (halftone scaling when
/// smaller), with the mouse pointer when [cursor], as a JPEG at [quality].
Frame captureJpeg(ScreenRect source, {required int outWidth, required int outHeight, int quality = 60, bool cursor = true}) {
  _startGdiplus();
  final screen = _getDC(0);
  final mem = _createCompatibleDC(screen);
  final bitmap = _createCompatibleBitmap(screen, outWidth, outHeight);
  final old = _selectObject(mem, bitmap);
  final gp = calloc<IntPtr>();
  final stream = calloc<IntPtr>();
  final hglobal = calloc<IntPtr>();
  final pos = calloc<Uint64>();
  final clsid = calloc<Uint8>(16);
  final params = calloc<Uint8>(40);
  final q = calloc<Uint32>();
  var image = 0;
  var istream = 0;
  try {
    const rop = 0x00CC0020 | 0x40000000; // SRCCOPY | CAPTUREBLT
    final same = outWidth == source.width && outHeight == source.height;
    final ok = same
        ? _bitBlt(mem, 0, 0, outWidth, outHeight, screen, source.x, source.y, rop)
        : (() {
            _setStretchBltMode(mem, 4); // HALFTONE
            _setBrushOrgEx(mem, 0, 0, nullptr);
            return _stretchBlt(mem, 0, 0, outWidth, outHeight, screen, source.x, source.y, source.width, source.height, rop);
          })();
    if (ok == 0) throw StateError('Could not capture the screen (is the PC locked?).');
    if (cursor) _drawCursor(mem, source, outWidth / source.width);
    _selectObject(mem, old);

    if (_gdipCreateBitmapFromHBITMAP(bitmap, 0, gp) != 0) throw StateError('GDI+ could not read the frame.');
    image = gp.value;
    if (_createStreamOnHGlobal(0, 1, stream) != 0) throw StateError('No memory for the frame.');
    istream = stream.value;

    // JPEG encoder {557CF401-1A04-11D3-9A73-0000F81EF32E}.
    _guid(clsid, 0x557CF401, 0x1A04, 0x11D3, [0x9A, 0x73, 0x00, 0x00, 0xF8, 0x1E, 0xF3, 0x2E]);
    // EncoderParameters { Count = 1; { EncoderQuality, 1 value, Long, &q } }.
    q.value = quality.clamp(10, 95);
    params.cast<Uint32>()[0] = 1;
    _guid(params + 8, 0x1D5BE4B5, 0xFA4A, 0x452D, [0x9C, 0xDD, 0x5D, 0xB3, 0x51, 0x05, 0xE7, 0xEB]);
    (params + 24).cast<Uint32>()[0] = 1; // NumberOfValues
    (params + 28).cast<Uint32>()[0] = 4; // EncoderParameterValueTypeLong
    (params + 32).cast<IntPtr>()[0] = q.address;
    final saved = _gdipSaveImageToStream(image, istream, clsid, params);
    if (saved != 0) throw StateError('Could not encode the frame ($saved).');

    // The stream's size is where it stopped writing: IStream::Seek(0, CUR).
    final vtable = Pointer<Pointer<IntPtr>>.fromAddress(istream).value;
    final seek = Pointer<NativeFunction<_SeekNative>>.fromAddress(vtable[5]).asFunction<_SeekDart>();
    seek(istream, 0, 1, pos);
    final size = pos.value;
    if (_getHGlobalFromStream(istream, hglobal) != 0) throw StateError('Could not read the frame.');
    final data = _globalLock(hglobal.value);
    final jpeg = Uint8List.fromList(data.asTypedList(size));
    _globalUnlock(hglobal.value);
    return (jpeg: jpeg, width: outWidth, height: outHeight, source: source);
  } finally {
    if (image != 0) _gdipDisposeImage(image);
    if (istream != 0) {
      final vtable = Pointer<Pointer<IntPtr>>.fromAddress(istream).value;
      Pointer<NativeFunction<_ReleaseNative>>.fromAddress(vtable[2]).asFunction<_ReleaseDart>()(istream);
    }
    for (final p in [gp, stream, hglobal]) {
      calloc.free(p);
    }
    calloc.free(pos);
    calloc.free(clsid);
    calloc.free(params);
    calloc.free(q);
    _selectObject(mem, old);
    _deleteObject(bitmap);
    _deleteDC(mem);
    _releaseDC(0, screen);
  }
}

void _drawCursor(int dc, ScreenRect source, double scale) {
  // CURSORINFO: cbSize, flags, hCursor (8), ptScreenPos (x, y).
  final info = calloc<Uint8>(24);
  final icon = calloc<Uint8>(32);
  try {
    info.cast<Uint32>()[0] = 24;
    if (_getCursorInfo(info) == 0) return;
    if ((info.cast<Uint32>()[1] & 1) == 0) return; // hidden
    final handle = (info + 8).cast<IntPtr>().value;
    final px = (info + 16).cast<Int32>()[0], py = (info + 16).cast<Int32>()[1];
    if (px < source.x || py < source.y || px >= source.x + source.width || py >= source.y + source.height) return;
    var hotX = 0, hotY = 0;
    if (_getIconInfo(handle, icon) != 0) {
      hotX = icon.cast<Uint32>()[1];
      hotY = icon.cast<Uint32>()[2];
      final mask = (icon + 16).cast<IntPtr>().value, color = (icon + 24).cast<IntPtr>().value;
      if (mask != 0) _deleteObject(mask);
      if (color != 0) _deleteObject(color);
    }
    final size = (_getSystemMetrics(13) * scale).round().clamp(12, 64); // SM_CXCURSOR
    final s = size / _getSystemMetrics(13);
    _drawIconEx(dc, ((px - source.x) * scale - hotX * s).round(), ((py - source.y) * scale - hotY * s).round(), handle, size, size, 0, 0, 3);
  } finally {
    calloc.free(info);
    calloc.free(icon);
  }
}

/// [source] fitted inside [maxWidth] (never enlarged), even sizes.
({int width, int height}) fit(ScreenRect source, int maxWidth) {
  if (source.width <= maxWidth) return (width: source.width, height: source.height);
  final h = (source.height * maxWidth / source.width).round();
  return (width: maxWidth, height: h < 1 ? 1 : h);
}

/// Captures in a background isolate so the window and server stay smooth.
class CaptureWorker {
  CaptureWorker._(this._isolate, this._send, this._replies);

  final Isolate _isolate;
  final SendPort _send;
  final ReceivePort _replies;
  final _pending = <int, Completer<Object?>>{};
  var _next = 0;

  static Future<CaptureWorker> start() async {
    final replies = ReceivePort();
    final ready = Completer<SendPort>();
    late final CaptureWorker worker;
    replies.listen((m) {
      if (m is SendPort) {
        ready.complete(m);
      } else if (m is List && m.length == 2) {
        final c = worker._pending.remove(m[0] as int);
        if (c == null) return;
        final r = m[1];
        if (r is String) {
          c.completeError(StateError(r));
        } else {
          c.complete(r);
        }
      }
    });
    final isolate = await Isolate.spawn(_main, replies.sendPort, debugName: 'capture');
    worker = CaptureWorker._(isolate, await ready.future, replies);
    return worker;
  }

  Future<Frame> capture(ScreenRect source, {required int maxWidth, int quality = 60, bool cursor = true}) async {
    final id = ++_next;
    final c = Completer<Object?>();
    _pending[id] = c;
    _send.send([id, 'frame', source.x, source.y, source.width, source.height, maxWidth, quality, cursor]);
    final r = await c.future as List;
    return (
      jpeg: (r[0] as TransferableTypedData).materialize().asUint8List(),
      width: r[1] as int,
      height: r[2] as int,
      source: source,
    );
  }

  Future<List<Monitor>> monitors() async {
    final id = ++_next;
    final c = Completer<Object?>();
    _pending[id] = c;
    _send.send([id, 'monitors']);
    final r = await c.future as List;
    return [
      for (final m in r) (x: m[0] as int, y: m[1] as int, width: m[2] as int, height: m[3] as int, primary: m[4] as bool),
    ];
  }

  void dispose() {
    _replies.close();
    _isolate.kill(priority: Isolate.immediate);
  }

  static void _main(SendPort reply) {
    final port = ReceivePort();
    reply.send(port.sendPort);
    port.listen((m) {
      final list = m as List;
      final id = list[0] as int;
      try {
        if (list[1] == 'monitors') {
          reply.send([id, [for (final x in listMonitors()) [x.x, x.y, x.width, x.height, x.primary]]]);
          return;
        }
        final source = (x: list[2] as int, y: list[3] as int, width: list[4] as int, height: list[5] as int);
        final size = fit(source, list[6] as int);
        final f = captureJpeg(source, outWidth: size.width, outHeight: size.height, quality: list[7] as int, cursor: list[8] as bool);
        reply.send([id, [TransferableTypedData.fromList([f.jpeg]), f.width, f.height]]);
      } catch (e) {
        reply.send([id, '$e']);
      }
    });
  }
}
