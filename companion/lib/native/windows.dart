// Direct bindings for the few Windows calls the companion needs: screen
// capture (GDI), mouse and keyboard (SendInput), the clipboard and
// ShellExecute.

import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

final _user32 = DynamicLibrary.open('user32.dll');
final _gdi32 = DynamicLibrary.open('gdi32.dll');
final _kernel32 = DynamicLibrary.open('kernel32.dll');
final _shell32 = DynamicLibrary.open('shell32.dll');

final _getSystemMetrics = _user32.lookupFunction<Int32 Function(Int32), int Function(int)>('GetSystemMetrics');
final _getDC = _user32.lookupFunction<IntPtr Function(IntPtr), int Function(int)>('GetDC');
final _releaseDC = _user32.lookupFunction<Int32 Function(IntPtr, IntPtr), int Function(int, int)>('ReleaseDC');
final _setCursorPos = _user32.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>('SetCursorPos');
final _getCursorPos = _user32.lookupFunction<Int32 Function(Pointer<Int32>), int Function(Pointer<Int32>)>('GetCursorPos');
final _sendInput = _user32.lookupFunction<Uint32 Function(Uint32, Pointer<Uint8>, Int32), int Function(int, Pointer<Uint8>, int)>('SendInput');
final _getForegroundWindow = _user32.lookupFunction<IntPtr Function(), int Function()>('GetForegroundWindow');
final _getWindowText = _user32.lookupFunction<Int32 Function(IntPtr, Pointer<Utf16>, Int32), int Function(int, Pointer<Utf16>, int)>('GetWindowTextW');
final _openClipboard = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('OpenClipboard');
final _closeClipboard = _user32.lookupFunction<Int32 Function(), int Function()>('CloseClipboard');
final _emptyClipboard = _user32.lookupFunction<Int32 Function(), int Function()>('EmptyClipboard');
final _getClipboardData = _user32.lookupFunction<IntPtr Function(Uint32), int Function(int)>('GetClipboardData');
final _setClipboardData = _user32.lookupFunction<IntPtr Function(Uint32, IntPtr), int Function(int, int)>('SetClipboardData');

final _createCompatibleDC = _gdi32.lookupFunction<IntPtr Function(IntPtr), int Function(int)>('CreateCompatibleDC');
final _createCompatibleBitmap = _gdi32.lookupFunction<IntPtr Function(IntPtr, Int32, Int32), int Function(int, int, int)>('CreateCompatibleBitmap');
final _selectObject = _gdi32.lookupFunction<IntPtr Function(IntPtr, IntPtr), int Function(int, int)>('SelectObject');
final _bitBlt = _gdi32.lookupFunction<Int32 Function(IntPtr, Int32, Int32, Int32, Int32, IntPtr, Int32, Int32, Uint32), int Function(int, int, int, int, int, int, int, int, int)>('BitBlt');
final _getDIBits = _gdi32.lookupFunction<Int32 Function(IntPtr, IntPtr, Uint32, Uint32, Pointer<Uint8>, Pointer<Uint8>, Uint32), int Function(int, int, int, int, Pointer<Uint8>, Pointer<Uint8>, int)>('GetDIBits');
final _deleteObject = _gdi32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('DeleteObject');
final _deleteDC = _gdi32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('DeleteDC');

final _globalAlloc = _kernel32.lookupFunction<IntPtr Function(Uint32, IntPtr), int Function(int, int)>('GlobalAlloc');
final _globalLock = _kernel32.lookupFunction<Pointer<Uint8> Function(IntPtr), Pointer<Uint8> Function(int)>('GlobalLock');
final _globalUnlock = _kernel32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('GlobalUnlock');
final _globalFree = _kernel32.lookupFunction<IntPtr Function(IntPtr), int Function(int)>('GlobalFree');

final _shellExecute = _shell32.lookupFunction<
    IntPtr Function(IntPtr, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>, Int32),
    int Function(int, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>, Pointer<Utf16>, int)>('ShellExecuteW');

/// The whole desktop across monitors, in screen pixels.
({int x, int y, int width, int height}) virtualScreen() => (
      x: _getSystemMetrics(76),
      y: _getSystemMetrics(77),
      width: _getSystemMetrics(78),
      height: _getSystemMetrics(79),
    );

