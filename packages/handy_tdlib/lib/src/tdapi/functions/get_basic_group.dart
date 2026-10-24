part of '../tdapi.dart';

/// **GetBasicGroup** *(getBasicGroup)* - TDLib function
///
/// Returns information about a basic group by its identifier. This is an offline method if the current user is not a bot.
///
/// * [basicGroupId]: Basic group identifier.
///
/// [BasicGroup] is returned on completion.
final class GetBasicGroup extends TdFunction {
  /// **GetBasicGroup** *(getBasicGroup)* - TDLib function
  ///
  /// Returns information about a basic group by its identifier. This is an offline method if the current user is not a bot.
  ///
  /// * [basicGroupId]: Basic group identifier.
  ///
  /// [BasicGroup] is returned on completion.
  const GetBasicGroup({
    required this.basicGroupId,
  });

  /// Basic group identifier
  final int basicGroupId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "basic_group_id": basicGroupId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [basic_group_id]: Basic group identifier
  GetBasicGroup copyWith({
    int? basicGroupId,
  }) =>
      GetBasicGroup(
        basicGroupId: basicGroupId ?? this.basicGroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBasicGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
