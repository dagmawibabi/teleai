part of '../tdapi.dart';

/// **DisableAllSupergroupUsernames** *(disableAllSupergroupUsernames)* - TDLib function
///
/// Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in the supergroup or channel.
///
/// * [supergroupId]: Identifier of the supergroup or channel.
///
/// [Ok] is returned on completion.
final class DisableAllSupergroupUsernames extends TdFunction {
  /// **DisableAllSupergroupUsernames** *(disableAllSupergroupUsernames)* - TDLib function
  ///
  /// Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in the supergroup or channel.
  ///
  /// * [supergroupId]: Identifier of the supergroup or channel.
  ///
  /// [Ok] is returned on completion.
  const DisableAllSupergroupUsernames({
    required this.supergroupId,
  });

  /// Identifier of the supergroup or channel
  final int supergroupId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup or channel
  DisableAllSupergroupUsernames copyWith({
    int? supergroupId,
  }) =>
      DisableAllSupergroupUsernames(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disableAllSupergroupUsernames';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
