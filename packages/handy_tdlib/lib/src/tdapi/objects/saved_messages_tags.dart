part of '../tdapi.dart';

/// **SavedMessagesTags** *(savedMessagesTags)* - basic class
///
/// Contains a list of tags used in Saved Messages.
///
/// * [tags]: List of tags.
final class SavedMessagesTags extends TdObject {
  /// **SavedMessagesTags** *(savedMessagesTags)* - basic class
  ///
  /// Contains a list of tags used in Saved Messages.
  ///
  /// * [tags]: List of tags.
  const SavedMessagesTags({
    required this.tags,
    this.extra,
    this.clientId,
  });

  /// List of tags
  final List<SavedMessagesTag> tags;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory SavedMessagesTags.fromJson(Map<String, dynamic> json) =>
      SavedMessagesTags(
        tags: List<SavedMessagesTag>.from((json['tags'] ?? [])
            .map((item) => SavedMessagesTag.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "tags": tags.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tags]: List of tags
  SavedMessagesTags copyWith({
    List<SavedMessagesTag>? tags,
    dynamic extra,
    int? clientId,
  }) =>
      SavedMessagesTags(
        tags: tags ?? this.tags,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savedMessagesTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
