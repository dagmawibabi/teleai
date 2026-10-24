part of '../tdapi.dart';

/// **CollectibleItemType** *(collectibleItemType)* - parent
///
/// Describes a collectible item that can be purchased at https://fragment.com.
sealed class CollectibleItemType extends TdObject {
  /// **CollectibleItemType** *(collectibleItemType)* - parent
  ///
  /// Describes a collectible item that can be purchased at https://fragment.com.
  const CollectibleItemType();

  /// a CollectibleItemType return type can be :
  /// * [CollectibleItemTypeUsername]
  /// * [CollectibleItemTypePhoneNumber]
  factory CollectibleItemType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CollectibleItemTypeUsername.defaultObjectId:
        return CollectibleItemTypeUsername.fromJson(json);
      case CollectibleItemTypePhoneNumber.defaultObjectId:
        return CollectibleItemTypePhoneNumber.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CollectibleItemType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CollectibleItemType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'collectibleItemType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CollectibleItemTypeUsername** *(collectibleItemTypeUsername)* - child of CollectibleItemType
///
/// A username.
///
/// * [username]: The username.
final class CollectibleItemTypeUsername extends CollectibleItemType {
  /// **CollectibleItemTypeUsername** *(collectibleItemTypeUsername)* - child of CollectibleItemType
  ///
  /// A username.
  ///
  /// * [username]: The username.
  const CollectibleItemTypeUsername({
    required this.username,
  });

  /// The username
  final String username;

  /// Parse from a json
  factory CollectibleItemTypeUsername.fromJson(Map<String, dynamic> json) =>
      CollectibleItemTypeUsername(
        username: json['username'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "username": username,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: The username
  @override
  CollectibleItemTypeUsername copyWith({
    String? username,
  }) =>
      CollectibleItemTypeUsername(
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'collectibleItemTypeUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CollectibleItemTypePhoneNumber** *(collectibleItemTypePhoneNumber)* - child of CollectibleItemType
///
/// A phone number.
///
/// * [phoneNumber]: The phone number.
final class CollectibleItemTypePhoneNumber extends CollectibleItemType {
  /// **CollectibleItemTypePhoneNumber** *(collectibleItemTypePhoneNumber)* - child of CollectibleItemType
  ///
  /// A phone number.
  ///
  /// * [phoneNumber]: The phone number.
  const CollectibleItemTypePhoneNumber({
    required this.phoneNumber,
  });

  /// The phone number
  final String phoneNumber;

  /// Parse from a json
  factory CollectibleItemTypePhoneNumber.fromJson(Map<String, dynamic> json) =>
      CollectibleItemTypePhoneNumber(
        phoneNumber: json['phone_number'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: The phone number
  @override
  CollectibleItemTypePhoneNumber copyWith({
    String? phoneNumber,
  }) =>
      CollectibleItemTypePhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'collectibleItemTypePhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
