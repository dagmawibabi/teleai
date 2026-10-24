part of '../tdapi.dart';

/// **BusinessStartPage** *(businessStartPage)* - basic class
///
/// Describes settings for a business account start page.
///
/// * [title]: Title text of the start page.
/// * [message]: Message text of the start page.
/// * [sticker]: Greeting sticker of the start page; may be null if none *(optional)*.
final class BusinessStartPage extends TdObject {
  /// **BusinessStartPage** *(businessStartPage)* - basic class
  ///
  /// Describes settings for a business account start page.
  ///
  /// * [title]: Title text of the start page.
  /// * [message]: Message text of the start page.
  /// * [sticker]: Greeting sticker of the start page; may be null if none *(optional)*.
  const BusinessStartPage({
    required this.title,
    required this.message,
    this.sticker,
  });

  /// Title text of the start page
  final String title;

  /// Message text of the start page
  final String message;

  /// Greeting sticker of the start page; may be null if none
  final Sticker? sticker;

  /// Parse from a json
  factory BusinessStartPage.fromJson(Map<String, dynamic> json) =>
      BusinessStartPage(
        title: json['title'],
        message: json['message'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "message": message,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title text of the start page
  /// * [message]: Message text of the start page
  /// * [sticker]: Greeting sticker of the start page; may be null if none
  BusinessStartPage copyWith({
    String? title,
    String? message,
    Sticker? sticker,
  }) =>
      BusinessStartPage(
        title: title ?? this.title,
        message: message ?? this.message,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessStartPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
