part of '../tdapi.dart';

/// **ToggleSupergroupCanHaveSponsoredMessages** *(toggleSupergroupCanHaveSponsoredMessages)* - TDLib function
///
/// Toggles whether sponsored messages are shown in the channel chat; requires owner privileges in the channel.. The chat must have at least chatBoostFeatures.min_sponsored_message_disable_boost_level boost level to disable sponsored messages.
///
/// * [supergroupId]: The identifier of the channel.
/// * [canHaveSponsoredMessages]: The new value of can_have_sponsored_messages.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupCanHaveSponsoredMessages extends TdFunction {
  /// **ToggleSupergroupCanHaveSponsoredMessages** *(toggleSupergroupCanHaveSponsoredMessages)* - TDLib function
  ///
  /// Toggles whether sponsored messages are shown in the channel chat; requires owner privileges in the channel.. The chat must have at least chatBoostFeatures.min_sponsored_message_disable_boost_level boost level to disable sponsored messages.
  ///
  /// * [supergroupId]: The identifier of the channel.
  /// * [canHaveSponsoredMessages]: The new value of can_have_sponsored_messages.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupCanHaveSponsoredMessages({
    required this.supergroupId,
    required this.canHaveSponsoredMessages,
  });

  /// The identifier of the channel
  final int supergroupId;

  /// The new value of can_have_sponsored_messages
  final bool canHaveSponsoredMessages;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "can_have_sponsored_messages": canHaveSponsoredMessages,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: The identifier of the channel
  /// * [can_have_sponsored_messages]: The new value of can_have_sponsored_messages
  ToggleSupergroupCanHaveSponsoredMessages copyWith({
    int? supergroupId,
    bool? canHaveSponsoredMessages,
  }) =>
      ToggleSupergroupCanHaveSponsoredMessages(
        supergroupId: supergroupId ?? this.supergroupId,
        canHaveSponsoredMessages:
            canHaveSponsoredMessages ?? this.canHaveSponsoredMessages,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleSupergroupCanHaveSponsoredMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
