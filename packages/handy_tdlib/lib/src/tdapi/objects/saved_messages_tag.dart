part of '../tdapi.dart';

/// **SavedMessagesTag** *(savedMessagesTag)* - basic class
///
/// Represents a tag used in Saved Messages or a Saved Messages topic.
///
/// * [tag]: The tag.
/// * [label]: Label of the tag; 0-12 characters. Always empty if the tag is returned for a Saved Messages topic.
/// * [count]: Number of times the tag was used; may be 0 if the tag has non-empty label.
final class SavedMessagesTag extends TdObject {
  /// **SavedMessagesTag** *(savedMessagesTag)* - basic class
  ///
  /// Represents a tag used in Saved Messages or a Saved Messages topic.
  ///
  /// * [tag]: The tag.
  /// * [label]: Label of the tag; 0-12 characters. Always empty if the tag is returned for a Saved Messages topic.
  /// * [count]: Number of times the tag was used; may be 0 if the tag has non-empty label.
  const SavedMessagesTag({
    required this.tag,
    required this.label,
    required this.count,
  });

  /// The tag
  final ReactionType tag;

  /// Label of the tag; 0-12 characters. Always empty if the tag is returned for a Saved Messages topic
  final String label;

  /// Number of times the tag was used; may be 0 if the tag has non-empty label
  final int count;

  /// Parse from a json
  factory SavedMessagesTag.fromJson(Map<String, dynamic> json) =>
      SavedMessagesTag(
        tag: ReactionType.fromJson(json['tag']),
        label: json['label'],
        count: json['count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "tag": tag.toJson(),
      "label": label,
      "count": count,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: The tag
  /// * [label]: Label of the tag; 0-12 characters. Always empty if the tag is returned for a Saved Messages topic
  /// * [count]: Number of times the tag was used; may be 0 if the tag has non-empty label
  SavedMessagesTag copyWith({
    ReactionType? tag,
    String? label,
    int? count,
  }) =>
      SavedMessagesTag(
        tag: tag ?? this.tag,
        label: label ?? this.label,
        count: count ?? this.count,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savedMessagesTag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