/// Pixels of a screen rectangle, top row first, 4 bytes each (B, G, R, x).
Uint8List capture(int x, int y, int width, int height) {
  final screen = _getDC(0);
  final mem = _createCompatibleDC(screen);
  final bitmap = _createCompatibleBitmap(screen, width, height);
  final old = _selectObject(mem, bitmap);
  final info = calloc<Uint8>(44);
  final pixels = calloc<Uint8>(width * height * 4);
  try {
    // SRCCOPY | CAPTUREBLT (layered windows too).
    if (_bitBlt(mem, 0, 0, width, height, screen, x, y, 0x00CC0020 | 0x40000000) == 0) {
      throw StateError('Could not capture the screen.');
    }
    final h = info.cast<Int32>();
    h[0] = 40; // biSize
    h[1] = width;
    h[2] = -height; // top-down
    info.cast<Uint16>()[6] = 1; // biPlanes
    info.cast<Uint16>()[7] = 32; // biBitCount
    // biCompression (BI_RGB) and the rest stay 0.
    _selectObject(mem, old);
    if (_getDIBits(mem, bitmap, 0, height, pixels, info, 0) == 0) throw StateError('Could not read the screen pixels.');
    return Uint8List.fromList(pixels.asTypedList(width * height * 4));
  } finally {
    calloc.free(info);
    calloc.free(pixels);
    _selectObject(mem, old);
    _deleteObject(bitmap);
    _deleteDC(mem);
    _releaseDC(0, screen);
  }
}

/// The title of the window in front.
String foregroundTitle() {
  final hwnd = _getForegroundWindow();
  if (hwnd == 0) return '';
  final buf = calloc<Uint16>(512).cast<Utf16>();
  try {
    final n = _getWindowText(hwnd, buf, 512);
    return n <= 0 ? '' : buf.toDartString(length: n);
  } finally {
    calloc.free(buf);
  }
}

// SendInput. INPUT is 40 bytes on 64-bit Windows: type at 0, the union at 8.
const _inputSize = 40;

void _send(List<void Function(ByteData b, int at)> writers) {
  final buf = calloc<Uint8>(_inputSize * writers.length);
  try {
    final bytes = buf.asTypedList(_inputSize * writers.length);
    final data = ByteData.sublistView(bytes);
    for (var i = 0; i < writers.length; i++) {
      writers[i](data, i * _inputSize);
    }
    final sent = _sendInput(writers.length, buf, _inputSize);
    if (sent != writers.length) {
      throw StateError('Windows blocked the input (an admin window may be in front, or the PC is locked).');
    }
  } finally {
    calloc.free(buf);
  }
}

void Function(ByteData, int) _mouse(int flags, {int data = 0}) => (b, at) {
      b.setUint32(at, 0, Endian.little); // INPUT_MOUSE
      b.setInt32(at + 16, data, Endian.little); // mouseData
      b.setUint32(at + 20, flags, Endian.little);
    };

void Function(ByteData, int) _key(int vk, {bool up = false, int scan = 0, bool unicode = false}) => (b, at) {
      b.setUint32(at, 1, Endian.little); // INPUT_KEYBOARD
      b.setUint16(at + 8, vk, Endian.little);
      b.setUint16(at + 10, scan, Endian.little);
      var flags = 0;
      if (up) flags |= 0x2;
      if (unicode) flags |= 0x4;
      if (_extended.contains(vk)) flags |= 0x1;
      b.setUint32(at + 12, flags, Endian.little);
    };

const _extended = {0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x2D, 0x2E, 0x5B, 0x5C, 0x5D, 0x6F, 0x90, 0x2C};

void moveMouse(int x, int y) {
  if (_setCursorPos(x, y) == 0) throw StateError('Could not move the mouse.');
}

/// Where the pointer is now, in screen coordinates.
({int x, int y}) cursorPos() {
  final point = calloc<Int32>(2);
  try {
    if (_getCursorPos(point) == 0) throw StateError('Could not read the mouse position.');
    return (x: point[0], y: point[1]);
  } finally {
    calloc.free(point);
  }
}

void click(int x, int y, {String button = 'left', int times = 1}) {
  moveMouse(x, y);
  final (down, up) = switch (button) {
    'right' => (0x0008, 0x0010),
    'middle' => (0x0020, 0x0040),
    _ => (0x0002, 0x0004),
  };
  _send([
    for (var i = 0; i < times; i++) ...[_mouse(down), _mouse(up)],
  ]);
}

