part of '../tdapi.dart';

/// **TransactionDirection** *(transactionDirection)* - parent
///
/// Describes direction of transactions in a transaction list.
sealed class TransactionDirection extends TdObject {
  /// **TransactionDirection** *(transactionDirection)* - parent
  ///
  /// Describes direction of transactions in a transaction list.
  const TransactionDirection();

  /// a TransactionDirection return type can be :
  /// * [TransactionDirectionIncoming]
  /// * [TransactionDirectionOutgoing]
  factory TransactionDirection.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TransactionDirectionIncoming.defaultObjectId:
        return TransactionDirectionIncoming.fromJson(json);
      case TransactionDirectionOutgoing.defaultObjectId:
        return TransactionDirectionOutgoing.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TransactionDirection)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TransactionDirection copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'transactionDirection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TransactionDirectionIncoming** *(transactionDirectionIncoming)* - child of TransactionDirection
///
/// The transaction is incoming and increases the amount of owned currency.
final class TransactionDirectionIncoming extends TransactionDirection {
  /// **TransactionDirectionIncoming** *(transactionDirectionIncoming)* - child of TransactionDirection
  ///
  /// The transaction is incoming and increases the amount of owned currency.
  const TransactionDirectionIncoming();

  /// Parse from a json
  factory TransactionDirectionIncoming.fromJson(Map<String, dynamic> json) =>
      const TransactionDirectionIncoming();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TransactionDirectionIncoming copyWith() =>
      const TransactionDirectionIncoming();

  /// TDLib object type
  static const String defaultObjectId = 'transactionDirectionIncoming';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TransactionDirectionOutgoing** *(transactionDirectionOutgoing)* - child of TransactionDirection
///
/// The transaction is outgoing and decreases the amount of owned currency.
final class TransactionDirectionOutgoing extends TransactionDirection {
  /// **TransactionDirectionOutgoing** *(transactionDirectionOutgoing)* - child of TransactionDirection
  ///
  /// The transaction is outgoing and decreases the amount of owned currency.
  const TransactionDirectionOutgoing();

  /// Parse from a json
  factory TransactionDirectionOutgoing.fromJson(Map<String, dynamic> json) =>
      const TransactionDirectionOutgoing();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TransactionDirectionOutgoing copyWith() =>
      const TransactionDirectionOutgoing();

  /// TDLib object type
  static const String defaultObjectId = 'transactionDirectionOutgoing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
