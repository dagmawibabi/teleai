part of '../tdapi.dart';

/// **GetSupergroup** *(getSupergroup)* - TDLib function
///
/// Returns information about a supergroup or a channel by its identifier. This is an offline method if the current user is not a bot.
///
/// * [supergroupId]: Supergroup or channel identifier.
///
/// [Supergroup] is returned on completion.
final class GetSupergroup extends TdFunction {
  /// **GetSupergroup** *(getSupergroup)* - TDLib function
  ///
  /// Returns information about a supergroup or a channel by its identifier. This is an offline method if the current user is not a bot.
  ///
  /// * [supergroupId]: Supergroup or channel identifier.
  ///
  /// [Supergroup] is returned on completion.
  const GetSupergroup({
    required this.supergroupId,
  });

  /// Supergroup or channel identifier
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
  /// * [supergroup_id]: Supergroup or channel identifier
  GetSupergroup copyWith({
    int? supergroupId,
  }) =>
      GetSupergroup(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSupergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
