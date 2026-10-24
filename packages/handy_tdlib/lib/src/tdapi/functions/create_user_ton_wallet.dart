part of '../tdapi.dart';

/// **CreateUserTonWallet** *(createUserTonWallet)* - TDLib function
///
/// Creates a TON wallet for the specified regular user; can be used only if getOption("can_use_ton_wallet"). The current user must have positive TON wallet balance.
///
/// * [userId]: Identifier of the user.
///
/// [UserTonWalletAddress] is returned on completion.
final class CreateUserTonWallet extends TdFunction {
  /// **CreateUserTonWallet** *(createUserTonWallet)* - TDLib function
  ///
  /// Creates a TON wallet for the specified regular user; can be used only if getOption("can_use_ton_wallet"). The current user must have positive TON wallet balance.
  ///
  /// * [userId]: Identifier of the user.
  ///
  /// [UserTonWalletAddress] is returned on completion.
  const CreateUserTonWallet({
    required this.userId,
  });

  /// Identifier of the user
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  CreateUserTonWallet copyWith({
    int? userId,
  }) =>
      CreateUserTonWallet(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createUserTonWallet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
