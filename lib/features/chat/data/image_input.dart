import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

/// Loads accessible image files, direct web images and inline image data.
/// Decode the actual content so extensionless files work and HTML is rejected.
class ImageInputLoader {
  ImageInputLoader({required this.directory, http.Client? httpClient})
    : _client = httpClient ?? http.Client(),
      _ownsClient = httpClient == null;

  final Directory directory;
  final http.Client _client;
  final bool _ownsClient;
  static const maxBytes = 20 * 1024 * 1024;
  static const _timeout = Duration(seconds: 30);

  void close() {
    if (_ownsClient) _client.close();
  }

  Future<File> load(String source) async {
    source = source.trim();
    if (source.isEmpty) throw const FormatException('No image supplied.');
    final uri = Uri.tryParse(source);
    Uint8List bytes;
    if (uri?.scheme == 'http' || uri?.scheme == 'https') {
      final response = await _client
          .send(http.Request('GET', uri!))
          .timeout(_timeout);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        await response.stream.take(0).drain<void>();
        throw HttpException('Image request failed (${response.statusCode}).');
      }
      if ((response.contentLength ?? 0) > maxBytes) {
        await response.stream.take(0).drain<void>();
        throw const FormatException('Image exceeds 20 MB.');
      }
      final body = BytesBuilder(copy: false);
      await for (final chunk in response.stream.timeout(_timeout)) {
        if (body.length + chunk.length > maxBytes) {
          throw const FormatException('Image exceeds 20 MB.');
        }
        body.add(chunk);
      }
      bytes = body.takeBytes();
    } else if (uri?.scheme == 'data') {
      if (source.length > maxBytes * 4) {
        throw const FormatException('Image exceeds 20 MB.');
      }
      final data = UriData.parse(source);
      if (!data.mimeType.startsWith('image/')) {
        throw const FormatException('Expected an image data URL.');
      }
      bytes = Uint8List.fromList(data.contentAsBytes());
    } else {
      final file = uri?.scheme == 'file' ? File.fromUri(uri!) : File(source);
      if (await file.length() > maxBytes) {
        throw const FormatException('Image exceeds 20 MB.');
      }
      bytes = await file.readAsBytes();
    }
    if (bytes.length > maxBytes) {
      throw const FormatException('Image exceeds 20 MB.');
    }
    // A PNG copy also makes formats supported by the device's decoder usable
    // by the model. Animated images use their first frame.
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: 2048,
      allowUpscaling: false,
    );
    try {
      final frame = await codec.getNextFrame();
      try {
        final png = await frame.image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        if (png == null) {
          throw const FormatException('Could not decode this image.');
        }
        await directory.create(recursive: true);
        return await File('${directory.path}/${const Uuid().v4()}.png')
            .writeAsBytes(
              png.buffer.asUint8List(png.offsetInBytes, png.lengthInBytes),
            );
      } finally {
        frame.image.dispose();
      }
    } finally {
      codec.dispose();
    }
  }
}