(int, int) _buttonFlags(String button) => switch (button) {
      'right' => (0x0008, 0x0010),
      'middle' => (0x0020, 0x0040),
      _ => (0x0002, 0x0004),
    };

/// Presses a mouse button without letting go (for dragging from the live view).
void mouseDown(String button) => _send([_mouse(_buttonFlags(button).$1)]);

void mouseUp(String button) => _send([_mouse(_buttonFlags(button).$2)]);

/// [notches] positive scrolls up (or right when [horizontal]).
void scroll(int x, int y, int notches, {bool horizontal = false}) {
  moveMouse(x, y);
  _send([_mouse(horizontal ? 0x1000 : 0x0800, data: notches * 120)]);
}

/// Types [text] as Unicode characters, whatever the keyboard layout.
void typeText(String text) {
  final writers = <void Function(ByteData, int)>[];
  for (final unit in text.replaceAll('\r\n', '\n').codeUnits) {
    if (unit == 0x0A) {
      writers.addAll([_key(0x0D), _key(0x0D, up: true)]);
    } else if (unit == 0x09) {
      writers.addAll([_key(0x09), _key(0x09, up: true)]);
    } else {
      writers.addAll([_key(0, scan: unit, unicode: true), _key(0, scan: unit, unicode: true, up: true)]);
    }
  }
  // Batches keep a long text from being cut off.
  for (var i = 0; i < writers.length; i += 200) {
    _send(writers.sublist(i, i + 200 > writers.length ? writers.length : i + 200));
  }
}

/// Presses a combination like `ctrl+shift+esc`, `alt+tab`, `win+r` or `enter`.
void pressKeys(String combo) {
  final keys = [for (final k in combo.toLowerCase().split('+').map((s) => s.trim()).where((s) => s.isNotEmpty)) _vk(k)];
  if (keys.isEmpty) throw ArgumentError('Name the keys, like ctrl+c.');
  _send([
    for (final k in keys) _key(k),
    for (final k in keys.reversed) _key(k, up: true),
  ]);
}

int _vk(String k) {
  const named = {
    'ctrl': 0x11, 'control': 0x11, 'shift': 0x10, 'alt': 0x12, 'win': 0x5B, 'windows': 0x5B, 'meta': 0x5B, 'cmd': 0x5B,
    'enter': 0x0D, 'return': 0x0D, 'tab': 0x09, 'esc': 0x1B, 'escape': 0x1B, 'backspace': 0x08, 'delete': 0x2E, 'del': 0x2E,
    'space': 0x20, 'up': 0x26, 'down': 0x28, 'left': 0x25, 'right': 0x27, 'home': 0x24, 'end': 0x23,
    'pageup': 0x21, 'pagedown': 0x22, 'insert': 0x2D, 'printscreen': 0x2C, 'menu': 0x5D, 'capslock': 0x14,
    'volumeup': 0xAF, 'volumedown': 0xAE, 'mute': 0xAD, 'playpause': 0xB3, 'nexttrack': 0xB0, 'prevtrack': 0xB1,
    ',': 0xBC, '.': 0xBE, '-': 0xBD, '=': 0xBB, ';': 0xBA, '/': 0xBF, '`': 0xC0, '[': 0xDB, ']': 0xDD, r'\': 0xDC, "'": 0xDE,
  };
  final n = named[k];
  if (n != null) return n;
  final f = RegExp(r'^f([1-9]|1[0-9]|2[0-4])$').firstMatch(k);
  if (f != null) return 0x6F + int.parse(f[1]!);
  if (k.length == 1) {
    final c = k.toUpperCase().codeUnitAt(0);
    if ((c >= 0x30 && c <= 0x39) || (c >= 0x41 && c <= 0x5A)) return c;
  }
  throw ArgumentError('Unknown key "$k".');
}

T _withClipboard<T>(T Function() body) {
  // Another app may hold it for a moment.
  for (var i = 0; i < 10; i++) {
    if (_openClipboard(0) != 0) {
      try {
        return body();
      } finally {
        _closeClipboard();
      }
    }
  }
  throw StateError('Another app is using the clipboard.');
}

