part of '../tdapi.dart';

/// **DisplayUpgradedGift** *(displayUpgradedGift)* - TDLib function
///
/// Shows an upgraded gift from the TON wallet of the current user on a profile page or hides it from all profile pages; the gift remains in the wallet.
///
/// * [ownerId]: Identifier of the current user or a channel chat owned by the current user on whose profile page the gift will be shown; pass null to hide the gift from all profile pages *(optional)*.
/// * [name]: Unique name of the upgraded gift.
///
/// [Ok] is returned on completion.
final class DisplayUpgradedGift extends TdFunction {
  /// **DisplayUpgradedGift** *(displayUpgradedGift)* - TDLib function
  ///
  /// Shows an upgraded gift from the TON wallet of the current user on a profile page or hides it from all profile pages; the gift remains in the wallet.
  ///
  /// * [ownerId]: Identifier of the current user or a channel chat owned by the current user on whose profile page the gift will be shown; pass null to hide the gift from all profile pages *(optional)*.
  /// * [name]: Unique name of the upgraded gift.
  ///
  /// [Ok] is returned on completion.
  const DisplayUpgradedGift({
    this.ownerId,
    required this.name,
  });

  /// Identifier of the current user or a channel chat owned by the current user on whose profile page the gift will be shown; pass null to hide the gift from all profile pages
  final MessageSender? ownerId;

  /// Unique name of the upgraded gift
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId?.toJson(),
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the current user or a channel chat owned by the current user on whose profile page the gift will be shown; pass null to hide the gift from all profile pages
  /// * [name]: Unique name of the upgraded gift
  DisplayUpgradedGift copyWith({
    MessageSender? ownerId,
    String? name,
  }) =>
      DisplayUpgradedGift(
        ownerId: ownerId ?? this.ownerId,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'displayUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
