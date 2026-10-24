part of '../tdapi.dart';

/// **SetSavedMessagesTagLabel** *(setSavedMessagesTagLabel)* - TDLib function
///
/// Changes label of a Saved Messages tag; for Telegram Premium users only.
///
/// * [tag]: The tag which label will be changed.
/// * [label]: New label for the tag; 0-12 characters.
///
/// [Ok] is returned on completion.
final class SetSavedMessagesTagLabel extends TdFunction {
  /// **SetSavedMessagesTagLabel** *(setSavedMessagesTagLabel)* - TDLib function
  ///
  /// Changes label of a Saved Messages tag; for Telegram Premium users only.
  ///
  /// * [tag]: The tag which label will be changed.
  /// * [label]: New label for the tag; 0-12 characters.
  ///
  /// [Ok] is returned on completion.
  const SetSavedMessagesTagLabel({
    required this.tag,
    required this.label,
  });

  /// The tag which label will be changed
  final ReactionType tag;

  /// New label for the tag; 0-12 characters
  final String label;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag": tag.toJson(),
      "label": label,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: The tag which label will be changed
  /// * [label]: New label for the tag; 0-12 characters
  SetSavedMessagesTagLabel copyWith({
    ReactionType? tag,
    String? label,
  }) =>
      SetSavedMessagesTagLabel(
        tag: tag ?? this.tag,
        label: label ?? this.label,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSavedMessagesTagLabel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
