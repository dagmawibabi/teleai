part of '../tdapi.dart';

/// **ToggleSupergroupIsBroadcastGroup** *(toggleSupergroupIsBroadcastGroup)* - TDLib function
///
/// Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup.
///
/// * [supergroupId]: Identifier of the supergroup.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupIsBroadcastGroup extends TdFunction {
  /// **ToggleSupergroupIsBroadcastGroup** *(toggleSupergroupIsBroadcastGroup)* - TDLib function
  ///
  /// Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupIsBroadcastGroup({
    required this.supergroupId,
  });

  /// Identifier of the supergroup
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
  /// * [supergroup_id]: Identifier of the supergroup
  ToggleSupergroupIsBroadcastGroup copyWith({
    int? supergroupId,
  }) =>
      ToggleSupergroupIsBroadcastGroup(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupIsBroadcastGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
