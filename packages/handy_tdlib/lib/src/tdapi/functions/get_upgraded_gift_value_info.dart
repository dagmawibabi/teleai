part of '../tdapi.dart';

/// **GetUpgradedGiftValueInfo** *(getUpgradedGiftValueInfo)* - TDLib function
///
/// Returns information about value of an upgraded gift by its name.
///
/// * [name]: Unique name of the upgraded gift.
///
/// [UpgradedGiftValueInfo] is returned on completion.
final class GetUpgradedGiftValueInfo extends TdFunction {
  /// **GetUpgradedGiftValueInfo** *(getUpgradedGiftValueInfo)* - TDLib function
  ///
  /// Returns information about value of an upgraded gift by its name.
  ///
  /// * [name]: Unique name of the upgraded gift.
  ///
  /// [UpgradedGiftValueInfo] is returned on completion.
  const GetUpgradedGiftValueInfo({
    required this.name,
  });

  /// Unique name of the upgraded gift
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Unique name of the upgraded gift
  GetUpgradedGiftValueInfo copyWith({
    String? name,
  }) =>
      GetUpgradedGiftValueInfo(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftValueInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
