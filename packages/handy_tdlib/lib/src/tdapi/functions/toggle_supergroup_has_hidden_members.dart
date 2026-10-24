part of '../tdapi.dart';

/// **ToggleSupergroupHasHiddenMembers** *(toggleSupergroupHasHiddenMembers)* - TDLib function
///
/// Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers. Can be called only if supergroupFullInfo.can_hide_members == true.
///
/// * [supergroupId]: Identifier of the supergroup.
/// * [hasHiddenMembers]: New value of has_hidden_members.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupHasHiddenMembers extends TdFunction {
  /// **ToggleSupergroupHasHiddenMembers** *(toggleSupergroupHasHiddenMembers)* - TDLib function
  ///
  /// Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers. Can be called only if supergroupFullInfo.can_hide_members == true.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  /// * [hasHiddenMembers]: New value of has_hidden_members.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupHasHiddenMembers({
    required this.supergroupId,
    required this.hasHiddenMembers,
  });

  /// Identifier of the supergroup
  final int supergroupId;

  /// New value of has_hidden_members
  final bool hasHiddenMembers;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "has_hidden_members": hasHiddenMembers,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup
  /// * [has_hidden_members]: New value of has_hidden_members
  ToggleSupergroupHasHiddenMembers copyWith({
    int? supergroupId,
    bool? hasHiddenMembers,
  }) =>
      ToggleSupergroupHasHiddenMembers(
        supergroupId: supergroupId ?? this.supergroupId,
        hasHiddenMembers: hasHiddenMembers ?? this.hasHiddenMembers,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupHasHiddenMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
