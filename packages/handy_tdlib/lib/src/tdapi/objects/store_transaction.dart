part of '../tdapi.dart';

/// **StoreTransaction** *(storeTransaction)* - parent
///
/// Describes an in-store transaction.
sealed class StoreTransaction extends TdObject {
  /// **StoreTransaction** *(storeTransaction)* - parent
  ///
  /// Describes an in-store transaction.
  const StoreTransaction();

  /// a StoreTransaction return type can be :
  /// * [StoreTransactionAppStore]
  /// * [StoreTransactionGooglePlay]
  factory StoreTransaction.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoreTransactionAppStore.defaultObjectId:
        return StoreTransactionAppStore.fromJson(json);
      case StoreTransactionGooglePlay.defaultObjectId:
        return StoreTransactionGooglePlay.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoreTransaction)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoreTransaction copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storeTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoreTransactionAppStore** *(storeTransactionAppStore)* - child of StoreTransaction
///
/// A purchase through App Store.
///
/// * [receipt]: App Store receipt.
final class StoreTransactionAppStore extends StoreTransaction {
  /// **StoreTransactionAppStore** *(storeTransactionAppStore)* - child of StoreTransaction
  ///
  /// A purchase through App Store.
  ///
  /// * [receipt]: App Store receipt.
  const StoreTransactionAppStore({
    required this.receipt,
  });

  /// App Store receipt
  final String receipt;

  /// Parse from a json
  factory StoreTransactionAppStore.fromJson(Map<String, dynamic> json) =>
      StoreTransactionAppStore(
        receipt: json['receipt'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "receipt": receipt,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [receipt]: App Store receipt
  @override
  StoreTransactionAppStore copyWith({
    String? receipt,
  }) =>
      StoreTransactionAppStore(
        receipt: receipt ?? this.receipt,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storeTransactionAppStore';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoreTransactionGooglePlay** *(storeTransactionGooglePlay)* - child of StoreTransaction
///
/// A purchase through Google Play.
///
/// * [packageName]: Application package name.
/// * [storeProductId]: Identifier of the purchased store product.
/// * [purchaseToken]: Google Play purchase token.
final class StoreTransactionGooglePlay extends StoreTransaction {
  /// **StoreTransactionGooglePlay** *(storeTransactionGooglePlay)* - child of StoreTransaction
  ///
  /// A purchase through Google Play.
  ///
  /// * [packageName]: Application package name.
  /// * [storeProductId]: Identifier of the purchased store product.
  /// * [purchaseToken]: Google Play purchase token.
  const StoreTransactionGooglePlay({
    required this.packageName,
    required this.storeProductId,
    required this.purchaseToken,
  });

  /// Application package name
  final String packageName;

  /// Identifier of the purchased store product
  final String storeProductId;

  /// Google Play purchase token
  final String purchaseToken;

  /// Parse from a json
  factory StoreTransactionGooglePlay.fromJson(Map<String, dynamic> json) =>
      StoreTransactionGooglePlay(
        packageName: json['package_name'],
        storeProductId: json['store_product_id'],
        purchaseToken: json['purchase_token'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "package_name": packageName,
      "store_product_id": storeProductId,
      "purchase_token": purchaseToken,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [package_name]: Application package name
  /// * [store_product_id]: Identifier of the purchased store product
  /// * [purchase_token]: Google Play purchase token
  @override
  StoreTransactionGooglePlay copyWith({
    String? packageName,
    String? storeProductId,
    String? purchaseToken,
  }) =>
      StoreTransactionGooglePlay(
        packageName: packageName ?? this.packageName,
        storeProductId: storeProductId ?? this.storeProductId,
        purchaseToken: purchaseToken ?? this.purchaseToken,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storeTransactionGooglePlay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
