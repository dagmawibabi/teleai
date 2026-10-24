part of '../tdapi.dart';

/// **RecommendedChatFolders** *(recommendedChatFolders)* - basic class
///
/// Contains a list of recommended chat folders.
///
/// * [chatFolders]: List of recommended chat folders.
final class RecommendedChatFolders extends TdObject {
  /// **RecommendedChatFolders** *(recommendedChatFolders)* - basic class
  ///
  /// Contains a list of recommended chat folders.
  ///
  /// * [chatFolders]: List of recommended chat folders.
  const RecommendedChatFolders({
    required this.chatFolders,
    this.extra,
    this.clientId,
  });

  /// List of recommended chat folders
  final List<RecommendedChatFolder> chatFolders;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory RecommendedChatFolders.fromJson(Map<String, dynamic> json) =>
      RecommendedChatFolders(
        chatFolders: List<RecommendedChatFolder>.from(
            (json['chat_folders'] ?? [])
                .map((item) => RecommendedChatFolder.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_folders": chatFolders.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folders]: List of recommended chat folders
  RecommendedChatFolders copyWith({
    List<RecommendedChatFolder>? chatFolders,
    dynamic extra,
    int? clientId,
  }) =>
      RecommendedChatFolders(
        chatFolders: chatFolders ?? this.chatFolders,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'recommendedChatFolders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
