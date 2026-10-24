part of '../tdapi.dart';

/// **UpgradedGiftCollectionNames** *(upgradedGiftCollectionNames)* - basic class
///
/// Contains a list of names of upgraded gift collections. The name of the collection of an upgraded gift is the part of upgradedGift.name before the last "-".
///
/// * [names]: The names.
final class UpgradedGiftCollectionNames extends TdObject {
  /// **UpgradedGiftCollectionNames** *(upgradedGiftCollectionNames)* - basic class
  ///
  /// Contains a list of names of upgraded gift collections. The name of the collection of an upgraded gift is the part of upgradedGift.name before the last "-".
  ///
  /// * [names]: The names.
  const UpgradedGiftCollectionNames({
    required this.names,
    this.extra,
    this.clientId,
  });

  /// The names
  final List<String> names;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpgradedGiftCollectionNames.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftCollectionNames(
        names: List<String>.from(
            (json['names'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "names": names.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [names]: The names
  UpgradedGiftCollectionNames copyWith({
    List<String>? names,
    dynamic extra,
    int? clientId,
  }) =>
      UpgradedGiftCollectionNames(
        names: names ?? this.names,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftCollectionNames';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
