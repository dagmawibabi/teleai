part of '../tdapi.dart';

/// **BotCommand** *(botCommand)* - basic class
///
/// Represents a command supported by a bot.
///
/// * [command]: Text of the bot command.
/// * [description]: Description of the bot command.
/// * [isEphemeral]: True, if the command must send an ephemeral message instead of a regular one.
final class BotCommand extends TdObject {
  /// **BotCommand** *(botCommand)* - basic class
  ///
  /// Represents a command supported by a bot.
  ///
  /// * [command]: Text of the bot command.
  /// * [description]: Description of the bot command.
  /// * [isEphemeral]: True, if the command must send an ephemeral message instead of a regular one.
  const BotCommand({
    required this.command,
    required this.description,
    required this.isEphemeral,
  });

  /// Text of the bot command
  final String command;

  /// Description of the bot command
  final String description;

  /// True, if the command must send an ephemeral message instead of a regular one
  final bool isEphemeral;

  /// Parse from a json
  factory BotCommand.fromJson(Map<String, dynamic> json) => BotCommand(
        command: json['command'],
        description: json['description'],
        isEphemeral: json['is_ephemeral'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "command": command,
      "description": description,
      "is_ephemeral": isEphemeral,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [command]: Text of the bot command
  /// * [description]: Description of the bot command
  /// * [is_ephemeral]: True, if the command must send an ephemeral message instead of a regular one
  BotCommand copyWith({
    String? command,
    String? description,
    bool? isEphemeral,
  }) =>
      BotCommand(
        command: command ?? this.command,
        description: description ?? this.description,
        isEphemeral: isEphemeral ?? this.isEphemeral,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botCommand';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
