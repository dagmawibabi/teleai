part of '../tdapi.dart';

/// **SetChatAffiliateProgram** *(setChatAffiliateProgram)* - TDLib function
///
/// Changes affiliate program for a bot.
///
/// * [chatId]: Identifier of the chat with an owned bot for which affiliate program is changed.
/// * [parameters]: Parameters of the affiliate program; pass null to close the currently active program. If there is an active program, then commission and program duration can only be increased.. If the active program is scheduled to be closed, then it can't be changed anymore *(optional)*.
///
/// [Ok] is returned on completion.
final class SetChatAffiliateProgram extends TdFunction {
  /// **SetChatAffiliateProgram** *(setChatAffiliateProgram)* - TDLib function
  ///
  /// Changes affiliate program for a bot.
  ///
  /// * [chatId]: Identifier of the chat with an owned bot for which affiliate program is changed.
  /// * [parameters]: Parameters of the affiliate program; pass null to close the currently active program. If there is an active program, then commission and program duration can only be increased.. If the active program is scheduled to be closed, then it can't be changed anymore *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetChatAffiliateProgram({
    required this.chatId,
    this.parameters,
  });

  /// Identifier of the chat with an owned bot for which affiliate program is changed
  final int chatId;

  /// Parameters of the affiliate program; pass null to close the currently active program. If there is an active program, then commission and program duration can only be increased.. If the active program is scheduled to be closed, then it can't be changed anymore
  final AffiliateProgramParameters? parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "parameters": parameters?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with an owned bot for which affiliate program is changed
  /// * [parameters]: Parameters of the affiliate program; pass null to close the currently active program. If there is an active program, then commission and program duration can only be increased.. If the active program is scheduled to be closed, then it can't be changed anymore
  SetChatAffiliateProgram copyWith({
    int? chatId,
    AffiliateProgramParameters? parameters,
  }) =>
      SetChatAffiliateProgram(
        chatId: chatId ?? this.chatId,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
