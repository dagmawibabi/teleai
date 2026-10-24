part of '../tdapi.dart';

/// **TonConnectConnectItem** *(tonConnectConnectItem)* - parent
///
/// Represents a data item to share with a dApp.
sealed class TonConnectConnectItem extends TdObject {
  /// **TonConnectConnectItem** *(tonConnectConnectItem)* - parent
  ///
  /// Represents a data item to share with a dApp.
  const TonConnectConnectItem();

  /// a TonConnectConnectItem return type can be :
  /// * [TonConnectConnectItemAddress]
  /// * [TonConnectConnectItemProof]
  factory TonConnectConnectItem.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonConnectConnectItemAddress.defaultObjectId:
        return TonConnectConnectItemAddress.fromJson(json);
      case TonConnectConnectItemProof.defaultObjectId:
        return TonConnectConnectItemProof.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonConnectConnectItem)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonConnectConnectItem copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectConnectItem';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectConnectItemAddress** *(tonConnectConnectItemAddress)* - child of TonConnectConnectItem
///
/// Address of the wallet.
///
/// * [network]: Stringified TON network global_id (e.g. "-239" for mainnet); may be empty.
final class TonConnectConnectItemAddress extends TonConnectConnectItem {
  /// **TonConnectConnectItemAddress** *(tonConnectConnectItemAddress)* - child of TonConnectConnectItem
  ///
  /// Address of the wallet.
  ///
  /// * [network]: Stringified TON network global_id (e.g. "-239" for mainnet); may be empty.
  const TonConnectConnectItemAddress({
    required this.network,
  });

  /// Stringified TON network global_id (e.g. "-239" for mainnet); may be empty
  final String network;

  /// Parse from a json
  factory TonConnectConnectItemAddress.fromJson(Map<String, dynamic> json) =>
      TonConnectConnectItemAddress(
        network: json['network'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "network": network,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [network]: Stringified TON network global_id (e.g. "-239" for mainnet); may be empty
  @override
  TonConnectConnectItemAddress copyWith({
    String? network,
  }) =>
      TonConnectConnectItemAddress(
        network: network ?? this.network,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectConnectItemAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectConnectItemProof** *(tonConnectConnectItemProof)* - child of TonConnectConnectItem
///
/// Proof of the wallet ownership.
///
/// * [payload]: Payload to be used for the proof (e.g. nonce + expiration timestamp).
final class TonConnectConnectItemProof extends TonConnectConnectItem {
  /// **TonConnectConnectItemProof** *(tonConnectConnectItemProof)* - child of TonConnectConnectItem
  ///
  /// Proof of the wallet ownership.
  ///
  /// * [payload]: Payload to be used for the proof (e.g. nonce + expiration timestamp).
  const TonConnectConnectItemProof({
    required this.payload,
  });

  /// Payload to be used for the proof (e.g. nonce + expiration timestamp)
  final String payload;

  /// Parse from a json
  factory TonConnectConnectItemProof.fromJson(Map<String, dynamic> json) =>
      TonConnectConnectItemProof(
        payload: json['payload'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payload": payload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payload]: Payload to be used for the proof (e.g. nonce + expiration timestamp)
  @override
  TonConnectConnectItemProof copyWith({
    String? payload,
  }) =>
      TonConnectConnectItemProof(
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectConnectItemProof';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