String readClipboard() => _withClipboard(() {
      final h = _getClipboardData(13); // CF_UNICODETEXT
      if (h == 0) return '';
      final p = _globalLock(h);
      if (p.address == 0) return '';
      try {
        return p.cast<Utf16>().toDartString();
      } finally {
        _globalUnlock(h);
      }
    });

void writeClipboard(String text) => _withClipboard(() {
      final units = text.codeUnits;
      final h = _globalAlloc(0x0002, (units.length + 1) * 2); // GMEM_MOVEABLE
      if (h == 0) throw StateError('Out of memory.');
      final p = _globalLock(h).cast<Uint16>();
      for (var i = 0; i < units.length; i++) {
        p[i] = units[i];
      }
      p[units.length] = 0;
      _globalUnlock(h);
      _emptyClipboard();
      if (_setClipboardData(13, h) == 0) {
        _globalFree(h);
        throw StateError('Could not set the clipboard.');
      }
    });

/// Opens an app, file, folder or URL the way double-clicking would.
void shellOpen(String target, {String args = '', String? folder}) {
  final verb = 'open'.toNativeUtf16(), file = target.toNativeUtf16(), params = args.toNativeUtf16();
  final dir = folder == null ? nullptr : folder.toNativeUtf16();
  try {
    final r = _shellExecute(0, verb, file, params, dir, 1);
    if (r <= 32) throw StateError('Windows could not open "$target" (code $r).');
  } finally {
    calloc.free(verb);
    calloc.free(file);
    calloc.free(params);
    if (dir != nullptr) calloc.free(dir);
  }
}

// Windows on the desktop.

final _dwmapi = DynamicLibrary.open('dwmapi.dll');
final _enumWindows = _user32.lookupFunction<Int32 Function(Pointer<NativeFunction<_EnumProc>>, IntPtr), int Function(Pointer<NativeFunction<_EnumProc>>, int)>('EnumWindows');
final _isWindowVisible = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('IsWindowVisible');
final _isWindow = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('IsWindow');
final _isIconic = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('IsIconic');
final _isZoomed = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('IsZoomed');
final _getWindowLongPtr = _user32.lookupFunction<IntPtr Function(IntPtr, Int32), int Function(int, int)>('GetWindowLongPtrW');
final _getWindow = _user32.lookupFunction<IntPtr Function(IntPtr, Uint32), int Function(int, int)>('GetWindow');
final _getWindowRect = _user32.lookupFunction<Int32 Function(IntPtr, Pointer<Int32>), int Function(int, Pointer<Int32>)>('GetWindowRect');
final _getWindowThreadProcessId = _user32.lookupFunction<Uint32 Function(IntPtr, Pointer<Uint32>), int Function(int, Pointer<Uint32>)>('GetWindowThreadProcessId');
final _setForegroundWindow = _user32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('SetForegroundWindow');
final _showWindow = _user32.lookupFunction<Int32 Function(IntPtr, Int32), int Function(int, int)>('ShowWindow');
final _postMessage = _user32.lookupFunction<Int32 Function(IntPtr, Uint32, IntPtr, IntPtr), int Function(int, int, int, int)>('PostMessageW');
final _setWindowPos = _user32.lookupFunction<Int32 Function(IntPtr, IntPtr, Int32, Int32, Int32, Int32, Uint32), int Function(int, int, int, int, int, int, int)>('SetWindowPos');
final _lockWorkStation = _user32.lookupFunction<Int32 Function(), int Function()>('LockWorkStation');
final _dwmGetWindowAttribute = _dwmapi.lookupFunction<Int32 Function(IntPtr, Uint32, Pointer<Uint32>, Uint32), int Function(int, int, Pointer<Uint32>, int)>('DwmGetWindowAttribute');
final _openProcess = _kernel32.lookupFunction<IntPtr Function(Uint32, Int32, Uint32), int Function(int, int, int)>('OpenProcess');
final _closeHandle = _kernel32.lookupFunction<Int32 Function(IntPtr), int Function(int)>('CloseHandle');
final _queryImageName = _kernel32.lookupFunction<Int32 Function(IntPtr, Uint32, Pointer<Utf16>, Pointer<Uint32>), int Function(int, int, Pointer<Utf16>, Pointer<Uint32>)>('QueryFullProcessImageNameW');

typedef _EnumProc = Int32 Function(IntPtr, IntPtr);

