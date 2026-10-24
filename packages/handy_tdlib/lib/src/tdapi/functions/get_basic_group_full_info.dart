part of '../tdapi.dart';

/// **GetBasicGroupFullInfo** *(getBasicGroupFullInfo)* - TDLib function
///
/// Returns full information about a basic group by its identifier.
///
/// * [basicGroupId]: Basic group identifier.
///
/// [BasicGroupFullInfo] is returned on completion.
final class GetBasicGroupFullInfo extends TdFunction {
  /// **GetBasicGroupFullInfo** *(getBasicGroupFullInfo)* - TDLib function
  ///
  /// Returns full information about a basic group by its identifier.
  ///
  /// * [basicGroupId]: Basic group identifier.
  ///
  /// [BasicGroupFullInfo] is returned on completion.
  const GetBasicGroupFullInfo({
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
  GetBasicGroupFullInfo copyWith({
    int? basicGroupId,
  }) =>
      GetBasicGroupFullInfo(
        basicGroupId: basicGroupId ?? this.basicGroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBasicGroupFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
