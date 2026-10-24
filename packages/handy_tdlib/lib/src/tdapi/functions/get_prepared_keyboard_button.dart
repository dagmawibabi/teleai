part of '../tdapi.dart';

/// **GetPreparedKeyboardButton** *(getPreparedKeyboardButton)* - TDLib function
///
/// Returns a keyboard button prepared by the bot for the user. The button will be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot.
///
/// * [botUserId]: Identifier of the bot that created the button.
/// * [preparedButtonId]: Identifier of the prepared button.
///
/// [KeyboardButton] is returned on completion.
final class GetPreparedKeyboardButton extends TdFunction {
  /// **GetPreparedKeyboardButton** *(getPreparedKeyboardButton)* - TDLib function
  ///
  /// Returns a keyboard button prepared by the bot for the user. The button will be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot.
  ///
  /// * [botUserId]: Identifier of the bot that created the button.
  /// * [preparedButtonId]: Identifier of the prepared button.
  ///
  /// [KeyboardButton] is returned on completion.
  const GetPreparedKeyboardButton({
    required this.botUserId,
    required this.preparedButtonId,
  });

  /// Identifier of the bot that created the button
  final int botUserId;

  /// Identifier of the prepared button
  final String preparedButtonId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "prepared_button_id": preparedButtonId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot that created the button
  /// * [prepared_button_id]: Identifier of the prepared button
  GetPreparedKeyboardButton copyWith({
    int? botUserId,
    String? preparedButtonId,
  }) =>
      GetPreparedKeyboardButton(
        botUserId: botUserId ?? this.botUserId,
        preparedButtonId: preparedButtonId ?? this.preparedButtonId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPreparedKeyboardButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
