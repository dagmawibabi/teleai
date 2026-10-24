part of '../tdapi.dart';

/// **TextEntityType** *(textEntityType)* - parent
///
/// Represents a part of the text which must be formatted differently.
sealed class TextEntityType extends TdObject {
  /// **TextEntityType** *(textEntityType)* - parent
  ///
  /// Represents a part of the text which must be formatted differently.
  const TextEntityType();

  /// a TextEntityType return type can be :
  /// * [TextEntityTypeMention]
  /// * [TextEntityTypeHashtag]
  /// * [TextEntityTypeCashtag]
  /// * [TextEntityTypeBotCommand]
  /// * [TextEntityTypeUrl]
  /// * [TextEntityTypeEmailAddress]
  /// * [TextEntityTypePhoneNumber]
  /// * [TextEntityTypeBankCardNumber]
  /// * [TextEntityTypeTonAddress]
  /// * [TextEntityTypeBold]
  /// * [TextEntityTypeItalic]
  /// * [TextEntityTypeUnderline]
  /// * [TextEntityTypeStrikethrough]
  /// * [TextEntityTypeSpoiler]
  /// * [TextEntityTypeCode]
  /// * [TextEntityTypePre]
  /// * [TextEntityTypePreCode]
  /// * [TextEntityTypeBlockQuote]
  /// * [TextEntityTypeExpandableBlockQuote]
  /// * [TextEntityTypeTextUrl]
  /// * [TextEntityTypeMentionName]
  /// * [TextEntityTypeCustomEmoji]
  /// * [TextEntityTypeMediaTimestamp]
  /// * [TextEntityTypeDateTime]
  factory TextEntityType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TextEntityTypeMention.defaultObjectId:
        return TextEntityTypeMention.fromJson(json);
      case TextEntityTypeHashtag.defaultObjectId:
        return TextEntityTypeHashtag.fromJson(json);
      case TextEntityTypeCashtag.defaultObjectId:
        return TextEntityTypeCashtag.fromJson(json);
      case TextEntityTypeBotCommand.defaultObjectId:
        return TextEntityTypeBotCommand.fromJson(json);
      case TextEntityTypeUrl.defaultObjectId:
        return TextEntityTypeUrl.fromJson(json);
      case TextEntityTypeEmailAddress.defaultObjectId:
        return TextEntityTypeEmailAddress.fromJson(json);
      case TextEntityTypePhoneNumber.defaultObjectId:
        return TextEntityTypePhoneNumber.fromJson(json);
      case TextEntityTypeBankCardNumber.defaultObjectId:
        return TextEntityTypeBankCardNumber.fromJson(json);
      case TextEntityTypeTonAddress.defaultObjectId:
        return TextEntityTypeTonAddress.fromJson(json);
      case TextEntityTypeBold.defaultObjectId:
        return TextEntityTypeBold.fromJson(json);
      case TextEntityTypeItalic.defaultObjectId:
        return TextEntityTypeItalic.fromJson(json);
      case TextEntityTypeUnderline.defaultObjectId:
        return TextEntityTypeUnderline.fromJson(json);
      case TextEntityTypeStrikethrough.defaultObjectId:
        return TextEntityTypeStrikethrough.fromJson(json);
      case TextEntityTypeSpoiler.defaultObjectId:
        return TextEntityTypeSpoiler.fromJson(json);
      case TextEntityTypeCode.defaultObjectId:
        return TextEntityTypeCode.fromJson(json);
      case TextEntityTypePre.defaultObjectId:
        return TextEntityTypePre.fromJson(json);
      case TextEntityTypePreCode.defaultObjectId:
        return TextEntityTypePreCode.fromJson(json);
      case TextEntityTypeBlockQuote.defaultObjectId:
        return TextEntityTypeBlockQuote.fromJson(json);
      case TextEntityTypeExpandableBlockQuote.defaultObjectId:
        return TextEntityTypeExpandableBlockQuote.fromJson(json);
      case TextEntityTypeTextUrl.defaultObjectId:
        return TextEntityTypeTextUrl.fromJson(json);
      case TextEntityTypeMentionName.defaultObjectId:
        return TextEntityTypeMentionName.fromJson(json);
      case TextEntityTypeCustomEmoji.defaultObjectId:
        return TextEntityTypeCustomEmoji.fromJson(json);
      case TextEntityTypeMediaTimestamp.defaultObjectId:
        return TextEntityTypeMediaTimestamp.fromJson(json);
      case TextEntityTypeDateTime.defaultObjectId:
        return TextEntityTypeDateTime.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TextEntityType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TextEntityType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeMention** *(textEntityTypeMention)* - child of TextEntityType
///
/// A mention of a user, a supergroup, or a channel by their username.
final class TextEntityTypeMention extends TextEntityType {
  /// **TextEntityTypeMention** *(textEntityTypeMention)* - child of TextEntityType
  ///
  /// A mention of a user, a supergroup, or a channel by their username.
  const TextEntityTypeMention();

