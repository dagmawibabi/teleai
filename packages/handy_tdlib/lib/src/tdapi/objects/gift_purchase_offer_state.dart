part of '../tdapi.dart';

/// **GiftPurchaseOfferState** *(giftPurchaseOfferState)* - parent
///
/// Describes state of a gift purchase offer.
sealed class GiftPurchaseOfferState extends TdObject {
  /// **GiftPurchaseOfferState** *(giftPurchaseOfferState)* - parent
  ///
  /// Describes state of a gift purchase offer.
  const GiftPurchaseOfferState();

  /// a GiftPurchaseOfferState return type can be :
  /// * [GiftPurchaseOfferStatePending]
  /// * [GiftPurchaseOfferStateAccepted]
  /// * [GiftPurchaseOfferStateRejected]
  factory GiftPurchaseOfferState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiftPurchaseOfferStatePending.defaultObjectId:
        return GiftPurchaseOfferStatePending.fromJson(json);
      case GiftPurchaseOfferStateAccepted.defaultObjectId:
        return GiftPurchaseOfferStateAccepted.fromJson(json);
      case GiftPurchaseOfferStateRejected.defaultObjectId:
        return GiftPurchaseOfferStateRejected.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiftPurchaseOfferState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiftPurchaseOfferState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giftPurchaseOfferState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftPurchaseOfferStatePending** *(giftPurchaseOfferStatePending)* - child of GiftPurchaseOfferState
///
/// The offer must be accepted or rejected.
final class GiftPurchaseOfferStatePending extends GiftPurchaseOfferState {
  /// **GiftPurchaseOfferStatePending** *(giftPurchaseOfferStatePending)* - child of GiftPurchaseOfferState
  ///
  /// The offer must be accepted or rejected.
  const GiftPurchaseOfferStatePending();

  /// Parse from a json
  factory GiftPurchaseOfferStatePending.fromJson(Map<String, dynamic> json) =>
      const GiftPurchaseOfferStatePending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftPurchaseOfferStatePending copyWith() =>
      const GiftPurchaseOfferStatePending();

  /// TDLib object type
  static const String defaultObjectId = 'giftPurchaseOfferStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftPurchaseOfferStateAccepted** *(giftPurchaseOfferStateAccepted)* - child of GiftPurchaseOfferState
///
/// The offer was accepted.
final class GiftPurchaseOfferStateAccepted extends GiftPurchaseOfferState {
  /// **GiftPurchaseOfferStateAccepted** *(giftPurchaseOfferStateAccepted)* - child of GiftPurchaseOfferState
  ///
  /// The offer was accepted.
  const GiftPurchaseOfferStateAccepted();

  /// Parse from a json
  factory GiftPurchaseOfferStateAccepted.fromJson(Map<String, dynamic> json) =>
      const GiftPurchaseOfferStateAccepted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftPurchaseOfferStateAccepted copyWith() =>
      const GiftPurchaseOfferStateAccepted();

  /// TDLib object type
  static const String defaultObjectId = 'giftPurchaseOfferStateAccepted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftPurchaseOfferStateRejected** *(giftPurchaseOfferStateRejected)* - child of GiftPurchaseOfferState
///
/// The offer was rejected.
final class GiftPurchaseOfferStateRejected extends GiftPurchaseOfferState {
  /// **GiftPurchaseOfferStateRejected** *(giftPurchaseOfferStateRejected)* - child of GiftPurchaseOfferState
  ///
  /// The offer was rejected.
  const GiftPurchaseOfferStateRejected();

  /// Parse from a json
  factory GiftPurchaseOfferStateRejected.fromJson(Map<String, dynamic> json) =>
      const GiftPurchaseOfferStateRejected();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftPurchaseOfferStateRejected copyWith() =>
      const GiftPurchaseOfferStateRejected();

  /// TDLib object type
  static const String defaultObjectId = 'giftPurchaseOfferStateRejected';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
