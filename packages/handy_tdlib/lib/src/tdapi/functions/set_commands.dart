part of '../tdapi.dart';

/// **SetCommands** *(setCommands)* - TDLib function
///
/// Sets the list of commands supported by the bot for the given user scope and language; for bots only.
///
/// * [scope]: The scope to which the commands are relevant; pass null to change commands in the default bot command scope *(optional)*.
/// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands.
/// * [commands]: List of the bot's commands.
///
/// [Ok] is returned on completion.
final class SetCommands extends TdFunction {
  /// **SetCommands** *(setCommands)* - TDLib function
  ///
  /// Sets the list of commands supported by the bot for the given user scope and language; for bots only.
  ///
  /// * [scope]: The scope to which the commands are relevant; pass null to change commands in the default bot command scope *(optional)*.
  /// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands.
  /// * [commands]: List of the bot's commands.
  ///
  /// [Ok] is returned on completion.
  const SetCommands({
    this.scope,
    required this.languageCode,
    required this.commands,
  });

  /// The scope to which the commands are relevant; pass null to change commands in the default bot command scope
  final BotCommandScope? scope;

  /// A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
  final String languageCode;

  /// List of the bot's commands
  final List<BotCommand> commands;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "scope": scope?.toJson(),
      "language_code": languageCode,
      "commands": commands.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: The scope to which the commands are relevant; pass null to change commands in the default bot command scope
  /// * [language_code]: A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
  /// * [commands]: List of the bot's commands
  SetCommands copyWith({
    BotCommandScope? scope,
    String? languageCode,
    List<BotCommand>? commands,
  }) =>
      SetCommands(
        scope: scope ?? this.scope,
        languageCode: languageCode ?? this.languageCode,
        commands: commands ?? this.commands,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCommands';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
