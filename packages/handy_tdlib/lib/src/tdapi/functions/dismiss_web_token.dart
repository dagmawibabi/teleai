part of '../tdapi.dart';

/// **DismissWebToken** *(dismissWebToken)* - TDLib function
///
/// Dismisses a received web token without consumption; for official Telegram apps only.
///
/// * [token]: The token to dismiss.
///
/// [Ok] is returned on completion.
final class DismissWebToken extends TdFunction {
  /// **DismissWebToken** *(dismissWebToken)* - TDLib function
  ///
  /// Dismisses a received web token without consumption; for official Telegram apps only.
  ///
  /// * [token]: The token to dismiss.
  ///
  /// [Ok] is returned on completion.
  const DismissWebToken({
    required this.token,
  });

  /// The token to dismiss
  final String token;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "token": token,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The token to dismiss
  DismissWebToken copyWith({
    String? token,
  }) =>
      DismissWebToken(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'dismissWebToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
