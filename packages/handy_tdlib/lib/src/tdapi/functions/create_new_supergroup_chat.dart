part of '../tdapi.dart';

/// **CreateNewSupergroupChat** *(createNewSupergroupChat)* - TDLib function
///
/// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat.
///
/// * [title]: Title of the new chat; 1-128 characters.
/// * [isForum]: Pass true to create a forum supergroup chat.
/// * [isChannel]: Pass true to create a channel chat; ignored if a forum is created.
/// * [description]: Chat description; 0-255 characters.
/// * [location]: Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat *(optional)*.
/// * [messageAutoDeleteTime]: Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
/// * [forImport]: Pass true to create a supergroup for importing messages using importMessages.
///
/// [Chat] is returned on completion.
final class CreateNewSupergroupChat extends TdFunction {
  /// **CreateNewSupergroupChat** *(createNewSupergroupChat)* - TDLib function
  ///
  /// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat.
  ///
  /// * [title]: Title of the new chat; 1-128 characters.
  /// * [isForum]: Pass true to create a forum supergroup chat.
  /// * [isChannel]: Pass true to create a channel chat; ignored if a forum is created.
  /// * [description]: Chat description; 0-255 characters.
  /// * [location]: Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat *(optional)*.
  /// * [messageAutoDeleteTime]: Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
  /// * [forImport]: Pass true to create a supergroup for importing messages using importMessages.
  ///
  /// [Chat] is returned on completion.
  const CreateNewSupergroupChat({
    required this.title,
    required this.isForum,
    required this.isChannel,
    required this.description,
    this.location,
    required this.messageAutoDeleteTime,
    required this.forImport,
  });

  /// Title of the new chat; 1-128 characters
  final String title;

  /// Pass true to create a forum supergroup chat
  final bool isForum;

  /// Pass true to create a channel chat; ignored if a forum is created
  final bool isChannel;

  /// Chat description; 0-255 characters
  final String description;

  /// Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
  final ChatLocation? location;

  /// Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  final int messageAutoDeleteTime;

  /// Pass true to create a supergroup for importing messages using importMessages
  final bool forImport;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "title": title,
      "is_forum": isForum,
      "is_channel": isChannel,
      "description": description,
      "location": location?.toJson(),
      "message_auto_delete_time": messageAutoDeleteTime,
      "for_import": forImport,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the new chat; 1-128 characters
  /// * [is_forum]: Pass true to create a forum supergroup chat
  /// * [is_channel]: Pass true to create a channel chat; ignored if a forum is created
  /// * [description]: Chat description; 0-255 characters
  /// * [location]: Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
  /// * [message_auto_delete_time]: Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  /// * [for_import]: Pass true to create a supergroup for importing messages using importMessages
  CreateNewSupergroupChat copyWith({
    String? title,
    bool? isForum,
    bool? isChannel,
    String? description,
    ChatLocation? location,
    int? messageAutoDeleteTime,
    bool? forImport,
  }) =>
      CreateNewSupergroupChat(
        title: title ?? this.title,
        isForum: isForum ?? this.isForum,
        isChannel: isChannel ?? this.isChannel,
        description: description ?? this.description,
        location: location ?? this.location,
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
        forImport: forImport ?? this.forImport,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createNewSupergroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
