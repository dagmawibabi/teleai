part of '../tdapi.dart';

/// **StoryAreaType** *(storyAreaType)* - parent
///
/// Describes type of clickable area on a story media.
sealed class StoryAreaType extends TdObject {
  /// **StoryAreaType** *(storyAreaType)* - parent
  ///
  /// Describes type of clickable area on a story media.
  const StoryAreaType();

  /// a StoryAreaType return type can be :
  /// * [StoryAreaTypeLocation]
  /// * [StoryAreaTypeVenue]
  /// * [StoryAreaTypeSuggestedReaction]
  /// * [StoryAreaTypeMessage]
  /// * [StoryAreaTypeLink]
  /// * [StoryAreaTypeWeather]
  /// * [StoryAreaTypeUpgradedGift]
  factory StoryAreaType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryAreaTypeLocation.defaultObjectId:
        return StoryAreaTypeLocation.fromJson(json);
      case StoryAreaTypeVenue.defaultObjectId:
        return StoryAreaTypeVenue.fromJson(json);
      case StoryAreaTypeSuggestedReaction.defaultObjectId:
        return StoryAreaTypeSuggestedReaction.fromJson(json);
      case StoryAreaTypeMessage.defaultObjectId:
        return StoryAreaTypeMessage.fromJson(json);
      case StoryAreaTypeLink.defaultObjectId:
        return StoryAreaTypeLink.fromJson(json);
      case StoryAreaTypeWeather.defaultObjectId:
        return StoryAreaTypeWeather.fromJson(json);
      case StoryAreaTypeUpgradedGift.defaultObjectId:
        return StoryAreaTypeUpgradedGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryAreaType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryAreaType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeLocation** *(storyAreaTypeLocation)* - child of StoryAreaType
///
/// An area pointing to a location.
///
/// * [location]: The location.
/// * [address]: Address of the location; may be null if unknown *(optional)*.
final class StoryAreaTypeLocation extends StoryAreaType {
  /// **StoryAreaTypeLocation** *(storyAreaTypeLocation)* - child of StoryAreaType
  ///
  /// An area pointing to a location.
  ///
  /// * [location]: The location.
  /// * [address]: Address of the location; may be null if unknown *(optional)*.
  const StoryAreaTypeLocation({
    required this.location,
    this.address,
  });

  /// The location
  final Location location;

  /// Address of the location; may be null if unknown
  final LocationAddress? address;

