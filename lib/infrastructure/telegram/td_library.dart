import 'dart:io';

import 'package:handy_tdlib/handy_tdlib.dart';

/// Opens TDLib's native library for [TdPlugin]: handy_tdlib's bundled
/// `libtdjson` on Android and desktop, `tdjson.framework` on iOS.
Future<void> openTdLibrary() => TdPlugin.initialize(Platform.isIOS ? 'tdjson.framework/tdjson' : null);
