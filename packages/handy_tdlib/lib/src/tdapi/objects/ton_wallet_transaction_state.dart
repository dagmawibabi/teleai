part of '../tdapi.dart';

/// **TonWalletTransactionState** *(tonWalletTransactionState)* - parent
///
/// Describes state of a transaction with a TON wallet.
sealed class TonWalletTransactionState extends TdObject {
  /// **TonWalletTransactionState** *(tonWalletTransactionState)* - parent
  ///
  /// Describes state of a transaction with a TON wallet.
  const TonWalletTransactionState();

  /// a TonWalletTransactionState return type can be :
  /// * [TonWalletTransactionStateSucceeded]
  /// * [TonWalletTransactionStateFailed]
  factory TonWalletTransactionState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonWalletTransactionStateSucceeded.defaultObjectId:
        return TonWalletTransactionStateSucceeded.fromJson(json);
      case TonWalletTransactionStateFailed.defaultObjectId:
        return TonWalletTransactionStateFailed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonWalletTransactionState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonWalletTransactionState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionStateSucceeded** *(tonWalletTransactionStateSucceeded)* - child of TonWalletTransactionState
///
/// The transaction succeeded.
///
/// * [txHash]: Hash of the transaction.
final class TonWalletTransactionStateSucceeded
    extends TonWalletTransactionState {
  /// **TonWalletTransactionStateSucceeded** *(tonWalletTransactionStateSucceeded)* - child of TonWalletTransactionState
  ///
  /// The transaction succeeded.
  ///
  /// * [txHash]: Hash of the transaction.
  const TonWalletTransactionStateSucceeded({
    required this.txHash,
  });

  /// Hash of the transaction
  final String txHash;

  /// Parse from a json
  factory TonWalletTransactionStateSucceeded.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransactionStateSucceeded(
        txHash: json['tx_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "tx_hash": txHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tx_hash]: Hash of the transaction
  @override
  TonWalletTransactionStateSucceeded copyWith({
    String? txHash,
  }) =>
      TonWalletTransactionStateSucceeded(
        txHash: txHash ?? this.txHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionStateSucceeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransactionStateFailed** *(tonWalletTransactionStateFailed)* - child of TonWalletTransactionState
///
/// The transaction failed.
final class TonWalletTransactionStateFailed extends TonWalletTransactionState {
  /// **TonWalletTransactionStateFailed** *(tonWalletTransactionStateFailed)* - child of TonWalletTransactionState
  ///
  /// The transaction failed.
  const TonWalletTransactionStateFailed();

  /// Parse from a json
  factory TonWalletTransactionStateFailed.fromJson(Map<String, dynamic> json) =>
      const TonWalletTransactionStateFailed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonWalletTransactionStateFailed copyWith() =>
      const TonWalletTransactionStateFailed();

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactionStateFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
