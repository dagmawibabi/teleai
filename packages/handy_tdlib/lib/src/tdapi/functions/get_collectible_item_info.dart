part of '../tdapi.dart';

/// **GetCollectibleItemInfo** *(getCollectibleItemInfo)* - TDLib function
///
/// Returns information about a given collectible item that was purchased at https://fragment.com.
///
/// * [type]: Type of the collectible item. The item must be used by a user and must be visible to the current user.
///
/// [CollectibleItemInfo] is returned on completion.
final class GetCollectibleItemInfo extends TdFunction {
  /// **GetCollectibleItemInfo** *(getCollectibleItemInfo)* - TDLib function
  ///
  /// Returns information about a given collectible item that was purchased at https://fragment.com.
  ///
  /// * [type]: Type of the collectible item. The item must be used by a user and must be visible to the current user.
  ///
  /// [CollectibleItemInfo] is returned on completion.
  const GetCollectibleItemInfo({
    required this.type,
  });

  /// Type of the collectible item. The item must be used by a user and must be visible to the current user
  final CollectibleItemType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the collectible item. The item must be used by a user and must be visible to the current user
  GetCollectibleItemInfo copyWith({
    CollectibleItemType? type,
  }) =>
      GetCollectibleItemInfo(
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCollectibleItemInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
