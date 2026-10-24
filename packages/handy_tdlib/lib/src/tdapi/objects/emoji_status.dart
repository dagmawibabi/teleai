part of '../tdapi.dart';

/// **EmojiStatus** *(emojiStatus)* - basic class
///
/// Describes an emoji to be shown instead of the Telegram Premium badge.
///
/// * [type]: Type of the emoji status.
/// * [expirationDate]: Point in time (Unix timestamp) when the status will expire; 0 if never.
final class EmojiStatus extends TdObject {
  /// **EmojiStatus** *(emojiStatus)* - basic class
  ///
  /// Describes an emoji to be shown instead of the Telegram Premium badge.
  ///
  /// * [type]: Type of the emoji status.
  /// * [expirationDate]: Point in time (Unix timestamp) when the status will expire; 0 if never.
  const EmojiStatus({
    required this.type,
    required this.expirationDate,
  });

  /// Type of the emoji status
  final EmojiStatusType type;

  /// Point in time (Unix timestamp) when the status will expire; 0 if never
  final int expirationDate;

  /// Parse from a json
  factory EmojiStatus.fromJson(Map<String, dynamic> json) => EmojiStatus(
        type: EmojiStatusType.fromJson(json['type']),
        expirationDate: json['expiration_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "expiration_date": expirationDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the emoji status
  /// * [expiration_date]: Point in time (Unix timestamp) when the status will expire; 0 if never
  EmojiStatus copyWith({
    EmojiStatusType? type,
    int? expirationDate,
  }) =>
      EmojiStatus(
        type: type ?? this.type,
        expirationDate: expirationDate ?? this.expirationDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