  /// Parse from a json
  factory TextEntityTypeMention.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeMention();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeMention copyWith() => const TextEntityTypeMention();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeHashtag** *(textEntityTypeHashtag)* - child of TextEntityType
///
/// A hashtag text, beginning with "#" and optionally containing a chat username at the end.
final class TextEntityTypeHashtag extends TextEntityType {
  /// **TextEntityTypeHashtag** *(textEntityTypeHashtag)* - child of TextEntityType
  ///
  /// A hashtag text, beginning with "#" and optionally containing a chat username at the end.
  const TextEntityTypeHashtag();

  /// Parse from a json
  factory TextEntityTypeHashtag.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeHashtag();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeHashtag copyWith() => const TextEntityTypeHashtag();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeHashtag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeCashtag** *(textEntityTypeCashtag)* - child of TextEntityType
///
/// A cashtag text, beginning with "$", consisting of capital English letters (e.g., "$USD"), and optionally containing a chat username at the end.
final class TextEntityTypeCashtag extends TextEntityType {
  /// **TextEntityTypeCashtag** *(textEntityTypeCashtag)* - child of TextEntityType
  ///
  /// A cashtag text, beginning with "$", consisting of capital English letters (e.g., "$USD"), and optionally containing a chat username at the end.
  const TextEntityTypeCashtag();

  /// Parse from a json
  factory TextEntityTypeCashtag.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeCashtag();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeCashtag copyWith() => const TextEntityTypeCashtag();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeCashtag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeBotCommand** *(textEntityTypeBotCommand)* - child of TextEntityType
///
/// A bot command, beginning with "/".
final class TextEntityTypeBotCommand extends TextEntityType {
  /// **TextEntityTypeBotCommand** *(textEntityTypeBotCommand)* - child of TextEntityType
  ///
  /// A bot command, beginning with "/".
  const TextEntityTypeBotCommand();

  /// Parse from a json
  factory TextEntityTypeBotCommand.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeBotCommand();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeBotCommand copyWith() => const TextEntityTypeBotCommand();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeBotCommand';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeUrl** *(textEntityTypeUrl)* - child of TextEntityType
///
/// An HTTP URL.
final class TextEntityTypeUrl extends TextEntityType {
  /// **TextEntityTypeUrl** *(textEntityTypeUrl)* - child of TextEntityType
  ///
  /// An HTTP URL.
  const TextEntityTypeUrl();

  /// Parse from a json
  factory TextEntityTypeUrl.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeUrl();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeUrl copyWith() => const TextEntityTypeUrl();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeEmailAddress** *(textEntityTypeEmailAddress)* - child of TextEntityType
///
/// An email address.
final class TextEntityTypeEmailAddress extends TextEntityType {
  /// **TextEntityTypeEmailAddress** *(textEntityTypeEmailAddress)* - child of TextEntityType
  ///
  /// An email address.
  const TextEntityTypeEmailAddress();

  /// Parse from a json
  factory TextEntityTypeEmailAddress.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeEmailAddress();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeEmailAddress copyWith() => const TextEntityTypeEmailAddress();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypePhoneNumber** *(textEntityTypePhoneNumber)* - child of TextEntityType
///
/// A phone number.
final class TextEntityTypePhoneNumber extends TextEntityType {
  /// **TextEntityTypePhoneNumber** *(textEntityTypePhoneNumber)* - child of TextEntityType
  ///
  /// A phone number.
  const TextEntityTypePhoneNumber();

  /// Parse from a json
  factory TextEntityTypePhoneNumber.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypePhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypePhoneNumber copyWith() => const TextEntityTypePhoneNumber();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypePhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeBankCardNumber** *(textEntityTypeBankCardNumber)* - child of TextEntityType
///
/// A bank card number. The getBankCardInfo method can be used to get information about the bank card.
final class TextEntityTypeBankCardNumber extends TextEntityType {
  /// **TextEntityTypeBankCardNumber** *(textEntityTypeBankCardNumber)* - child of TextEntityType
  ///
  /// A bank card number. The getBankCardInfo method can be used to get information about the bank card.
  const TextEntityTypeBankCardNumber();

