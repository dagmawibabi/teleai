part of '../tdapi.dart';

/// **InputStoryAreaType** *(inputStoryAreaType)* - parent
///
/// Describes type of clickable area on a story media to be added.
sealed class InputStoryAreaType extends TdObject {
  /// **InputStoryAreaType** *(inputStoryAreaType)* - parent
  ///
  /// Describes type of clickable area on a story media to be added.
  const InputStoryAreaType();

  /// a InputStoryAreaType return type can be :
  /// * [InputStoryAreaTypeLocation]
  /// * [InputStoryAreaTypeFoundVenue]
  /// * [InputStoryAreaTypePreviousVenue]
  /// * [InputStoryAreaTypeSuggestedReaction]
  /// * [InputStoryAreaTypeMessage]
  /// * [InputStoryAreaTypeLink]
  /// * [InputStoryAreaTypeWeather]
  /// * [InputStoryAreaTypeUpgradedGift]
  factory InputStoryAreaType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputStoryAreaTypeLocation.defaultObjectId:
        return InputStoryAreaTypeLocation.fromJson(json);
      case InputStoryAreaTypeFoundVenue.defaultObjectId:
        return InputStoryAreaTypeFoundVenue.fromJson(json);
      case InputStoryAreaTypePreviousVenue.defaultObjectId:
        return InputStoryAreaTypePreviousVenue.fromJson(json);
      case InputStoryAreaTypeSuggestedReaction.defaultObjectId:
        return InputStoryAreaTypeSuggestedReaction.fromJson(json);
      case InputStoryAreaTypeMessage.defaultObjectId:
        return InputStoryAreaTypeMessage.fromJson(json);
      case InputStoryAreaTypeLink.defaultObjectId:
        return InputStoryAreaTypeLink.fromJson(json);
      case InputStoryAreaTypeWeather.defaultObjectId:
        return InputStoryAreaTypeWeather.fromJson(json);
      case InputStoryAreaTypeUpgradedGift.defaultObjectId:
        return InputStoryAreaTypeUpgradedGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputStoryAreaType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputStoryAreaType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeLocation** *(inputStoryAreaTypeLocation)* - child of InputStoryAreaType
///
/// An area pointing to a location.
///
/// * [location]: The location.
/// * [address]: Address of the location; pass null if unknown *(optional)*.
final class InputStoryAreaTypeLocation extends InputStoryAreaType {
  /// **InputStoryAreaTypeLocation** *(inputStoryAreaTypeLocation)* - child of InputStoryAreaType
  ///
  /// An area pointing to a location.
  ///
  /// * [location]: The location.
  /// * [address]: Address of the location; pass null if unknown *(optional)*.
  const InputStoryAreaTypeLocation({
    required this.location,
    this.address,
  });

  /// The location
  final Location location;

  /// Address of the location; pass null if unknown
  final LocationAddress? address;

