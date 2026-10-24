part of '../tdapi.dart';

/// **InputBusinessStartPage** *(inputBusinessStartPage)* - basic class
///
/// Describes settings for a business account start page to set.
///
/// * [title]: Title text of the start page; 0-getOption("business_start_page_title_length_max") characters.
/// * [message]: Message text of the start page; 0-getOption("business_start_page_message_length_max") characters.
/// * [sticker]: Greeting sticker of the start page; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji *(optional)*.
final class InputBusinessStartPage extends TdObject {
  /// **InputBusinessStartPage** *(inputBusinessStartPage)* - basic class
  ///
  /// Describes settings for a business account start page to set.
  ///
  /// * [title]: Title text of the start page; 0-getOption("business_start_page_title_length_max") characters.
  /// * [message]: Message text of the start page; 0-getOption("business_start_page_message_length_max") characters.
  /// * [sticker]: Greeting sticker of the start page; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji *(optional)*.
  const InputBusinessStartPage({
    required this.title,
    required this.message,
    this.sticker,
  });

  /// Title text of the start page; 0-getOption("business_start_page_title_length_max") characters
  final String title;

  /// Message text of the start page; 0-getOption("business_start_page_message_length_max") characters
  final String message;

  /// Greeting sticker of the start page; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji
  final InputFile? sticker;

  /// Parse from a json
  factory InputBusinessStartPage.fromJson(Map<String, dynamic> json) =>
      InputBusinessStartPage(
        title: json['title'],
        message: json['message'],
        sticker: json['sticker'] == null
            ? null
            : InputFile.fromJson(json['sticker']),
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
  /// * [title]: Title text of the start page; 0-getOption("business_start_page_title_length_max") characters
  /// * [message]: Message text of the start page; 0-getOption("business_start_page_message_length_max") characters
  /// * [sticker]: Greeting sticker of the start page; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji
  InputBusinessStartPage copyWith({
    String? title,
    String? message,
    InputFile? sticker,
  }) =>
      InputBusinessStartPage(
        title: title ?? this.title,
        message: message ?? this.message,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputBusinessStartPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
