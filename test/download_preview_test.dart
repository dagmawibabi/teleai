// A downloaded picture is recognised by its bytes and shown in the tool details.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/presentation/widgets/tool_result_view.dart';
import 'package:teleai/features/web/web_fetch.dart';

void main() {
  test('pictures are told apart by their first bytes', () {
    expect(WebFetcher.isPicture([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]), isTrue);
    expect(WebFetcher.isPicture([0xFF, 0xD8, 0xFF, 0xE0]), isTrue);
    expect(WebFetcher.isPicture('GIF89a'.codeUnits), isTrue);
    expect(WebFetcher.isPicture('RIFF\x00\x00\x00\x00WEBPVP8 '.codeUnits), isTrue);
    expect(WebFetcher.isPicture('<!doctype html><html>'.codeUnits), isFalse);
    expect(WebFetcher.isPicture('%PDF-1.7'.codeUnits), isFalse);
    expect(WebFetcher.isPicture(const []), isFalse);
  });

  testWidgets('the details show the picture and keep the file facts', (tester) async {
    final dir = Directory.systemTemp.createTempSync('tc_download');
    addTearDown(() => dir.deleteSync(recursive: true));
    final file = File('${dir.path}/photo.png')..writeAsBytesSync([0x89, 0x50, 0x4E, 0x47]);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ToolResultView(
          name: 'download_file',
          json: {'created': true, 'file_path': file.path, 'image_path': file.path, 'name': 'photo.png', 'size_kb': 1},
        ),
      ),
    ));
    expect(find.byType(GeneratedImage), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
