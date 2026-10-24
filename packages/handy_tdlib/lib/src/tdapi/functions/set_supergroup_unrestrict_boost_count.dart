part of '../tdapi.dart';

/// **SetSupergroupUnrestrictBoostCount** *(setSupergroupUnrestrictBoostCount)* - TDLib function
///
/// Changes the number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; requires can_restrict_members administrator right.
///
/// * [supergroupId]: Identifier of the supergroup.
/// * [unrestrictBoostCount]: New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting.
///
/// [Ok] is returned on completion.
final class SetSupergroupUnrestrictBoostCount extends TdFunction {
  /// **SetSupergroupUnrestrictBoostCount** *(setSupergroupUnrestrictBoostCount)* - TDLib function
  ///
  /// Changes the number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; requires can_restrict_members administrator right.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  /// * [unrestrictBoostCount]: New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting.
  ///
  /// [Ok] is returned on completion.
  const SetSupergroupUnrestrictBoostCount({
    required this.supergroupId,
    required this.unrestrictBoostCount,
  });

  /// Identifier of the supergroup
  final int supergroupId;

  /// New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting
  final int unrestrictBoostCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "unrestrict_boost_count": unrestrictBoostCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup
  /// * [unrestrict_boost_count]: New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting
  SetSupergroupUnrestrictBoostCount copyWith({
    int? supergroupId,
    int? unrestrictBoostCount,
  }) =>
      SetSupergroupUnrestrictBoostCount(
        supergroupId: supergroupId ?? this.supergroupId,
        unrestrictBoostCount: unrestrictBoostCount ?? this.unrestrictBoostCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSupergroupUnrestrictBoostCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
