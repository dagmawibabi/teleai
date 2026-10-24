part of '../tdapi.dart';

/// **ReportOption** *(reportOption)* - basic class
///
/// Describes an option to report an entity to Telegram.
///
/// * [id]: Unique identifier of the option.
/// * [text]: Text of the option.
final class ReportOption extends TdObject {
  /// **ReportOption** *(reportOption)* - basic class
  ///
  /// Describes an option to report an entity to Telegram.
  ///
  /// * [id]: Unique identifier of the option.
  /// * [text]: Text of the option.
  const ReportOption({
    required this.id,
    required this.text,
  });

  /// Unique identifier of the option
  final String id;

  /// Text of the option
  final String text;

  /// Parse from a json
  factory ReportOption.fromJson(Map<String, dynamic> json) => ReportOption(
        id: json['id'],
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the option
  /// * [text]: Text of the option
  ReportOption copyWith({
    String? id,
    String? text,
  }) =>
      ReportOption(
        id: id ?? this.id,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
