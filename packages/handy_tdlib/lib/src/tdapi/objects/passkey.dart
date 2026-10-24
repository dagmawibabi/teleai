part of '../tdapi.dart';

/// **Passkey** *(passkey)* - basic class
///
/// Describes a passkey.
///
/// * [id]: Unique identifier of the passkey.
/// * [name]: Name of the passkey.
/// * [additionDate]: Point in time (Unix timestamp) when the passkey was added.
/// * [lastUsageDate]: Point in time (Unix timestamp) when the passkey was used last time; 0 if never.
/// * [softwareIconCustomEmojiId]: Identifier of the custom emoji that is used as the icon of the software that created the passkey; 0 if unknown.
final class Passkey extends TdObject {
  /// **Passkey** *(passkey)* - basic class
  ///
  /// Describes a passkey.
  ///
  /// * [id]: Unique identifier of the passkey.
  /// * [name]: Name of the passkey.
  /// * [additionDate]: Point in time (Unix timestamp) when the passkey was added.
  /// * [lastUsageDate]: Point in time (Unix timestamp) when the passkey was used last time; 0 if never.
  /// * [softwareIconCustomEmojiId]: Identifier of the custom emoji that is used as the icon of the software that created the passkey; 0 if unknown.
  const Passkey({
    required this.id,
    required this.name,
    required this.additionDate,
    required this.lastUsageDate,
    required this.softwareIconCustomEmojiId,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the passkey
  final String id;

  /// Name of the passkey
  final String name;

  /// Point in time (Unix timestamp) when the passkey was added
  final int additionDate;

  /// Point in time (Unix timestamp) when the passkey was used last time; 0 if never
  final int lastUsageDate;

  /// Identifier of the custom emoji that is used as the icon of the software that created the passkey; 0 if unknown
  final int softwareIconCustomEmojiId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Passkey.fromJson(Map<String, dynamic> json) => Passkey(
        id: json['id'],
        name: json['name'],
        additionDate: json['addition_date'],
        lastUsageDate: json['last_usage_date'],
        softwareIconCustomEmojiId: json['software_icon_custom_emoji_id'] is int
            ? json['software_icon_custom_emoji_id']
            : int.parse(json['software_icon_custom_emoji_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "addition_date": additionDate,
      "last_usage_date": lastUsageDate,
      "software_icon_custom_emoji_id": softwareIconCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the passkey
  /// * [name]: Name of the passkey
  /// * [addition_date]: Point in time (Unix timestamp) when the passkey was added
  /// * [last_usage_date]: Point in time (Unix timestamp) when the passkey was used last time; 0 if never
  /// * [software_icon_custom_emoji_id]: Identifier of the custom emoji that is used as the icon of the software that created the passkey; 0 if unknown
  Passkey copyWith({
    String? id,
    String? name,
    int? additionDate,
    int? lastUsageDate,
    int? softwareIconCustomEmojiId,
    dynamic extra,
    int? clientId,
  }) =>
      Passkey(
        id: id ?? this.id,
        name: name ?? this.name,
        additionDate: additionDate ?? this.additionDate,
        lastUsageDate: lastUsageDate ?? this.lastUsageDate,
        softwareIconCustomEmojiId:
            softwareIconCustomEmojiId ?? this.softwareIconCustomEmojiId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passkey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
