part of '../tdapi.dart';

/// **ShareUsersWithBot** *(shareUsersWithBot)* - TDLib function
///
/// Shares users after pressing a keyboardButtonTypeRequestUsers or keyboardButtonTypeRequestManagedBot button with the bot.
///
/// * [source]: Source of the button.
/// * [buttonId]: Identifier of the button.
/// * [sharedUserIds]: Identifiers of the shared users.
/// * [onlyCheck]: Pass true to check that the users can be shared by the button instead of actually sharing them.
///
/// [Ok] is returned on completion.
final class ShareUsersWithBot extends TdFunction {
  /// **ShareUsersWithBot** *(shareUsersWithBot)* - TDLib function
  ///
  /// Shares users after pressing a keyboardButtonTypeRequestUsers or keyboardButtonTypeRequestManagedBot button with the bot.
  ///
  /// * [source]: Source of the button.
  /// * [buttonId]: Identifier of the button.
  /// * [sharedUserIds]: Identifiers of the shared users.
  /// * [onlyCheck]: Pass true to check that the users can be shared by the button instead of actually sharing them.
  ///
  /// [Ok] is returned on completion.
  const ShareUsersWithBot({
    required this.source,
    required this.buttonId,
    required this.sharedUserIds,
    required this.onlyCheck,
  });

  /// Source of the button
  final KeyboardButtonSource source;

  /// Identifier of the button
  final int buttonId;

  /// Identifiers of the shared users
  final List<int> sharedUserIds;

  /// Pass true to check that the users can be shared by the button instead of actually sharing them
  final bool onlyCheck;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "source": source.toJson(),
      "button_id": buttonId,
      "shared_user_ids": sharedUserIds.map((i) => i).toList(),
      "only_check": onlyCheck,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [source]: Source of the button
  /// * [button_id]: Identifier of the button
  /// * [shared_user_ids]: Identifiers of the shared users
  /// * [only_check]: Pass true to check that the users can be shared by the button instead of actually sharing them
  ShareUsersWithBot copyWith({
    KeyboardButtonSource? source,
    int? buttonId,
    List<int>? sharedUserIds,
    bool? onlyCheck,
  }) =>
      ShareUsersWithBot(
        source: source ?? this.source,
        buttonId: buttonId ?? this.buttonId,
        sharedUserIds: sharedUserIds ?? this.sharedUserIds,
        onlyCheck: onlyCheck ?? this.onlyCheck,
      );

  /// TDLib object type
  static const String defaultObjectId = 'shareUsersWithBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
