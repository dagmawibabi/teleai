part of '../tdapi.dart';

/// **ToggleSupergroupIsForum** *(toggleSupergroupIsForum)* - TDLib function
///
/// Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion supergroups can't be converted to forums.
///
/// * [supergroupId]: Identifier of the supergroup.
/// * [isForum]: New value of is_forum.
/// * [hasForumTabs]: New value of has_forum_tabs; ignored if is_forum is false.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupIsForum extends TdFunction {
  /// **ToggleSupergroupIsForum** *(toggleSupergroupIsForum)* - TDLib function
  ///
  /// Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion supergroups can't be converted to forums.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  /// * [isForum]: New value of is_forum.
  /// * [hasForumTabs]: New value of has_forum_tabs; ignored if is_forum is false.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupIsForum({
    required this.supergroupId,
    required this.isForum,
    required this.hasForumTabs,
  });

  /// Identifier of the supergroup
  final int supergroupId;

  /// New value of is_forum
  final bool isForum;

  /// New value of has_forum_tabs; ignored if is_forum is false
  final bool hasForumTabs;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "is_forum": isForum,
      "has_forum_tabs": hasForumTabs,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup
  /// * [is_forum]: New value of is_forum
  /// * [has_forum_tabs]: New value of has_forum_tabs; ignored if is_forum is false
  ToggleSupergroupIsForum copyWith({
    int? supergroupId,
    bool? isForum,
    bool? hasForumTabs,
  }) =>
      ToggleSupergroupIsForum(
        supergroupId: supergroupId ?? this.supergroupId,
        isForum: isForum ?? this.isForum,
        hasForumTabs: hasForumTabs ?? this.hasForumTabs,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupIsForum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
