part of '../tdapi.dart';

/// **TonNftAttribute** *(tonNftAttribute)* - basic class
///
/// Represents an attribute of an NFT in the TON blockchain.
///
/// * [traitType]: Trait type.
/// * [value]: Value of the attribute.
final class TonNftAttribute extends TdObject {
  /// **TonNftAttribute** *(tonNftAttribute)* - basic class
  ///
  /// Represents an attribute of an NFT in the TON blockchain.
  ///
  /// * [traitType]: Trait type.
  /// * [value]: Value of the attribute.
  const TonNftAttribute({
    required this.traitType,
    required this.value,
  });

  /// Trait type
  final String traitType;

  /// Value of the attribute
  final String value;

  /// Parse from a json
  factory TonNftAttribute.fromJson(Map<String, dynamic> json) =>
      TonNftAttribute(
        traitType: json['trait_type'],
        value: json['value'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "trait_type": traitType,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [trait_type]: Trait type
  /// * [value]: Value of the attribute
  TonNftAttribute copyWith({
    String? traitType,
    String? value,
  }) =>
      TonNftAttribute(
        traitType: traitType ?? this.traitType,
        value: value ?? this.value,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonNftAttribute';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
