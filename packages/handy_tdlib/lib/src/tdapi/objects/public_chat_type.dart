part of '../tdapi.dart';

/// **PublicChatType** *(publicChatType)* - parent
///
/// Describes type of public chat.
sealed class PublicChatType extends TdObject {
  /// **PublicChatType** *(publicChatType)* - parent
  ///
  /// Describes type of public chat.
  const PublicChatType();

  /// a PublicChatType return type can be :
  /// * [PublicChatTypeHasUsername]
  /// * [PublicChatTypeIsLocationBased]
  factory PublicChatType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PublicChatTypeHasUsername.defaultObjectId:
        return PublicChatTypeHasUsername.fromJson(json);
      case PublicChatTypeIsLocationBased.defaultObjectId:
        return PublicChatTypeIsLocationBased.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PublicChatType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PublicChatType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'publicChatType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PublicChatTypeHasUsername** *(publicChatTypeHasUsername)* - child of PublicChatType
///
/// The chat is public, because it has an active username.
final class PublicChatTypeHasUsername extends PublicChatType {
  /// **PublicChatTypeHasUsername** *(publicChatTypeHasUsername)* - child of PublicChatType
  ///
  /// The chat is public, because it has an active username.
  const PublicChatTypeHasUsername();

  /// Parse from a json
  factory PublicChatTypeHasUsername.fromJson(Map<String, dynamic> json) =>
      const PublicChatTypeHasUsername();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PublicChatTypeHasUsername copyWith() => const PublicChatTypeHasUsername();

  /// TDLib object type
  static const String defaultObjectId = 'publicChatTypeHasUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PublicChatTypeIsLocationBased** *(publicChatTypeIsLocationBased)* - child of PublicChatType
///
/// The chat is public, because it is a location-based supergroup.
final class PublicChatTypeIsLocationBased extends PublicChatType {
  /// **PublicChatTypeIsLocationBased** *(publicChatTypeIsLocationBased)* - child of PublicChatType
  ///
  /// The chat is public, because it is a location-based supergroup.
  const PublicChatTypeIsLocationBased();

  /// Parse from a json
  factory PublicChatTypeIsLocationBased.fromJson(Map<String, dynamic> json) =>
      const PublicChatTypeIsLocationBased();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PublicChatTypeIsLocationBased copyWith() =>
      const PublicChatTypeIsLocationBased();

  /// TDLib object type
  static const String defaultObjectId = 'publicChatTypeIsLocationBased';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