  /// Parse from a json
  factory StoryAreaTypeLocation.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeLocation(
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
  /// * [address]: Address of the location; may be null if unknown
  @override
  StoryAreaTypeLocation copyWith({
    Location? location,
    LocationAddress? address,
  }) =>
      StoryAreaTypeLocation(
        location: location ?? this.location,
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeVenue** *(storyAreaTypeVenue)* - child of StoryAreaType
///
/// An area pointing to a venue.
///
/// * [venue]: Information about the venue.
final class StoryAreaTypeVenue extends StoryAreaType {
  /// **StoryAreaTypeVenue** *(storyAreaTypeVenue)* - child of StoryAreaType
  ///
  /// An area pointing to a venue.
  ///
  /// * [venue]: Information about the venue.
  const StoryAreaTypeVenue({
    required this.venue,
  });

  /// Information about the venue
  final Venue venue;

  /// Parse from a json
  factory StoryAreaTypeVenue.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeVenue(
        venue: Venue.fromJson(json['venue']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "venue": venue.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [venue]: Information about the venue
  @override
  StoryAreaTypeVenue copyWith({
    Venue? venue,
  }) =>
      StoryAreaTypeVenue(
        venue: venue ?? this.venue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeSuggestedReaction** *(storyAreaTypeSuggestedReaction)* - child of StoryAreaType
///
/// An area pointing to a suggested reaction. App needs to show a clickable reaction on the area and call setStoryReaction when the area is clicked.
///
/// * [reactionType]: Type of the reaction.
/// * [totalCount]: Number of times the reaction was added.
/// * [isDark]: True, if reaction has a dark background.
/// * [isFlipped]: True, if reaction corner is flipped.
final class StoryAreaTypeSuggestedReaction extends StoryAreaType {
  /// **StoryAreaTypeSuggestedReaction** *(storyAreaTypeSuggestedReaction)* - child of StoryAreaType
  ///
  /// An area pointing to a suggested reaction. App needs to show a clickable reaction on the area and call setStoryReaction when the area is clicked.
  ///
  /// * [reactionType]: Type of the reaction.
  /// * [totalCount]: Number of times the reaction was added.
  /// * [isDark]: True, if reaction has a dark background.
  /// * [isFlipped]: True, if reaction corner is flipped.
  const StoryAreaTypeSuggestedReaction({
    required this.reactionType,
    required this.totalCount,
    required this.isDark,
    required this.isFlipped,
  });

  /// Type of the reaction
  final ReactionType reactionType;

  /// Number of times the reaction was added
  final int totalCount;

  /// True, if reaction has a dark background
  final bool isDark;

  /// True, if reaction corner is flipped
  final bool isFlipped;

  /// Parse from a json
  factory StoryAreaTypeSuggestedReaction.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeSuggestedReaction(
        reactionType: ReactionType.fromJson(json['reaction_type']),
        totalCount: json['total_count'],
        isDark: json['is_dark'],
        isFlipped: json['is_flipped'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reaction_type": reactionType.toJson(),
      "total_count": totalCount,
      "is_dark": isDark,
      "is_flipped": isFlipped,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reaction_type]: Type of the reaction
  /// * [total_count]: Number of times the reaction was added
  /// * [is_dark]: True, if reaction has a dark background
  /// * [is_flipped]: True, if reaction corner is flipped
  @override
  StoryAreaTypeSuggestedReaction copyWith({
    ReactionType? reactionType,
    int? totalCount,
    bool? isDark,
    bool? isFlipped,
  }) =>
      StoryAreaTypeSuggestedReaction(
        reactionType: reactionType ?? this.reactionType,
        totalCount: totalCount ?? this.totalCount,
        isDark: isDark ?? this.isDark,
        isFlipped: isFlipped ?? this.isFlipped,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeSuggestedReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeMessage** *(storyAreaTypeMessage)* - child of StoryAreaType
///
/// An area pointing to a message.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message.
final class StoryAreaTypeMessage extends StoryAreaType {
  /// **StoryAreaTypeMessage** *(storyAreaTypeMessage)* - child of StoryAreaType
  ///
  /// An area pointing to a message.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message.
  const StoryAreaTypeMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Parse from a json
  factory StoryAreaTypeMessage.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeMessage(
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
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message
  @override
  StoryAreaTypeMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      StoryAreaTypeMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeLink** *(storyAreaTypeLink)* - child of StoryAreaType
///
/// An area pointing to an HTTP or tg:// link.
///
/// * [url]: HTTP or tg:// URL to be opened when the area is clicked.
final class StoryAreaTypeLink extends StoryAreaType {
  /// **StoryAreaTypeLink** *(storyAreaTypeLink)* - child of StoryAreaType
  ///
  /// An area pointing to an HTTP or tg:// link.
  ///
  /// * [url]: HTTP or tg:// URL to be opened when the area is clicked.
  const StoryAreaTypeLink({
    required this.url,
  });

  /// HTTP or tg:// URL to be opened when the area is clicked
  final String url;

  /// Parse from a json
  factory StoryAreaTypeLink.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeLink(
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
  StoryAreaTypeLink copyWith({
    String? url,
  }) =>
      StoryAreaTypeLink(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeWeather** *(storyAreaTypeWeather)* - child of StoryAreaType
///
/// An area with information about weather.
///
/// * [temperature]: Temperature, in degree Celsius.
/// * [emoji]: Emoji representing the weather.
/// * [backgroundColor]: A color of the area background in the ARGB format.
final class StoryAreaTypeWeather extends StoryAreaType {
  /// **StoryAreaTypeWeather** *(storyAreaTypeWeather)* - child of StoryAreaType
  ///
  /// An area with information about weather.
  ///
  /// * [temperature]: Temperature, in degree Celsius.
  /// * [emoji]: Emoji representing the weather.
  /// * [backgroundColor]: A color of the area background in the ARGB format.
  const StoryAreaTypeWeather({
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
  factory StoryAreaTypeWeather.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeWeather(
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
  StoryAreaTypeWeather copyWith({
    double? temperature,
    String? emoji,
    int? backgroundColor,
  }) =>
      StoryAreaTypeWeather(
        temperature: temperature ?? this.temperature,
        emoji: emoji ?? this.emoji,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeWeather';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryAreaTypeUpgradedGift** *(storyAreaTypeUpgradedGift)* - child of StoryAreaType
///
/// An area with an upgraded gift.
///
/// * [giftName]: Unique name of the upgraded gift.
final class StoryAreaTypeUpgradedGift extends StoryAreaType {
  /// **StoryAreaTypeUpgradedGift** *(storyAreaTypeUpgradedGift)* - child of StoryAreaType
  ///
  /// An area with an upgraded gift.
  ///
  /// * [giftName]: Unique name of the upgraded gift.
  const StoryAreaTypeUpgradedGift({
    required this.giftName,
  });

  /// Unique name of the upgraded gift
  final String giftName;

  /// Parse from a json
  factory StoryAreaTypeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      StoryAreaTypeUpgradedGift(
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
  StoryAreaTypeUpgradedGift copyWith({
    String? giftName,
  }) =>
      StoryAreaTypeUpgradedGift(
        giftName: giftName ?? this.giftName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAreaTypeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
