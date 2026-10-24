part of '../tdapi.dart';

/// **RecommendedChatFolder** *(recommendedChatFolder)* - basic class
///
/// Describes a recommended chat folder.
///
/// * [folder]: The chat folder.
/// * [description]: Chat folder description.
final class RecommendedChatFolder extends TdObject {
  /// **RecommendedChatFolder** *(recommendedChatFolder)* - basic class
  ///
  /// Describes a recommended chat folder.
  ///
  /// * [folder]: The chat folder.
  /// * [description]: Chat folder description.
  const RecommendedChatFolder({
    required this.folder,
    required this.description,
  });

  /// The chat folder
  final ChatFolder folder;

  /// Chat folder description
  final String description;

  /// Parse from a json
  factory RecommendedChatFolder.fromJson(Map<String, dynamic> json) =>
      RecommendedChatFolder(
        folder: ChatFolder.fromJson(json['folder']),
        description: json['description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "folder": folder.toJson(),
      "description": description,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [folder]: The chat folder
  /// * [description]: Chat folder description
  RecommendedChatFolder copyWith({
    ChatFolder? folder,
    String? description,
  }) =>
      RecommendedChatFolder(
        folder: folder ?? this.folder,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'recommendedChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
