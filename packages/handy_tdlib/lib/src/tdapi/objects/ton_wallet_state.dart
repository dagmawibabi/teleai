part of '../tdapi.dart';

/// **TonWalletState** *(tonWalletState)* - basic class
///
/// Describes state of the wallet of the current user in the TON blockchain.
///
/// * [address]: Address of the wallet; may be empty if none.
/// * [publicKey]: Public key of the wallet; may be empty if none.
/// * [gramAmount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency.
/// * [isBeingCreated]: True, if the wallet is being created.
/// * [isBackupEnabled]: True, if backup for the wallet key is enabled.
/// * [canEnableBackup]: True, if the user can enable backup for the wallet key.
/// * [canExportPhrase]: True, if the wallet key can be exported using getTonWalletSecretPhrase.
final class TonWalletState extends TdObject {
  /// **TonWalletState** *(tonWalletState)* - basic class
  ///
  /// Describes state of the wallet of the current user in the TON blockchain.
  ///
  /// * [address]: Address of the wallet; may be empty if none.
  /// * [publicKey]: Public key of the wallet; may be empty if none.
  /// * [gramAmount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency.
  /// * [isBeingCreated]: True, if the wallet is being created.
  /// * [isBackupEnabled]: True, if backup for the wallet key is enabled.
  /// * [canEnableBackup]: True, if the user can enable backup for the wallet key.
  /// * [canExportPhrase]: True, if the wallet key can be exported using getTonWalletSecretPhrase.
  const TonWalletState({
    required this.address,
    required this.publicKey,
    required this.gramAmount,
    required this.isBeingCreated,
    required this.isBackupEnabled,
    required this.canEnableBackup,
    required this.canExportPhrase,
  });

  /// Address of the wallet; may be empty if none
  final String address;

  /// Public key of the wallet; may be empty if none
  final String publicKey;

  /// The total amount of owned TON Grams, in the smallest units of the cryptocurrency
  final int gramAmount;

  /// True, if the wallet is being created
  final bool isBeingCreated;

  /// True, if backup for the wallet key is enabled
  final bool isBackupEnabled;

  /// True, if the user can enable backup for the wallet key
  final bool canEnableBackup;

  /// True, if the wallet key can be exported using getTonWalletSecretPhrase
  final bool canExportPhrase;

  /// Parse from a json
  factory TonWalletState.fromJson(Map<String, dynamic> json) => TonWalletState(
        address: json['address'],
        publicKey: json['public_key'],
        gramAmount: json['gram_amount'],
        isBeingCreated: json['is_being_created'],
        isBackupEnabled: json['is_backup_enabled'],
        canEnableBackup: json['can_enable_backup'],
        canExportPhrase: json['can_export_phrase'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "address": address,
      "public_key": publicKey,
      "gram_amount": gramAmount,
      "is_being_created": isBeingCreated,
      "is_backup_enabled": isBackupEnabled,
      "can_enable_backup": canEnableBackup,
      "can_export_phrase": canExportPhrase,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: Address of the wallet; may be empty if none
  /// * [public_key]: Public key of the wallet; may be empty if none
  /// * [gram_amount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency
  /// * [is_being_created]: True, if the wallet is being created
  /// * [is_backup_enabled]: True, if backup for the wallet key is enabled
  /// * [can_enable_backup]: True, if the user can enable backup for the wallet key
  /// * [can_export_phrase]: True, if the wallet key can be exported using getTonWalletSecretPhrase
  TonWalletState copyWith({
    String? address,
    String? publicKey,
    int? gramAmount,
    bool? isBeingCreated,
    bool? isBackupEnabled,
    bool? canEnableBackup,
    bool? canExportPhrase,
  }) =>
      TonWalletState(
        address: address ?? this.address,
        publicKey: publicKey ?? this.publicKey,
        gramAmount: gramAmount ?? this.gramAmount,
        isBeingCreated: isBeingCreated ?? this.isBeingCreated,
        isBackupEnabled: isBackupEnabled ?? this.isBackupEnabled,
        canEnableBackup: canEnableBackup ?? this.canEnableBackup,
        canExportPhrase: canExportPhrase ?? this.canExportPhrase,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
