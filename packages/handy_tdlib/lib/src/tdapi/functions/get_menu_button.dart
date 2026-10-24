part of '../tdapi.dart';

/// **GetMenuButton** *(getMenuButton)* - TDLib function
///
/// Returns menu button set by the bot for the given user; for bots only.
///
/// * [userId]: Identifier of the user or 0 to get the default menu button.
///
/// [BotMenuButton] is returned on completion.
final class GetMenuButton extends TdFunction {
  /// **GetMenuButton** *(getMenuButton)* - TDLib function
  ///
  /// Returns menu button set by the bot for the given user; for bots only.
  ///
  /// * [userId]: Identifier of the user or 0 to get the default menu button.
  ///
  /// [BotMenuButton] is returned on completion.
  const GetMenuButton({
    required this.userId,
  });

  /// Identifier of the user or 0 to get the default menu button
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
  /// * [user_id]: Identifier of the user or 0 to get the default menu button
  GetMenuButton copyWith({
    int? userId,
  }) =>
      GetMenuButton(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMenuButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
