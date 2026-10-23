import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import 'link_opener.dart';

/// Telegram's entities as text styles; links, mentions and hashtags are
/// tinted, and links open in the browser.
TextSpan formattedSpan(td.FormattedText f, {Color? link}) {
  final tint = link ?? AppColors.accent;
  final text = f.text;
  if (f.entities.isEmpty) return TextSpan(text: text);
  final spans = <InlineSpan>[];
  var at = 0;
  final entities = [...f.entities]..sort((a, b) => a.offset.compareTo(b.offset));
  for (final e in entities) {
    if (e.offset < at || e.offset + e.length > text.length) continue;
    if (e.offset > at) spans.add(TextSpan(text: text.substring(at, e.offset)));
    final piece = text.substring(e.offset, e.offset + e.length);
    String? url;
    TextStyle? style;
    switch (e.type) {
      case td.TextEntityTypeBold():
        style = const TextStyle(fontWeight: FontWeight.w700);
      case td.TextEntityTypeItalic():
        style = const TextStyle(fontStyle: FontStyle.italic);
      case td.TextEntityTypeUnderline():
        style = const TextStyle(decoration: TextDecoration.underline);
      case td.TextEntityTypeStrikethrough():
        style = const TextStyle(decoration: TextDecoration.lineThrough);
      case td.TextEntityTypeSpoiler():
        style = TextStyle(backgroundColor: AppColors.text3.withValues(alpha: 0.6), color: Colors.transparent);
      case td.TextEntityTypeCode() || td.TextEntityTypePre() || td.TextEntityTypePreCode():
        style = const TextStyle(fontFamily: 'monospace', backgroundColor: AppColors.surface3);
      case td.TextEntityTypeUrl():
        url = piece.startsWith('http') ? piece : 'https://$piece';
      case td.TextEntityTypeTextUrl(url: final u):
        url = u;
      case td.TextEntityTypeEmailAddress():
        url = 'mailto:$piece';
      case td.TextEntityTypePhoneNumber():
        url = 'tel:$piece';
      case td.TextEntityTypeMention():
        url = 'https://t.me/${piece.replaceFirst('@', '')}';
      case td.TextEntityTypeHashtag() || td.TextEntityTypeCashtag() || td.TextEntityTypeBotCommand():
        style = TextStyle(color: tint);
      case td.TextEntityTypeBlockQuote() || td.TextEntityTypeExpandableBlockQuote():
        style = const TextStyle(color: AppColors.text2, fontStyle: FontStyle.italic);
      default:
        break;
    }
    if (url != null) {
      final target = url;
      spans.add(
        TextSpan(
          text: piece,
          style: TextStyle(color: tint, decoration: TextDecoration.underline, decorationColor: tint.withValues(alpha: 0.4)),
          recognizer: TapGestureRecognizer()
            ..onTap = () => openUrl(target),
        ),
      );
    } else {
      spans.add(TextSpan(text: piece, style: style));
    }
    at = e.offset + e.length;
  }
  if (at < text.length) spans.add(TextSpan(text: text.substring(at)));
  return TextSpan(children: spans);
}

/// A voice note's waveform: 5-bit samples packed little-endian.
List<int> decodeWaveform(String base64Data, {int bars = 40}) {
  List<int> bytes;
  try {
    bytes = base64Decode(base64Data);
  } catch (_) {
    bytes = const [];
  }
  final count = bytes.length * 8 ~/ 5;
  if (count == 0) return List.filled(bars, 4);
  final values = <int>[];
  for (var i = 0; i < count; i++) {
    final bit = i * 5;
    final byte = bit ~/ 8;
    final shift = bit % 8;
    final lo = bytes[byte];
    final hi = byte + 1 < bytes.length ? bytes[byte + 1] : 0;
    values.add(((lo | (hi << 8)) >> shift) & 31);
  }
  return [
    for (var b = 0; b < bars; b++) values[(b * values.length / bars).floor().clamp(0, values.length - 1)],
  ];
}
