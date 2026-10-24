part of '../tdapi.dart';

/// **SetMenuButton** *(setMenuButton)* - TDLib function
///
/// Sets menu button for the given user or for all users; for bots only.
///
/// * [userId]: Identifier of the user or 0 to set menu button for all users.
/// * [menuButton]: New menu button.
///
/// [Ok] is returned on completion.
final class SetMenuButton extends TdFunction {
  /// **SetMenuButton** *(setMenuButton)* - TDLib function
  ///
  /// Sets menu button for the given user or for all users; for bots only.
  ///
  /// * [userId]: Identifier of the user or 0 to set menu button for all users.
  /// * [menuButton]: New menu button.
  ///
  /// [Ok] is returned on completion.
  const SetMenuButton({
    required this.userId,
    required this.menuButton,
  });

  /// Identifier of the user or 0 to set menu button for all users
  final int userId;

  /// New menu button
  final BotMenuButton menuButton;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "menu_button": menuButton.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user or 0 to set menu button for all users
  /// * [menu_button]: New menu button
  SetMenuButton copyWith({
    int? userId,
    BotMenuButton? menuButton,
  }) =>
      SetMenuButton(
        userId: userId ?? this.userId,
        menuButton: menuButton ?? this.menuButton,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMenuButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
