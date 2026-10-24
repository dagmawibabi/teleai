part of '../tdapi.dart';

/// **TonWalletTransferReceiver** *(tonWalletTransferReceiver)* - parent
///
/// Represents expected receiver of a TON wallet transfer.
sealed class TonWalletTransferReceiver extends TdObject {
  /// **TonWalletTransferReceiver** *(tonWalletTransferReceiver)* - parent
  ///
  /// Represents expected receiver of a TON wallet transfer.
  const TonWalletTransferReceiver();

  /// a TonWalletTransferReceiver return type can be :
  /// * [TonWalletTransferReceiverUser]
  /// * [TonWalletTransferReceiverAddress]
  factory TonWalletTransferReceiver.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonWalletTransferReceiverUser.defaultObjectId:
        return TonWalletTransferReceiverUser.fromJson(json);
      case TonWalletTransferReceiverAddress.defaultObjectId:
        return TonWalletTransferReceiverAddress.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonWalletTransferReceiver)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonWalletTransferReceiver copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransferReceiver';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransferReceiverUser** *(tonWalletTransferReceiverUser)* - child of TonWalletTransferReceiver
///
/// The receiver is specified by its username.
///
/// * [username]: Username of the user. Use searchPublicChat to find the user, check that it is a regular user,. and then use createUserTonWallet to get information about the user's TON wallet.
final class TonWalletTransferReceiverUser extends TonWalletTransferReceiver {
  /// **TonWalletTransferReceiverUser** *(tonWalletTransferReceiverUser)* - child of TonWalletTransferReceiver
  ///
  /// The receiver is specified by its username.
  ///
  /// * [username]: Username of the user. Use searchPublicChat to find the user, check that it is a regular user,. and then use createUserTonWallet to get information about the user's TON wallet.
  const TonWalletTransferReceiverUser({
    required this.username,
  });

  /// Username of the user. Use searchPublicChat to find the user, check that it is a regular user,. and then use createUserTonWallet to get information about the user's TON wallet
  final String username;

  /// Parse from a json
  factory TonWalletTransferReceiverUser.fromJson(Map<String, dynamic> json) =>
      TonWalletTransferReceiverUser(
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
  /// * [username]: Username of the user. Use searchPublicChat to find the user, check that it is a regular user,. and then use createUserTonWallet to get information about the user's TON wallet
  @override
  TonWalletTransferReceiverUser copyWith({
    String? username,
  }) =>
      TonWalletTransferReceiverUser(
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransferReceiverUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonWalletTransferReceiverAddress** *(tonWalletTransferReceiverAddress)* - child of TonWalletTransferReceiver
///
/// The receiver is specified by its address.
///
/// * [address]: Address of the receiver. Use getAddressTonWallet to get information about the user's TON wallet.
final class TonWalletTransferReceiverAddress extends TonWalletTransferReceiver {
  /// **TonWalletTransferReceiverAddress** *(tonWalletTransferReceiverAddress)* - child of TonWalletTransferReceiver
  ///
  /// The receiver is specified by its address.
  ///
  /// * [address]: Address of the receiver. Use getAddressTonWallet to get information about the user's TON wallet.
  const TonWalletTransferReceiverAddress({
    required this.address,
  });

  /// Address of the receiver. Use getAddressTonWallet to get information about the user's TON wallet
  final String address;

  /// Parse from a json
  factory TonWalletTransferReceiverAddress.fromJson(
          Map<String, dynamic> json) =>
      TonWalletTransferReceiverAddress(
        address: json['address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "address": address,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: Address of the receiver. Use getAddressTonWallet to get information about the user's TON wallet
  @override
  TonWalletTransferReceiverAddress copyWith({
    String? address,
  }) =>
      TonWalletTransferReceiverAddress(
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransferReceiverAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