/// A top-level window, as Alt+Tab would list it.
typedef WindowInfo = ({int id, String title, String app, int pid, int x, int y, int width, int height, bool minimized, bool maximized, bool focused});

final _found = <int>[];

int _onWindow(int hwnd, int _) {
  _found.add(hwnd);
  return 1;
}

/// The windows you could Alt+Tab to, the one in front first.
List<WindowInfo> listWindows() {
  _found.clear();
  _enumWindows(Pointer.fromFunction<_EnumProc>(_onWindow, 0), 0);
  final front = _getForegroundWindow();
  final out = <WindowInfo>[];
  final cloaked = calloc<Uint32>();
  try {
    for (final h in _found) {
      if (_isWindowVisible(h) == 0) continue;
      if (_getWindow(h, 4) != 0) continue; // owned popups
      if ((_getWindowLongPtr(h, -20) & 0x80) != 0) continue; // tool windows
      cloaked.value = 0;
      _dwmGetWindowAttribute(h, 14, cloaked, 4);
      if (cloaked.value != 0) continue; // hidden UWP and other desktops
      final title = _title(h);
      if (title.isEmpty) continue;
      final w = window(h, title: title, front: front);
      if (w != null) out.add(w);
    }
  } finally {
    calloc.free(cloaked);
  }
  out.sort((a, b) => a.focused == b.focused ? 0 : (a.focused ? -1 : 1));
  return out;
}

/// One window by id, or null when it's gone.
WindowInfo? window(int h, {String? title, int? front}) {
  if (_isWindow(h) == 0) return null;
  final rect = calloc<Int32>(4);
  final pid = calloc<Uint32>();
  try {
    _getWindowRect(h, rect);
    _getWindowThreadProcessId(h, pid);
    return (
      id: h,
      title: title ?? _title(h),
      app: _processName(pid.value),
      pid: pid.value,
      x: rect[0],
      y: rect[1],
      width: rect[2] - rect[0],
      height: rect[3] - rect[1],
      minimized: _isIconic(h) != 0,
      maximized: _isZoomed(h) != 0,
      focused: h == (front ?? _getForegroundWindow()),
    );
  } finally {
    calloc.free(rect);
    calloc.free(pid);
  }
}

String _title(int h) {
  final buf = calloc<Uint16>(512).cast<Utf16>();
  try {
    final n = _getWindowText(h, buf, 512);
    return n <= 0 ? '' : buf.toDartString(length: n);
  } finally {
    calloc.free(buf);
  }
}

String _processName(int pid) {
  final h = _openProcess(0x1000, 0, pid); // PROCESS_QUERY_LIMITED_INFORMATION
  if (h == 0) return '';
  final buf = calloc<Uint16>(1024).cast<Utf16>();
  final size = calloc<Uint32>()..value = 1024;
  try {
    if (_queryImageName(h, 0, buf, size) == 0) return '';
    final path = buf.toDartString(length: size.value);
    return path.split(r'\').last;
  } finally {
    calloc.free(buf);
    calloc.free(size);
    _closeHandle(h);
  }
}

/// Brings a window to the front (restoring it if minimized).
void focusWindow(int h) {
  if (_isWindow(h) == 0) throw StateError('That window is gone.');
  if (_isIconic(h) != 0) _showWindow(h, 9); // SW_RESTORE
  // Windows only lets the app in front change focus; a tap of Alt lifts that.
  _send([_key(0x12), _key(0x12, up: true)]);
  _setForegroundWindow(h);
}

void minimizeWindow(int h) => _showWindow(h, 6);
void maximizeWindow(int h) => _showWindow(h, 3);
void restoreWindow(int h) => _showWindow(h, 9);

/// Asks a window to close, as its X button would (it may ask to save).
void closeWindow(int h) {
  if (_postMessage(h, 0x0010, 0, 0) == 0) throw StateError('Could not close that window.');
}

void moveWindow(int h, int x, int y, int width, int height) {
  if (_isZoomed(h) != 0 || _isIconic(h) != 0) _showWindow(h, 9);
  if (_setWindowPos(h, 0, x, y, width, height, 0x0004 | 0x0010) == 0) throw StateError('Could not move that window.');
}

void lockPc() {
  if (_lockWorkStation() == 0) throw StateError('Could not lock the PC.');
}