  /// Parse from a json
  factory TextEntityTypeBankCardNumber.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeBankCardNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeBankCardNumber copyWith() =>
      const TextEntityTypeBankCardNumber();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeBankCardNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeTonAddress** *(textEntityTypeTonAddress)* - child of TextEntityType
///
/// An address in the TON blockchain.
final class TextEntityTypeTonAddress extends TextEntityType {
  /// **TextEntityTypeTonAddress** *(textEntityTypeTonAddress)* - child of TextEntityType
  ///
  /// An address in the TON blockchain.
  const TextEntityTypeTonAddress();

  /// Parse from a json
  factory TextEntityTypeTonAddress.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeTonAddress();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeTonAddress copyWith() => const TextEntityTypeTonAddress();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeTonAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeBold** *(textEntityTypeBold)* - child of TextEntityType
///
/// A bold text.
final class TextEntityTypeBold extends TextEntityType {
  /// **TextEntityTypeBold** *(textEntityTypeBold)* - child of TextEntityType
  ///
  /// A bold text.
  const TextEntityTypeBold();

  /// Parse from a json
  factory TextEntityTypeBold.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeBold();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeBold copyWith() => const TextEntityTypeBold();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeBold';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeItalic** *(textEntityTypeItalic)* - child of TextEntityType
///
/// An italic text.
final class TextEntityTypeItalic extends TextEntityType {
  /// **TextEntityTypeItalic** *(textEntityTypeItalic)* - child of TextEntityType
  ///
  /// An italic text.
  const TextEntityTypeItalic();

  /// Parse from a json
  factory TextEntityTypeItalic.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeItalic();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeItalic copyWith() => const TextEntityTypeItalic();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeItalic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeUnderline** *(textEntityTypeUnderline)* - child of TextEntityType
///
/// An underlined text.
final class TextEntityTypeUnderline extends TextEntityType {
  /// **TextEntityTypeUnderline** *(textEntityTypeUnderline)* - child of TextEntityType
  ///
  /// An underlined text.
  const TextEntityTypeUnderline();

  /// Parse from a json
  factory TextEntityTypeUnderline.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeUnderline();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeUnderline copyWith() => const TextEntityTypeUnderline();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeUnderline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeStrikethrough** *(textEntityTypeStrikethrough)* - child of TextEntityType
///
/// A strikethrough text.
final class TextEntityTypeStrikethrough extends TextEntityType {
  /// **TextEntityTypeStrikethrough** *(textEntityTypeStrikethrough)* - child of TextEntityType
  ///
  /// A strikethrough text.
  const TextEntityTypeStrikethrough();

  /// Parse from a json
  factory TextEntityTypeStrikethrough.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeStrikethrough();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeStrikethrough copyWith() => const TextEntityTypeStrikethrough();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeStrikethrough';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeSpoiler** *(textEntityTypeSpoiler)* - child of TextEntityType
///
/// A spoiler text.
final class TextEntityTypeSpoiler extends TextEntityType {
  /// **TextEntityTypeSpoiler** *(textEntityTypeSpoiler)* - child of TextEntityType
  ///
  /// A spoiler text.
  const TextEntityTypeSpoiler();

  /// Parse from a json
  factory TextEntityTypeSpoiler.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeSpoiler();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeSpoiler copyWith() => const TextEntityTypeSpoiler();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeSpoiler';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeCode** *(textEntityTypeCode)* - child of TextEntityType
///
/// Text that must be formatted as if inside a code HTML tag.
final class TextEntityTypeCode extends TextEntityType {
  /// **TextEntityTypeCode** *(textEntityTypeCode)* - child of TextEntityType
  ///
  /// Text that must be formatted as if inside a code HTML tag.
  const TextEntityTypeCode();

  /// Parse from a json
  factory TextEntityTypeCode.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeCode copyWith() => const TextEntityTypeCode();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypePre** *(textEntityTypePre)* - child of TextEntityType
///
/// Text that must be formatted as if inside a pre HTML tag.
final class TextEntityTypePre extends TextEntityType {
  /// **TextEntityTypePre** *(textEntityTypePre)* - child of TextEntityType
  ///
  /// Text that must be formatted as if inside a pre HTML tag.
  const TextEntityTypePre();

  /// Parse from a json
  factory TextEntityTypePre.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypePre();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypePre copyWith() => const TextEntityTypePre();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypePre';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypePreCode** *(textEntityTypePreCode)* - child of TextEntityType
///
/// Text that must be formatted as if inside pre, and code HTML tags.
///
/// * [language]: Programming language of the code; as defined by the sender.
final class TextEntityTypePreCode extends TextEntityType {
  /// **TextEntityTypePreCode** *(textEntityTypePreCode)* - child of TextEntityType
  ///
  /// Text that must be formatted as if inside pre, and code HTML tags.
  ///
  /// * [language]: Programming language of the code; as defined by the sender.
  const TextEntityTypePreCode({
    required this.language,
  });

