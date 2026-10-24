part of '../tdapi.dart';

/// **ChatFolderInfo** *(chatFolderInfo)* - basic class
///
/// Contains basic information about a chat folder.
///
/// * [id]: Unique chat folder identifier.
/// * [name]: The name of the folder.
/// * [icon]: The chosen or default icon for the chat folder.
/// * [colorId]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled.
/// * [isShareable]: True, if at least one link has been created for the folder.
/// * [hasMyInviteLinks]: True, if the chat folder has invite links created by the current user.
final class ChatFolderInfo extends TdObject {
  /// **ChatFolderInfo** *(chatFolderInfo)* - basic class
  ///
  /// Contains basic information about a chat folder.
  ///
  /// * [id]: Unique chat folder identifier.
  /// * [name]: The name of the folder.
  /// * [icon]: The chosen or default icon for the chat folder.
  /// * [colorId]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled.
  /// * [isShareable]: True, if at least one link has been created for the folder.
  /// * [hasMyInviteLinks]: True, if the chat folder has invite links created by the current user.
  const ChatFolderInfo({
    required this.id,
    required this.name,
    required this.icon,
    required this.colorId,
    required this.isShareable,
    required this.hasMyInviteLinks,
    this.extra,
    this.clientId,
  });

  /// Unique chat folder identifier
  final int id;

  /// The name of the folder
  final ChatFolderName name;

  /// The chosen or default icon for the chat folder
  final ChatFolderIcon icon;

  /// The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled
  final int colorId;

  /// True, if at least one link has been created for the folder
  final bool isShareable;

  /// True, if the chat folder has invite links created by the current user
  final bool hasMyInviteLinks;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatFolderInfo.fromJson(Map<String, dynamic> json) => ChatFolderInfo(
        id: json['id'],
        name: ChatFolderName.fromJson(json['name']),
        icon: ChatFolderIcon.fromJson(json['icon']),
        colorId: json['color_id'],
        isShareable: json['is_shareable'],
        hasMyInviteLinks: json['has_my_invite_links'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name.toJson(),
      "icon": icon.toJson(),
      "color_id": colorId,
      "is_shareable": isShareable,
      "has_my_invite_links": hasMyInviteLinks,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique chat folder identifier
  /// * [name]: The name of the folder
  /// * [icon]: The chosen or default icon for the chat folder
  /// * [color_id]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled
  /// * [is_shareable]: True, if at least one link has been created for the folder
  /// * [has_my_invite_links]: True, if the chat folder has invite links created by the current user
  ChatFolderInfo copyWith({
    int? id,
    ChatFolderName? name,
    ChatFolderIcon? icon,
    int? colorId,
    bool? isShareable,
    bool? hasMyInviteLinks,
    dynamic extra,
    int? clientId,
  }) =>
      ChatFolderInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        colorId: colorId ?? this.colorId,
        isShareable: isShareable ?? this.isShareable,
        hasMyInviteLinks: hasMyInviteLinks ?? this.hasMyInviteLinks,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
