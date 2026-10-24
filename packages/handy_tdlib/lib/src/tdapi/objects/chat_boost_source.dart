part of '../tdapi.dart';

/// **ChatBoostSource** *(chatBoostSource)* - parent
///
/// Describes source of a chat boost.
sealed class ChatBoostSource extends TdObject {
  /// **ChatBoostSource** *(chatBoostSource)* - parent
  ///
  /// Describes source of a chat boost.
  const ChatBoostSource();

  /// a ChatBoostSource return type can be :
  /// * [ChatBoostSourceGiftCode]
  /// * [ChatBoostSourceGiveaway]
  /// * [ChatBoostSourcePremium]
  factory ChatBoostSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatBoostSourceGiftCode.defaultObjectId:
        return ChatBoostSourceGiftCode.fromJson(json);
      case ChatBoostSourceGiveaway.defaultObjectId:
        return ChatBoostSourceGiveaway.fromJson(json);
      case ChatBoostSourcePremium.defaultObjectId:
        return ChatBoostSourcePremium.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatBoostSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatBoostSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatBoostSourceGiftCode** *(chatBoostSourceGiftCode)* - child of ChatBoostSource
///
/// The chat created a Telegram Premium gift code for a user.
///
/// * [userId]: Identifier of a user, for which the gift code was created.
/// * [giftCode]: The created Telegram Premium gift code, which is known only if this is a gift code for the current user, or it has already been claimed.
final class ChatBoostSourceGiftCode extends ChatBoostSource {
  /// **ChatBoostSourceGiftCode** *(chatBoostSourceGiftCode)* - child of ChatBoostSource
  ///
  /// The chat created a Telegram Premium gift code for a user.
  ///
  /// * [userId]: Identifier of a user, for which the gift code was created.
  /// * [giftCode]: The created Telegram Premium gift code, which is known only if this is a gift code for the current user, or it has already been claimed.
  const ChatBoostSourceGiftCode({
    required this.userId,
    required this.giftCode,
  });

  /// Identifier of a user, for which the gift code was created
  final int userId;

  /// The created Telegram Premium gift code, which is known only if this is a gift code for the current user, or it has already been claimed
  final String giftCode;

  /// Parse from a json
  factory ChatBoostSourceGiftCode.fromJson(Map<String, dynamic> json) =>
      ChatBoostSourceGiftCode(
        userId: json['user_id'],
        giftCode: json['gift_code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift_code": giftCode,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of a user, for which the gift code was created
  /// * [gift_code]: The created Telegram Premium gift code, which is known only if this is a gift code for the current user, or it has already been claimed
  @override
  ChatBoostSourceGiftCode copyWith({
    int? userId,
    String? giftCode,
  }) =>
      ChatBoostSourceGiftCode(
        userId: userId ?? this.userId,
        giftCode: giftCode ?? this.giftCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSourceGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatBoostSourceGiveaway** *(chatBoostSourceGiveaway)* - child of ChatBoostSource
///
/// The chat created a giveaway.
///
/// * [userId]: Identifier of a user who won in the giveaway; 0 if none.
/// * [giftCode]: The created Telegram Premium gift code if it was used by the user or can be claimed by the current user; an empty string otherwise; for Telegram Premium giveaways only.
/// * [starCount]: Number of Telegram Stars distributed among winners of the giveaway.
/// * [giveawayMessageId]: Identifier of the corresponding giveaway message; can be an identifier of a deleted message.
/// * [isUnclaimed]: True, if the winner for the corresponding giveaway prize wasn't chosen, because there were not enough participants.
final class ChatBoostSourceGiveaway extends ChatBoostSource {
  /// **ChatBoostSourceGiveaway** *(chatBoostSourceGiveaway)* - child of ChatBoostSource
  ///
  /// The chat created a giveaway.
  ///
  /// * [userId]: Identifier of a user who won in the giveaway; 0 if none.
  /// * [giftCode]: The created Telegram Premium gift code if it was used by the user or can be claimed by the current user; an empty string otherwise; for Telegram Premium giveaways only.
  /// * [starCount]: Number of Telegram Stars distributed among winners of the giveaway.
  /// * [giveawayMessageId]: Identifier of the corresponding giveaway message; can be an identifier of a deleted message.
  /// * [isUnclaimed]: True, if the winner for the corresponding giveaway prize wasn't chosen, because there were not enough participants.
  const ChatBoostSourceGiveaway({
    required this.userId,
    required this.giftCode,
    required this.starCount,
    required this.giveawayMessageId,
    required this.isUnclaimed,
  });

  /// Identifier of a user who won in the giveaway; 0 if none
  final int userId;

  /// The created Telegram Premium gift code if it was used by the user or can be claimed by the current user; an empty string otherwise; for Telegram Premium giveaways only
  final String giftCode;

  /// Number of Telegram Stars distributed among winners of the giveaway
  final int starCount;

  /// Identifier of the corresponding giveaway message; can be an identifier of a deleted message
  final int giveawayMessageId;

  /// True, if the winner for the corresponding giveaway prize wasn't chosen, because there were not enough participants
  final bool isUnclaimed;

  /// Parse from a json
  factory ChatBoostSourceGiveaway.fromJson(Map<String, dynamic> json) =>
      ChatBoostSourceGiveaway(
        userId: json['user_id'] ?? 0,
        giftCode: json['gift_code'],
        starCount: json['star_count'],
        giveawayMessageId: json['giveaway_message_id'],
        isUnclaimed: json['is_unclaimed'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift_code": giftCode,
      "star_count": starCount,
      "giveaway_message_id": giveawayMessageId,
      "is_unclaimed": isUnclaimed,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of a user who won in the giveaway; 0 if none
  /// * [gift_code]: The created Telegram Premium gift code if it was used by the user or can be claimed by the current user; an empty string otherwise; for Telegram Premium giveaways only
  /// * [star_count]: Number of Telegram Stars distributed among winners of the giveaway
  /// * [giveaway_message_id]: Identifier of the corresponding giveaway message; can be an identifier of a deleted message
  /// * [is_unclaimed]: True, if the winner for the corresponding giveaway prize wasn't chosen, because there were not enough participants
  @override
  ChatBoostSourceGiveaway copyWith({
    int? userId,
    String? giftCode,
    int? starCount,
    int? giveawayMessageId,
    bool? isUnclaimed,
  }) =>
      ChatBoostSourceGiveaway(
        userId: userId ?? this.userId,
        giftCode: giftCode ?? this.giftCode,
        starCount: starCount ?? this.starCount,
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
        isUnclaimed: isUnclaimed ?? this.isUnclaimed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSourceGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatBoostSourcePremium** *(chatBoostSourcePremium)* - child of ChatBoostSource
///
/// A user with Telegram Premium subscription or gifted Telegram Premium boosted the chat.
///
/// * [userId]: Identifier of the user.
final class ChatBoostSourcePremium extends ChatBoostSource {
  /// **ChatBoostSourcePremium** *(chatBoostSourcePremium)* - child of ChatBoostSource
  ///
  /// A user with Telegram Premium subscription or gifted Telegram Premium boosted the chat.
  ///
  /// * [userId]: Identifier of the user.
  const ChatBoostSourcePremium({
    required this.userId,
  });

  /// Identifier of the user
  final int userId;

  /// Parse from a json
  factory ChatBoostSourcePremium.fromJson(Map<String, dynamic> json) =>
      ChatBoostSourcePremium(
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
  /// * [user_id]: Identifier of the user
  @override
  ChatBoostSourcePremium copyWith({
    int? userId,
  }) =>
      ChatBoostSourcePremium(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSourcePremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
