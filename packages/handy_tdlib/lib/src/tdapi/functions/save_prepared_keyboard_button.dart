part of '../tdapi.dart';

/// **SavePreparedKeyboardButton** *(savePreparedKeyboardButton)* - TDLib function
///
/// Saves a keyboard button to be shown to the given user; for bots only.
///
/// * [userId]: Identifier of the user.
/// * [button]: The button; must be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot.
///
/// [Text] is returned on completion.
final class SavePreparedKeyboardButton extends TdFunction {
  /// **SavePreparedKeyboardButton** *(savePreparedKeyboardButton)* - TDLib function
  ///
  /// Saves a keyboard button to be shown to the given user; for bots only.
  ///
  /// * [userId]: Identifier of the user.
  /// * [button]: The button; must be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot.
  ///
  /// [Text] is returned on completion.
  const SavePreparedKeyboardButton({
    required this.userId,
    required this.button,
  });

  /// Identifier of the user
  final int userId;

  /// The button; must be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot
  final KeyboardButton button;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "button": button.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [button]: The button; must be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot
  SavePreparedKeyboardButton copyWith({
    int? userId,
    KeyboardButton? button,
  }) =>
      SavePreparedKeyboardButton(
        userId: userId ?? this.userId,
        button: button ?? this.button,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savePreparedKeyboardButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
