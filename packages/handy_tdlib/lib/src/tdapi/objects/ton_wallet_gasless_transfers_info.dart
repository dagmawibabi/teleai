part of '../tdapi.dart';

/// **TonWalletGaslessTransfersInfo** *(tonWalletGaslessTransfersInfo)* - basic class
///
/// Represents state of gasless transfers for the current user.
///
/// * [leftCount]: Number of left gasless transfers. The daily available number of gasless transfers is available as getOption("ton_wallet_gasless_transfer_daily_count_max").
/// * [resetDate]: Point in time (Unix timestamp) when the number of left transfers will be reset; 0 if never.
/// * [relayerAddress]: Address of the relayer for gasless transfers; may be empty if unavailable.
final class TonWalletGaslessTransfersInfo extends TdObject {
  /// **TonWalletGaslessTransfersInfo** *(tonWalletGaslessTransfersInfo)* - basic class
  ///
  /// Represents state of gasless transfers for the current user.
  ///
  /// * [leftCount]: Number of left gasless transfers. The daily available number of gasless transfers is available as getOption("ton_wallet_gasless_transfer_daily_count_max").
  /// * [resetDate]: Point in time (Unix timestamp) when the number of left transfers will be reset; 0 if never.
  /// * [relayerAddress]: Address of the relayer for gasless transfers; may be empty if unavailable.
  const TonWalletGaslessTransfersInfo({
    required this.leftCount,
    required this.resetDate,
    required this.relayerAddress,
  });

  /// Number of left gasless transfers. The daily available number of gasless transfers is available as getOption("ton_wallet_gasless_transfer_daily_count_max")
  final int leftCount;

  /// Point in time (Unix timestamp) when the number of left transfers will be reset; 0 if never
  final int resetDate;

  /// Address of the relayer for gasless transfers; may be empty if unavailable
  final String relayerAddress;

  /// Parse from a json
  factory TonWalletGaslessTransfersInfo.fromJson(Map<String, dynamic> json) =>
      TonWalletGaslessTransfersInfo(
        leftCount: json['left_count'],
        resetDate: json['reset_date'],
        relayerAddress: json['relayer_address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "left_count": leftCount,
      "reset_date": resetDate,
      "relayer_address": relayerAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [left_count]: Number of left gasless transfers. The daily available number of gasless transfers is available as getOption("ton_wallet_gasless_transfer_daily_count_max")
  /// * [reset_date]: Point in time (Unix timestamp) when the number of left transfers will be reset; 0 if never
  /// * [relayer_address]: Address of the relayer for gasless transfers; may be empty if unavailable
  TonWalletGaslessTransfersInfo copyWith({
    int? leftCount,
    int? resetDate,
    String? relayerAddress,
  }) =>
      TonWalletGaslessTransfersInfo(
        leftCount: leftCount ?? this.leftCount,
        resetDate: resetDate ?? this.resetDate,
        relayerAddress: relayerAddress ?? this.relayerAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletGaslessTransfersInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
