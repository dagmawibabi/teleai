part of '../tdapi.dart';

/// **GetSupergroupFullInfo** *(getSupergroupFullInfo)* - TDLib function
///
/// Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute.
///
/// * [supergroupId]: Supergroup or channel identifier.
///
/// [SupergroupFullInfo] is returned on completion.
final class GetSupergroupFullInfo extends TdFunction {
  /// **GetSupergroupFullInfo** *(getSupergroupFullInfo)* - TDLib function
  ///
  /// Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute.
  ///
  /// * [supergroupId]: Supergroup or channel identifier.
  ///
  /// [SupergroupFullInfo] is returned on completion.
  const GetSupergroupFullInfo({
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
  GetSupergroupFullInfo copyWith({
    int? supergroupId,
  }) =>
      GetSupergroupFullInfo(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSupergroupFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