  /// Programming language of the code; as defined by the sender
  final String language;

  /// Parse from a json
  factory TextEntityTypePreCode.fromJson(Map<String, dynamic> json) =>
      TextEntityTypePreCode(
        language: json['language'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "language": language,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language]: Programming language of the code; as defined by the sender
  @override
  TextEntityTypePreCode copyWith({
    String? language,
  }) =>
      TextEntityTypePreCode(
        language: language ?? this.language,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypePreCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeBlockQuote** *(textEntityTypeBlockQuote)* - child of TextEntityType
///
/// Text that must be formatted as if inside a blockquote HTML tag; not supported in secret chats.
final class TextEntityTypeBlockQuote extends TextEntityType {
  /// **TextEntityTypeBlockQuote** *(textEntityTypeBlockQuote)* - child of TextEntityType
  ///
  /// Text that must be formatted as if inside a blockquote HTML tag; not supported in secret chats.
  const TextEntityTypeBlockQuote();

  /// Parse from a json
  factory TextEntityTypeBlockQuote.fromJson(Map<String, dynamic> json) =>
      const TextEntityTypeBlockQuote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeBlockQuote copyWith() => const TextEntityTypeBlockQuote();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeExpandableBlockQuote** *(textEntityTypeExpandableBlockQuote)* - child of TextEntityType
///
/// Text that must be formatted as if inside a blockquote HTML tag and collapsed by default to 3 lines with the ability to show full text; not supported in secret chats.
final class TextEntityTypeExpandableBlockQuote extends TextEntityType {
  /// **TextEntityTypeExpandableBlockQuote** *(textEntityTypeExpandableBlockQuote)* - child of TextEntityType
  ///
  /// Text that must be formatted as if inside a blockquote HTML tag and collapsed by default to 3 lines with the ability to show full text; not supported in secret chats.
  const TextEntityTypeExpandableBlockQuote();

  /// Parse from a json
  factory TextEntityTypeExpandableBlockQuote.fromJson(
          Map<String, dynamic> json) =>
      const TextEntityTypeExpandableBlockQuote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextEntityTypeExpandableBlockQuote copyWith() =>
      const TextEntityTypeExpandableBlockQuote();

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeExpandableBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeTextUrl** *(textEntityTypeTextUrl)* - child of TextEntityType
///
/// A text description shown instead of a raw URL.
///
/// * [url]: HTTP or tg:// URL to be opened when the link is clicked.
final class TextEntityTypeTextUrl extends TextEntityType {
  /// **TextEntityTypeTextUrl** *(textEntityTypeTextUrl)* - child of TextEntityType
  ///
  /// A text description shown instead of a raw URL.
  ///
  /// * [url]: HTTP or tg:// URL to be opened when the link is clicked.
  const TextEntityTypeTextUrl({
    required this.url,
  });

  /// HTTP or tg:// URL to be opened when the link is clicked
  final String url;

  /// Parse from a json
  factory TextEntityTypeTextUrl.fromJson(Map<String, dynamic> json) =>
      TextEntityTypeTextUrl(
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
  /// * [url]: HTTP or tg:// URL to be opened when the link is clicked
  @override
  TextEntityTypeTextUrl copyWith({
    String? url,
  }) =>
      TextEntityTypeTextUrl(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeTextUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeMentionName** *(textEntityTypeMentionName)* - child of TextEntityType
///
/// A text shown instead of a raw mention of the user (e.g., when the user has no username).
///
/// * [userId]: Identifier of the mentioned user.
final class TextEntityTypeMentionName extends TextEntityType {
  /// **TextEntityTypeMentionName** *(textEntityTypeMentionName)* - child of TextEntityType
  ///
  /// A text shown instead of a raw mention of the user (e.g., when the user has no username).
  ///
  /// * [userId]: Identifier of the mentioned user.
  const TextEntityTypeMentionName({
    required this.userId,
  });

  /// Identifier of the mentioned user
  final int userId;

  /// Parse from a json
  factory TextEntityTypeMentionName.fromJson(Map<String, dynamic> json) =>
      TextEntityTypeMentionName(
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
  /// * [user_id]: Identifier of the mentioned user
  @override
  TextEntityTypeMentionName copyWith({
    int? userId,
  }) =>
      TextEntityTypeMentionName(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeMentionName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeCustomEmoji** *(textEntityTypeCustomEmoji)* - child of TextEntityType
///
/// A custom emoji. The text behind a custom emoji must be an emoji. Only premium users can use premium custom emoji.
///
/// * [customEmojiId]: Unique identifier of the custom emoji.
final class TextEntityTypeCustomEmoji extends TextEntityType {
  /// **TextEntityTypeCustomEmoji** *(textEntityTypeCustomEmoji)* - child of TextEntityType
  ///
  /// A custom emoji. The text behind a custom emoji must be an emoji. Only premium users can use premium custom emoji.
  ///
  /// * [customEmojiId]: Unique identifier of the custom emoji.
  const TextEntityTypeCustomEmoji({
    required this.customEmojiId,
  });

  /// Unique identifier of the custom emoji
  final int customEmojiId;

  /// Parse from a json
  factory TextEntityTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      TextEntityTypeCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Unique identifier of the custom emoji
  @override
  TextEntityTypeCustomEmoji copyWith({
    int? customEmojiId,
  }) =>
      TextEntityTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeMediaTimestamp** *(textEntityTypeMediaTimestamp)* - child of TextEntityType
///
/// A media timestamp.
///
/// * [mediaTimestamp]: Timestamp from which a video/audio/video note/voice note/story playing must start, in seconds.. The media can be in the content or the link preview of the current message, or in the same places in the replied message.
final class TextEntityTypeMediaTimestamp extends TextEntityType {
  /// **TextEntityTypeMediaTimestamp** *(textEntityTypeMediaTimestamp)* - child of TextEntityType
  ///
  /// A media timestamp.
  ///
  /// * [mediaTimestamp]: Timestamp from which a video/audio/video note/voice note/story playing must start, in seconds.. The media can be in the content or the link preview of the current message, or in the same places in the replied message.
  const TextEntityTypeMediaTimestamp({
    required this.mediaTimestamp,
  });

  /// Timestamp from which a video/audio/video note/voice note/story playing must start, in seconds.. The media can be in the content or the link preview of the current message, or in the same places in the replied message
  final int mediaTimestamp;

  /// Parse from a json
  factory TextEntityTypeMediaTimestamp.fromJson(Map<String, dynamic> json) =>
      TextEntityTypeMediaTimestamp(
        mediaTimestamp: json['media_timestamp'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "media_timestamp": mediaTimestamp,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [media_timestamp]: Timestamp from which a video/audio/video note/voice note/story playing must start, in seconds.. The media can be in the content or the link preview of the current message, or in the same places in the replied message
  @override
  TextEntityTypeMediaTimestamp copyWith({
    int? mediaTimestamp,
  }) =>
      TextEntityTypeMediaTimestamp(
        mediaTimestamp: mediaTimestamp ?? this.mediaTimestamp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeMediaTimestamp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextEntityTypeDateTime** *(textEntityTypeDateTime)* - child of TextEntityType
///
/// A date and time.
///
/// * [unixTime]: Point in time (Unix timestamp) representing the date and time.
/// * [formattingType]: Date and time formatting type; may be null if none and the original text must not be changed *(optional)*.
final class TextEntityTypeDateTime extends TextEntityType {
  /// **TextEntityTypeDateTime** *(textEntityTypeDateTime)* - child of TextEntityType
  ///
  /// A date and time.
  ///
  /// * [unixTime]: Point in time (Unix timestamp) representing the date and time.
  /// * [formattingType]: Date and time formatting type; may be null if none and the original text must not be changed *(optional)*.
  const TextEntityTypeDateTime({
    required this.unixTime,
    this.formattingType,
  });

  /// Point in time (Unix timestamp) representing the date and time
  final int unixTime;

  /// Date and time formatting type; may be null if none and the original text must not be changed
  final DateTimeFormattingType? formattingType;

  /// Parse from a json
  factory TextEntityTypeDateTime.fromJson(Map<String, dynamic> json) =>
      TextEntityTypeDateTime(
        unixTime: json['unix_time'],
        formattingType: json['formatting_type'] == null
            ? null
            : DateTimeFormattingType.fromJson(json['formatting_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unix_time": unixTime,
      "formatting_type": formattingType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unix_time]: Point in time (Unix timestamp) representing the date and time
  /// * [formatting_type]: Date and time formatting type; may be null if none and the original text must not be changed
  @override
  TextEntityTypeDateTime copyWith({
    int? unixTime,
    DateTimeFormattingType? formattingType,
  }) =>
      TextEntityTypeDateTime(
        unixTime: unixTime ?? this.unixTime,
        formattingType: formattingType ?? this.formattingType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textEntityTypeDateTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
