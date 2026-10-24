part of '../tdapi.dart';

/// **GetUserTonWalletAddresses** *(getUserTonWalletAddresses)* - TDLib function
///
/// Returns TON wallet addresses of the specified users; can be used only if getOption("can_use_ton_wallet").
///
/// * [userIds]: Identifiers of the users whose wallet addresses have to be returned. If a user has no TON wallet, it will be skipped in the result.
///
/// [UserTonWalletAddresses] is returned on completion.
final class GetUserTonWalletAddresses extends TdFunction {
  /// **GetUserTonWalletAddresses** *(getUserTonWalletAddresses)* - TDLib function
  ///
  /// Returns TON wallet addresses of the specified users; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [userIds]: Identifiers of the users whose wallet addresses have to be returned. If a user has no TON wallet, it will be skipped in the result.
  ///
  /// [UserTonWalletAddresses] is returned on completion.
  const GetUserTonWalletAddresses({
    required this.userIds,
  });

  /// Identifiers of the users whose wallet addresses have to be returned. If a user has no TON wallet, it will be skipped in the result
  final List<int> userIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_ids": userIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_ids]: Identifiers of the users whose wallet addresses have to be returned. If a user has no TON wallet, it will be skipped in the result
  GetUserTonWalletAddresses copyWith({
    List<int>? userIds,
  }) =>
      GetUserTonWalletAddresses(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserTonWalletAddresses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
