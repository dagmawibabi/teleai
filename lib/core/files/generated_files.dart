import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// The folder for files the assistant makes or downloads (images, audio,
/// sandbox output, cloud downloads). Files listed it as "Made by AI".
Future<Directory> generatedDir() async =>
    Directory('${(await getApplicationSupportDirectory()).path}/generated').create(recursive: true);

/// A new file in [generatedDir] that never replaces an earlier one: [name]
/// keeps its readable stem and extension, plus a short random suffix, so
/// two downloads of `report.pdf` stay two files.
Future<File> uniqueGeneratedFile(String name) async {
  final dir = await generatedDir();
  final base = name.split(RegExp(r'[\\/]')).last.trim();
  final dot = base.lastIndexOf('.');
  final stem = (dot > 0 ? base.substring(0, dot) : base).replaceAll(RegExp(r'[^\w\-. ]'), '_');
  final ext = dot > 0 ? base.substring(dot) : '';
  final id = const Uuid().v4().substring(0, 8);
  return File('${dir.path}/${stem.isEmpty ? 'file' : stem}_$id$ext');
}

/// Writes [bytes] to a [uniqueGeneratedFile] named after [name].
Future<File> saveGeneratedBytes(String name, List<int> bytes) async =>
    (await uniqueGeneratedFile(name)).writeAsBytes(bytes);
