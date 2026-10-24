part of '../tdapi.dart';

/// **GetUpgradedGift** *(getUpgradedGift)* - TDLib function
///
/// Returns information about an upgraded gift by its name.
///
/// * [name]: Unique name of the upgraded gift.
///
/// [UpgradedGift] is returned on completion.
final class GetUpgradedGift extends TdFunction {
  /// **GetUpgradedGift** *(getUpgradedGift)* - TDLib function
  ///
  /// Returns information about an upgraded gift by its name.
  ///
  /// * [name]: Unique name of the upgraded gift.
  ///
  /// [UpgradedGift] is returned on completion.
  const GetUpgradedGift({
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
  GetUpgradedGift copyWith({
    String? name,
  }) =>
      GetUpgradedGift(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