  /// Parse from a json
  factory InputStoryAreaTypeLocation.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeLocation(
        location: Location.fromJson(json['location']),
        address: json['address'] == null
            ? null
            : LocationAddress.fromJson(json['address']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "address": address?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The location
  /// * [address]: Address of the location; pass null if unknown
  @override
  InputStoryAreaTypeLocation copyWith({
    Location? location,
    LocationAddress? address,
  }) =>
      InputStoryAreaTypeLocation(
        location: location ?? this.location,
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeFoundVenue** *(inputStoryAreaTypeFoundVenue)* - child of InputStoryAreaType
///
/// An area pointing to a venue found by the bot getOption("venue_search_bot_username").
///
/// * [queryId]: Identifier of the inline query, used to find the venue.
/// * [resultId]: Identifier of the inline query result.
final class InputStoryAreaTypeFoundVenue extends InputStoryAreaType {
  /// **InputStoryAreaTypeFoundVenue** *(inputStoryAreaTypeFoundVenue)* - child of InputStoryAreaType
  ///
  /// An area pointing to a venue found by the bot getOption("venue_search_bot_username").
  ///
  /// * [queryId]: Identifier of the inline query, used to find the venue.
  /// * [resultId]: Identifier of the inline query result.
  const InputStoryAreaTypeFoundVenue({
    required this.queryId,
    required this.resultId,
  });

  /// Identifier of the inline query, used to find the venue
  final int queryId;

  /// Identifier of the inline query result
  final String resultId;

  /// Parse from a json
  factory InputStoryAreaTypeFoundVenue.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeFoundVenue(
        queryId: json['query_id'] is int
            ? json['query_id']
            : int.parse(json['query_id']),
        resultId: json['result_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query_id": queryId,
      "result_id": resultId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query_id]: Identifier of the inline query, used to find the venue
  /// * [result_id]: Identifier of the inline query result
  @override
  InputStoryAreaTypeFoundVenue copyWith({
    int? queryId,
    String? resultId,
  }) =>
      InputStoryAreaTypeFoundVenue(
        queryId: queryId ?? this.queryId,
        resultId: resultId ?? this.resultId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeFoundVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypePreviousVenue** *(inputStoryAreaTypePreviousVenue)* - child of InputStoryAreaType
///
/// An area pointing to a venue already added to the story.
///
/// * [venueProvider]: Provider of the venue.
/// * [venueId]: Identifier of the venue in the provider database.
final class InputStoryAreaTypePreviousVenue extends InputStoryAreaType {
  /// **InputStoryAreaTypePreviousVenue** *(inputStoryAreaTypePreviousVenue)* - child of InputStoryAreaType
  ///
  /// An area pointing to a venue already added to the story.
  ///
  /// * [venueProvider]: Provider of the venue.
  /// * [venueId]: Identifier of the venue in the provider database.
  const InputStoryAreaTypePreviousVenue({
    required this.venueProvider,
    required this.venueId,
  });

  /// Provider of the venue
  final String venueProvider;

  /// Identifier of the venue in the provider database
  final String venueId;

  /// Parse from a json
  factory InputStoryAreaTypePreviousVenue.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypePreviousVenue(
        venueProvider: json['venue_provider'],
        venueId: json['venue_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "venue_provider": venueProvider,
      "venue_id": venueId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [venue_provider]: Provider of the venue
  /// * [venue_id]: Identifier of the venue in the provider database
  @override
  InputStoryAreaTypePreviousVenue copyWith({
    String? venueProvider,
    String? venueId,
  }) =>
      InputStoryAreaTypePreviousVenue(
        venueProvider: venueProvider ?? this.venueProvider,
        venueId: venueId ?? this.venueId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypePreviousVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeSuggestedReaction** *(inputStoryAreaTypeSuggestedReaction)* - child of InputStoryAreaType
///
/// An area pointing to a suggested reaction.
///
/// * [reactionType]: Type of the reaction.
/// * [isDark]: True, if reaction has a dark background.
/// * [isFlipped]: True, if reaction corner is flipped.
final class InputStoryAreaTypeSuggestedReaction extends InputStoryAreaType {
  /// **InputStoryAreaTypeSuggestedReaction** *(inputStoryAreaTypeSuggestedReaction)* - child of InputStoryAreaType
  ///
  /// An area pointing to a suggested reaction.
  ///
  /// * [reactionType]: Type of the reaction.
  /// * [isDark]: True, if reaction has a dark background.
  /// * [isFlipped]: True, if reaction corner is flipped.
  const InputStoryAreaTypeSuggestedReaction({
    required this.reactionType,
    required this.isDark,
    required this.isFlipped,
  });

  /// Type of the reaction
  final ReactionType reactionType;

  /// True, if reaction has a dark background
  final bool isDark;

  /// True, if reaction corner is flipped
  final bool isFlipped;

  /// Parse from a json
  factory InputStoryAreaTypeSuggestedReaction.fromJson(
          Map<String, dynamic> json) =>
      InputStoryAreaTypeSuggestedReaction(
        reactionType: ReactionType.fromJson(json['reaction_type']),
        isDark: json['is_dark'],
        isFlipped: json['is_flipped'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reaction_type": reactionType.toJson(),
      "is_dark": isDark,
      "is_flipped": isFlipped,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reaction_type]: Type of the reaction
  /// * [is_dark]: True, if reaction has a dark background
  /// * [is_flipped]: True, if reaction corner is flipped
  @override
  InputStoryAreaTypeSuggestedReaction copyWith({
    ReactionType? reactionType,
    bool? isDark,
    bool? isFlipped,
  }) =>
      InputStoryAreaTypeSuggestedReaction(
        reactionType: reactionType ?? this.reactionType,
        isDark: isDark ?? this.isDark,
        isFlipped: isFlipped ?? this.isFlipped,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeSuggestedReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeMessage** *(inputStoryAreaTypeMessage)* - child of InputStoryAreaType
///
/// An area pointing to a message.
///
/// * [chatId]: Identifier of the chat with the message. Currently, the chat must be a supergroup or a channel chat.
/// * [messageId]: Identifier of the message. Use messageProperties.can_be_shared_in_story to check whether the message is suitable.
final class InputStoryAreaTypeMessage extends InputStoryAreaType {
  /// **InputStoryAreaTypeMessage** *(inputStoryAreaTypeMessage)* - child of InputStoryAreaType
  ///
  /// An area pointing to a message.
  ///
  /// * [chatId]: Identifier of the chat with the message. Currently, the chat must be a supergroup or a channel chat.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_be_shared_in_story to check whether the message is suitable.
  const InputStoryAreaTypeMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message. Currently, the chat must be a supergroup or a channel chat
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_be_shared_in_story to check whether the message is suitable
  final int messageId;

  /// Parse from a json
  factory InputStoryAreaTypeMessage.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message. Currently, the chat must be a supergroup or a channel chat
  /// * [message_id]: Identifier of the message. Use messageProperties.can_be_shared_in_story to check whether the message is suitable
  @override
  InputStoryAreaTypeMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      InputStoryAreaTypeMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeLink** *(inputStoryAreaTypeLink)* - child of InputStoryAreaType
///
/// An area pointing to an HTTP or tg:// link.
///
/// * [url]: HTTP or tg:// URL to be opened when the area is clicked.
final class InputStoryAreaTypeLink extends InputStoryAreaType {
  /// **InputStoryAreaTypeLink** *(inputStoryAreaTypeLink)* - child of InputStoryAreaType
  ///
  /// An area pointing to an HTTP or tg:// link.
  ///
  /// * [url]: HTTP or tg:// URL to be opened when the area is clicked.
  const InputStoryAreaTypeLink({
    required this.url,
  });

  /// HTTP or tg:// URL to be opened when the area is clicked
  final String url;

  /// Parse from a json
  factory InputStoryAreaTypeLink.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeLink(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: HTTP or tg:// URL to be opened when the area is clicked
  @override
  InputStoryAreaTypeLink copyWith({
    String? url,
  }) =>
      InputStoryAreaTypeLink(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeWeather** *(inputStoryAreaTypeWeather)* - child of InputStoryAreaType
///
/// An area with information about weather.
///
/// * [temperature]: Temperature, in degree Celsius.
/// * [emoji]: Emoji representing the weather.
/// * [backgroundColor]: A color of the area background in the ARGB format.
final class InputStoryAreaTypeWeather extends InputStoryAreaType {
  /// **InputStoryAreaTypeWeather** *(inputStoryAreaTypeWeather)* - child of InputStoryAreaType
  ///
  /// An area with information about weather.
  ///
  /// * [temperature]: Temperature, in degree Celsius.
  /// * [emoji]: Emoji representing the weather.
  /// * [backgroundColor]: A color of the area background in the ARGB format.
  const InputStoryAreaTypeWeather({
    required this.temperature,
    required this.emoji,
    required this.backgroundColor,
  });

  /// Temperature, in degree Celsius
  final double temperature;

  /// Emoji representing the weather
  final String emoji;

  /// A color of the area background in the ARGB format
  final int backgroundColor;

  /// Parse from a json
  factory InputStoryAreaTypeWeather.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeWeather(
        temperature: json['temperature'],
        emoji: json['emoji'],
        backgroundColor: json['background_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "temperature": temperature,
      "emoji": emoji,
      "background_color": backgroundColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [temperature]: Temperature, in degree Celsius
  /// * [emoji]: Emoji representing the weather
  /// * [background_color]: A color of the area background in the ARGB format
  @override
  InputStoryAreaTypeWeather copyWith({
    double? temperature,
    String? emoji,
    int? backgroundColor,
  }) =>
      InputStoryAreaTypeWeather(
        temperature: temperature ?? this.temperature,
        emoji: emoji ?? this.emoji,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeWeather';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryAreaTypeUpgradedGift** *(inputStoryAreaTypeUpgradedGift)* - child of InputStoryAreaType
///
/// An area with an upgraded gift.
///
/// * [giftName]: Unique name of the upgraded gift.
final class InputStoryAreaTypeUpgradedGift extends InputStoryAreaType {
  /// **InputStoryAreaTypeUpgradedGift** *(inputStoryAreaTypeUpgradedGift)* - child of InputStoryAreaType
  ///
  /// An area with an upgraded gift.
  ///
  /// * [giftName]: Unique name of the upgraded gift.
  const InputStoryAreaTypeUpgradedGift({
    required this.giftName,
  });

  /// Unique name of the upgraded gift
  final String giftName;

  /// Parse from a json
  factory InputStoryAreaTypeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      InputStoryAreaTypeUpgradedGift(
        giftName: json['gift_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift_name": giftName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_name]: Unique name of the upgraded gift
  @override
  InputStoryAreaTypeUpgradedGift copyWith({
    String? giftName,
  }) =>
      InputStoryAreaTypeUpgradedGift(
        giftName: giftName ?? this.giftName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryAreaTypeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
