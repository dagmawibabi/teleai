part of '../tdapi.dart';

/// **CraftGiftResult** *(craftGiftResult)* - parent
///
/// Contains result of gift crafting.
sealed class CraftGiftResult extends TdObject {
  /// **CraftGiftResult** *(craftGiftResult)* - parent
  ///
  /// Contains result of gift crafting.
  const CraftGiftResult();

  /// a CraftGiftResult return type can be :
  /// * [CraftGiftResultSuccess]
  /// * [CraftGiftResultTooEarly]
  /// * [CraftGiftResultInvalidGift]
  /// * [CraftGiftResultFail]
  factory CraftGiftResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CraftGiftResultSuccess.defaultObjectId:
        return CraftGiftResultSuccess.fromJson(json);
      case CraftGiftResultTooEarly.defaultObjectId:
        return CraftGiftResultTooEarly.fromJson(json);
      case CraftGiftResultInvalidGift.defaultObjectId:
        return CraftGiftResultInvalidGift.fromJson(json);
      case CraftGiftResultFail.defaultObjectId:
        return CraftGiftResultFail.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CraftGiftResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CraftGiftResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'craftGiftResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CraftGiftResultSuccess** *(craftGiftResultSuccess)* - child of CraftGiftResult
///
/// Crafting was successful.
///
/// * [gift]: The created gift.
/// * [receivedGiftId]: Unique identifier of the received gift for the current user.
final class CraftGiftResultSuccess extends CraftGiftResult {
  /// **CraftGiftResultSuccess** *(craftGiftResultSuccess)* - child of CraftGiftResult
  ///
  /// Crafting was successful.
  ///
  /// * [gift]: The created gift.
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user.
  const CraftGiftResultSuccess({
    required this.gift,
    required this.receivedGiftId,
    this.extra,
    this.clientId,
  });

  /// The created gift
  final UpgradedGift gift;

  /// Unique identifier of the received gift for the current user
  final String receivedGiftId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CraftGiftResultSuccess.fromJson(Map<String, dynamic> json) =>
      CraftGiftResultSuccess(
        gift: UpgradedGift.fromJson(json['gift']),
        receivedGiftId: json['received_gift_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "received_gift_id": receivedGiftId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The created gift
  /// * [received_gift_id]: Unique identifier of the received gift for the current user
  @override
  CraftGiftResultSuccess copyWith({
    UpgradedGift? gift,
    String? receivedGiftId,
    dynamic extra,
    int? clientId,
  }) =>
      CraftGiftResultSuccess(
        gift: gift ?? this.gift,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'craftGiftResultSuccess';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CraftGiftResultTooEarly** *(craftGiftResultTooEarly)* - child of CraftGiftResult
///
/// Crafting isn't possible because one of the gifts can't be used for crafting yet.
///
/// * [retryAfter]: Time left before the gift can be used for crafting.
final class CraftGiftResultTooEarly extends CraftGiftResult {
  /// **CraftGiftResultTooEarly** *(craftGiftResultTooEarly)* - child of CraftGiftResult
  ///
  /// Crafting isn't possible because one of the gifts can't be used for crafting yet.
  ///
  /// * [retryAfter]: Time left before the gift can be used for crafting.
  const CraftGiftResultTooEarly({
    required this.retryAfter,
    this.extra,
    this.clientId,
  });

  /// Time left before the gift can be used for crafting
  final int retryAfter;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CraftGiftResultTooEarly.fromJson(Map<String, dynamic> json) =>
      CraftGiftResultTooEarly(
        retryAfter: json['retry_after'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "retry_after": retryAfter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [retry_after]: Time left before the gift can be used for crafting
  @override
  CraftGiftResultTooEarly copyWith({
    int? retryAfter,
    dynamic extra,
    int? clientId,
  }) =>
      CraftGiftResultTooEarly(
        retryAfter: retryAfter ?? this.retryAfter,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'craftGiftResultTooEarly';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CraftGiftResultInvalidGift** *(craftGiftResultInvalidGift)* - child of CraftGiftResult
///
/// Crafting isn't possible because one of the gifts isn't suitable for crafting.
final class CraftGiftResultInvalidGift extends CraftGiftResult {
  /// **CraftGiftResultInvalidGift** *(craftGiftResultInvalidGift)* - child of CraftGiftResult
  ///
  /// Crafting isn't possible because one of the gifts isn't suitable for crafting.
  const CraftGiftResultInvalidGift({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CraftGiftResultInvalidGift.fromJson(Map<String, dynamic> json) =>
      CraftGiftResultInvalidGift(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CraftGiftResultInvalidGift copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CraftGiftResultInvalidGift(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'craftGiftResultInvalidGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CraftGiftResultFail** *(craftGiftResultFail)* - child of CraftGiftResult
///
/// Crafting has failed.
final class CraftGiftResultFail extends CraftGiftResult {
  /// **CraftGiftResultFail** *(craftGiftResultFail)* - child of CraftGiftResult
  ///
  /// Crafting has failed.
  const CraftGiftResultFail({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CraftGiftResultFail.fromJson(Map<String, dynamic> json) =>
      CraftGiftResultFail(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CraftGiftResultFail copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CraftGiftResultFail(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'craftGiftResultFail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
