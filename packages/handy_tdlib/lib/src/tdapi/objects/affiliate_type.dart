part of '../tdapi.dart';

/// **AffiliateType** *(affiliateType)* - parent
///
/// Describes type of affiliate for an affiliate program.
sealed class AffiliateType extends TdObject {
  /// **AffiliateType** *(affiliateType)* - parent
  ///
  /// Describes type of affiliate for an affiliate program.
  const AffiliateType();

  /// a AffiliateType return type can be :
  /// * [AffiliateTypeCurrentUser]
  /// * [AffiliateTypeBot]
  /// * [AffiliateTypeChannel]
  factory AffiliateType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case AffiliateTypeCurrentUser.defaultObjectId:
        return AffiliateTypeCurrentUser.fromJson(json);
      case AffiliateTypeBot.defaultObjectId:
        return AffiliateTypeBot.fromJson(json);
      case AffiliateTypeChannel.defaultObjectId:
        return AffiliateTypeChannel.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of AffiliateType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  AffiliateType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'affiliateType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateTypeCurrentUser** *(affiliateTypeCurrentUser)* - child of AffiliateType
///
/// The affiliate is the current user.
final class AffiliateTypeCurrentUser extends AffiliateType {
  /// **AffiliateTypeCurrentUser** *(affiliateTypeCurrentUser)* - child of AffiliateType
  ///
  /// The affiliate is the current user.
  const AffiliateTypeCurrentUser();

  /// Parse from a json
  factory AffiliateTypeCurrentUser.fromJson(Map<String, dynamic> json) =>
      const AffiliateTypeCurrentUser();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  AffiliateTypeCurrentUser copyWith() => const AffiliateTypeCurrentUser();

  /// TDLib object type
  static const String defaultObjectId = 'affiliateTypeCurrentUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateTypeBot** *(affiliateTypeBot)* - child of AffiliateType
///
/// The affiliate is a bot owned by the current user.
///
/// * [userId]: User identifier of the bot.
final class AffiliateTypeBot extends AffiliateType {
  /// **AffiliateTypeBot** *(affiliateTypeBot)* - child of AffiliateType
  ///
  /// The affiliate is a bot owned by the current user.
  ///
  /// * [userId]: User identifier of the bot.
  const AffiliateTypeBot({
    required this.userId,
  });

  /// User identifier of the bot
  final int userId;

  /// Parse from a json
  factory AffiliateTypeBot.fromJson(Map<String, dynamic> json) =>
      AffiliateTypeBot(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier of the bot
  @override
  AffiliateTypeBot copyWith({
    int? userId,
  }) =>
      AffiliateTypeBot(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'affiliateTypeBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateTypeChannel** *(affiliateTypeChannel)* - child of AffiliateType
///
/// The affiliate is a channel chat where the current user has can_post_messages administrator right.
///
/// * [chatId]: Identifier of the channel chat.
final class AffiliateTypeChannel extends AffiliateType {
  /// **AffiliateTypeChannel** *(affiliateTypeChannel)* - child of AffiliateType
  ///
  /// The affiliate is a channel chat where the current user has can_post_messages administrator right.
  ///
  /// * [chatId]: Identifier of the channel chat.
  const AffiliateTypeChannel({
    required this.chatId,
  });

  /// Identifier of the channel chat
  final int chatId;

  /// Parse from a json
  factory AffiliateTypeChannel.fromJson(Map<String, dynamic> json) =>
      AffiliateTypeChannel(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat
  @override
  AffiliateTypeChannel copyWith({
    int? chatId,
  }) =>
      AffiliateTypeChannel(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'affiliateTypeChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
