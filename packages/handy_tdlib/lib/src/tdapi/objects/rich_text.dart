part of '../tdapi.dart';

/// **RichText** *(richText)* - parent
///
/// Describes a formatted text object.
sealed class RichText extends TdObject {
  /// **RichText** *(richText)* - parent
  ///
  /// Describes a formatted text object.
  const RichText();

  /// a RichText return type can be :
  /// * [RichTextPlain]
  /// * [RichTextBold]
  /// * [RichTextItalic]
  /// * [RichTextUnderline]
  /// * [RichTextStrikethrough]
  /// * [RichTextSpoiler]
  /// * [RichTextSubscript]
  /// * [RichTextSuperscript]
  /// * [RichTextMarked]
  /// * [RichTextDateTime]
  /// * [RichTextMention]
  /// * [RichTextHashtag]
  /// * [RichTextCashtag]
  /// * [RichTextBankCardNumber]
  /// * [RichTextTonAddress]
  /// * [RichTextBotCommand]
  /// * [RichTextFixed]
  /// * [RichTextMentionName]
  /// * [RichTextUrl]
  /// * [RichTextEmailAddress]
  /// * [RichTextPhoneNumber]
  /// * [RichTextCustomEmoji]
  /// * [RichTextIcon]
  /// * [RichTextMathematicalExpression]
  /// * [RichTextButton]
  /// * [RichTextDiff]
  /// * [RichTextReference]
  /// * [RichTextReferenceLink]
  /// * [RichTextAnchor]
  /// * [RichTextAnchorLink]
  /// * [RichTexts]
  factory RichText.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case RichTextPlain.defaultObjectId:
        return RichTextPlain.fromJson(json);
      case RichTextBold.defaultObjectId:
        return RichTextBold.fromJson(json);
      case RichTextItalic.defaultObjectId:
        return RichTextItalic.fromJson(json);
      case RichTextUnderline.defaultObjectId:
        return RichTextUnderline.fromJson(json);
      case RichTextStrikethrough.defaultObjectId:
        return RichTextStrikethrough.fromJson(json);
      case RichTextSpoiler.defaultObjectId:
        return RichTextSpoiler.fromJson(json);
      case RichTextSubscript.defaultObjectId:
        return RichTextSubscript.fromJson(json);
      case RichTextSuperscript.defaultObjectId:
        return RichTextSuperscript.fromJson(json);
      case RichTextMarked.defaultObjectId:
        return RichTextMarked.fromJson(json);
      case RichTextDateTime.defaultObjectId:
        return RichTextDateTime.fromJson(json);
      case RichTextMention.defaultObjectId:
        return RichTextMention.fromJson(json);
      case RichTextHashtag.defaultObjectId:
        return RichTextHashtag.fromJson(json);
      case RichTextCashtag.defaultObjectId:
        return RichTextCashtag.fromJson(json);
      case RichTextBankCardNumber.defaultObjectId:
        return RichTextBankCardNumber.fromJson(json);
      case RichTextTonAddress.defaultObjectId:
        return RichTextTonAddress.fromJson(json);
      case RichTextBotCommand.defaultObjectId:
        return RichTextBotCommand.fromJson(json);
      case RichTextFixed.defaultObjectId:
        return RichTextFixed.fromJson(json);
      case RichTextMentionName.defaultObjectId:
        return RichTextMentionName.fromJson(json);
      case RichTextUrl.defaultObjectId:
        return RichTextUrl.fromJson(json);
      case RichTextEmailAddress.defaultObjectId:
        return RichTextEmailAddress.fromJson(json);
      case RichTextPhoneNumber.defaultObjectId:
        return RichTextPhoneNumber.fromJson(json);
      case RichTextCustomEmoji.defaultObjectId:
        return RichTextCustomEmoji.fromJson(json);
      case RichTextIcon.defaultObjectId:
        return RichTextIcon.fromJson(json);
      case RichTextMathematicalExpression.defaultObjectId:
        return RichTextMathematicalExpression.fromJson(json);
      case RichTextButton.defaultObjectId:
        return RichTextButton.fromJson(json);
      case RichTextDiff.defaultObjectId:
        return RichTextDiff.fromJson(json);
      case RichTextReference.defaultObjectId:
        return RichTextReference.fromJson(json);
      case RichTextReferenceLink.defaultObjectId:
        return RichTextReferenceLink.fromJson(json);
      case RichTextAnchor.defaultObjectId:
        return RichTextAnchor.fromJson(json);
      case RichTextAnchorLink.defaultObjectId:
        return RichTextAnchorLink.fromJson(json);
      case RichTexts.defaultObjectId:
        return RichTexts.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of RichText)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  RichText copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'richText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextPlain** *(richTextPlain)* - child of RichText
///
/// A plain text.
///
/// * [text]: Text.
final class RichTextPlain extends RichText {
  /// **RichTextPlain** *(richTextPlain)* - child of RichText
  ///
  /// A plain text.
  ///
  /// * [text]: Text.
  const RichTextPlain({
    required this.text,
  });

  /// Text
  final String text;

  /// Parse from a json
  factory RichTextPlain.fromJson(Map<String, dynamic> json) => RichTextPlain(
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextPlain copyWith({
    String? text,
  }) =>
      RichTextPlain(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextPlain';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextBold** *(richTextBold)* - child of RichText
///
/// A bold rich text.
///
/// * [text]: Text.
final class RichTextBold extends RichText {
  /// **RichTextBold** *(richTextBold)* - child of RichText
  ///
  /// A bold rich text.
  ///
  /// * [text]: Text.
  const RichTextBold({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextBold.fromJson(Map<String, dynamic> json) => RichTextBold(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextBold copyWith({
    RichText? text,
  }) =>
      RichTextBold(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextBold';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextItalic** *(richTextItalic)* - child of RichText
///
/// An italicized rich text.
///
/// * [text]: Text.
final class RichTextItalic extends RichText {
  /// **RichTextItalic** *(richTextItalic)* - child of RichText
  ///
  /// An italicized rich text.
  ///
  /// * [text]: Text.
  const RichTextItalic({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextItalic.fromJson(Map<String, dynamic> json) => RichTextItalic(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextItalic copyWith({
    RichText? text,
  }) =>
      RichTextItalic(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextItalic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextUnderline** *(richTextUnderline)* - child of RichText
///
/// An underlined rich text.
///
/// * [text]: Text.
final class RichTextUnderline extends RichText {
  /// **RichTextUnderline** *(richTextUnderline)* - child of RichText
  ///
  /// An underlined rich text.
  ///
  /// * [text]: Text.
  const RichTextUnderline({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextUnderline.fromJson(Map<String, dynamic> json) =>
      RichTextUnderline(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextUnderline copyWith({
    RichText? text,
  }) =>
      RichTextUnderline(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextUnderline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextStrikethrough** *(richTextStrikethrough)* - child of RichText
///
/// A strikethrough rich text.
///
/// * [text]: Text.
final class RichTextStrikethrough extends RichText {
  /// **RichTextStrikethrough** *(richTextStrikethrough)* - child of RichText
  ///
  /// A strikethrough rich text.
  ///
  /// * [text]: Text.
  const RichTextStrikethrough({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextStrikethrough.fromJson(Map<String, dynamic> json) =>
      RichTextStrikethrough(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextStrikethrough copyWith({
    RichText? text,
  }) =>
      RichTextStrikethrough(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextStrikethrough';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextSpoiler** *(richTextSpoiler)* - child of RichText
///
/// A spoilered rich text.
///
/// * [text]: Text.
final class RichTextSpoiler extends RichText {
  /// **RichTextSpoiler** *(richTextSpoiler)* - child of RichText
  ///
  /// A spoilered rich text.
  ///
  /// * [text]: Text.
  const RichTextSpoiler({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextSpoiler.fromJson(Map<String, dynamic> json) =>
      RichTextSpoiler(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextSpoiler copyWith({
    RichText? text,
  }) =>
      RichTextSpoiler(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextSpoiler';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextSubscript** *(richTextSubscript)* - child of RichText
///
/// A subscript rich text.
///
/// * [text]: Text.
final class RichTextSubscript extends RichText {
  /// **RichTextSubscript** *(richTextSubscript)* - child of RichText
  ///
  /// A subscript rich text.
  ///
  /// * [text]: Text.
  const RichTextSubscript({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextSubscript.fromJson(Map<String, dynamic> json) =>
      RichTextSubscript(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextSubscript copyWith({
    RichText? text,
  }) =>
      RichTextSubscript(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextSubscript';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextSuperscript** *(richTextSuperscript)* - child of RichText
///
/// A superscript rich text.
///
/// * [text]: Text.
final class RichTextSuperscript extends RichText {
  /// **RichTextSuperscript** *(richTextSuperscript)* - child of RichText
  ///
  /// A superscript rich text.
  ///
  /// * [text]: Text.
  const RichTextSuperscript({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextSuperscript.fromJson(Map<String, dynamic> json) =>
      RichTextSuperscript(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextSuperscript copyWith({
    RichText? text,
  }) =>
      RichTextSuperscript(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextSuperscript';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextMarked** *(richTextMarked)* - child of RichText
///
/// A marked rich text.
///
/// * [text]: Text.
final class RichTextMarked extends RichText {
  /// **RichTextMarked** *(richTextMarked)* - child of RichText
  ///
  /// A marked rich text.
  ///
  /// * [text]: Text.
  const RichTextMarked({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextMarked.fromJson(Map<String, dynamic> json) => RichTextMarked(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextMarked copyWith({
    RichText? text,
  }) =>
      RichTextMarked(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextMarked';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextDateTime** *(richTextDateTime)* - child of RichText
///
/// A date and time.
///
/// * [text]: Original text.
/// * [unixTime]: Point in time (Unix timestamp) representing the date and time.
/// * [formattingType]: Date and time formatting type; may be null if none and the original text must not be changed *(optional)*.
final class RichTextDateTime extends RichText {
  /// **RichTextDateTime** *(richTextDateTime)* - child of RichText
  ///
  /// A date and time.
  ///
  /// * [text]: Original text.
  /// * [unixTime]: Point in time (Unix timestamp) representing the date and time.
  /// * [formattingType]: Date and time formatting type; may be null if none and the original text must not be changed *(optional)*.
  const RichTextDateTime({
    required this.text,
    required this.unixTime,
    this.formattingType,
  });

  /// Original text
  final RichText text;

  /// Point in time (Unix timestamp) representing the date and time
  final int unixTime;

  /// Date and time formatting type; may be null if none and the original text must not be changed
  final DateTimeFormattingType? formattingType;

  /// Parse from a json
  factory RichTextDateTime.fromJson(Map<String, dynamic> json) =>
      RichTextDateTime(
        text: RichText.fromJson(json['text']),
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
      "text": text.toJson(),
      "unix_time": unixTime,
      "formatting_type": formattingType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Original text
  /// * [unix_time]: Point in time (Unix timestamp) representing the date and time
  /// * [formatting_type]: Date and time formatting type; may be null if none and the original text must not be changed
  @override
  RichTextDateTime copyWith({
    RichText? text,
    int? unixTime,
    DateTimeFormattingType? formattingType,
  }) =>
      RichTextDateTime(
        text: text ?? this.text,
        unixTime: unixTime ?? this.unixTime,
        formattingType: formattingType ?? this.formattingType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextDateTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextMention** *(richTextMention)* - child of RichText
///
/// A mention of a Telegram user or chat by a username.
///
/// * [text]: Text.
/// * [username]: The username.
final class RichTextMention extends RichText {
  /// **RichTextMention** *(richTextMention)* - child of RichText
  ///
  /// A mention of a Telegram user or chat by a username.
  ///
  /// * [text]: Text.
  /// * [username]: The username.
  const RichTextMention({
    required this.text,
    required this.username,
  });

  /// Text
  final RichText text;

  /// The username
  final String username;

  /// Parse from a json
  factory RichTextMention.fromJson(Map<String, dynamic> json) =>
      RichTextMention(
        text: RichText.fromJson(json['text']),
        username: json['username'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "username": username,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [username]: The username
  @override
  RichTextMention copyWith({
    RichText? text,
    String? username,
  }) =>
      RichTextMention(
        text: text ?? this.text,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextHashtag** *(richTextHashtag)* - child of RichText
///
/// A hashtag.
///
/// * [text]: Text.
/// * [hashtag]: The hashtag.
final class RichTextHashtag extends RichText {
  /// **RichTextHashtag** *(richTextHashtag)* - child of RichText
  ///
  /// A hashtag.
  ///
  /// * [text]: Text.
  /// * [hashtag]: The hashtag.
  const RichTextHashtag({
    required this.text,
    required this.hashtag,
  });

  /// Text
  final RichText text;

  /// The hashtag
  final String hashtag;

  /// Parse from a json
  factory RichTextHashtag.fromJson(Map<String, dynamic> json) =>
      RichTextHashtag(
        text: RichText.fromJson(json['text']),
        hashtag: json['hashtag'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "hashtag": hashtag,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [hashtag]: The hashtag
  @override
  RichTextHashtag copyWith({
    RichText? text,
    String? hashtag,
  }) =>
      RichTextHashtag(
        text: text ?? this.text,
        hashtag: hashtag ?? this.hashtag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextHashtag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextCashtag** *(richTextCashtag)* - child of RichText
///
/// A cashtag.
///
/// * [text]: Text.
/// * [cashtag]: The cashtag.
final class RichTextCashtag extends RichText {
  /// **RichTextCashtag** *(richTextCashtag)* - child of RichText
  ///
  /// A cashtag.
  ///
  /// * [text]: Text.
  /// * [cashtag]: The cashtag.
  const RichTextCashtag({
    required this.text,
    required this.cashtag,
  });

  /// Text
  final RichText text;

  /// The cashtag
  final String cashtag;

  /// Parse from a json
  factory RichTextCashtag.fromJson(Map<String, dynamic> json) =>
      RichTextCashtag(
        text: RichText.fromJson(json['text']),
        cashtag: json['cashtag'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "cashtag": cashtag,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [cashtag]: The cashtag
  @override
  RichTextCashtag copyWith({
    RichText? text,
    String? cashtag,
  }) =>
      RichTextCashtag(
        text: text ?? this.text,
        cashtag: cashtag ?? this.cashtag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextCashtag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextBankCardNumber** *(richTextBankCardNumber)* - child of RichText
///
/// A bank card number.
///
/// * [text]: Text.
/// * [bankCardNumber]: The number of the bank card.
final class RichTextBankCardNumber extends RichText {
  /// **RichTextBankCardNumber** *(richTextBankCardNumber)* - child of RichText
  ///
  /// A bank card number.
  ///
  /// * [text]: Text.
  /// * [bankCardNumber]: The number of the bank card.
  const RichTextBankCardNumber({
    required this.text,
    required this.bankCardNumber,
  });

  /// Text
  final RichText text;

  /// The number of the bank card
  final String bankCardNumber;

  /// Parse from a json
  factory RichTextBankCardNumber.fromJson(Map<String, dynamic> json) =>
      RichTextBankCardNumber(
        text: RichText.fromJson(json['text']),
        bankCardNumber: json['bank_card_number'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "bank_card_number": bankCardNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [bank_card_number]: The number of the bank card
  @override
  RichTextBankCardNumber copyWith({
    RichText? text,
    String? bankCardNumber,
  }) =>
      RichTextBankCardNumber(
        text: text ?? this.text,
        bankCardNumber: bankCardNumber ?? this.bankCardNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextBankCardNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextTonAddress** *(richTextTonAddress)* - child of RichText
///
/// An address in the TON blockchain.
///
/// * [text]: Text.
/// * [address]: The address.
final class RichTextTonAddress extends RichText {
  /// **RichTextTonAddress** *(richTextTonAddress)* - child of RichText
  ///
  /// An address in the TON blockchain.
  ///
  /// * [text]: Text.
  /// * [address]: The address.
  const RichTextTonAddress({
    required this.text,
    required this.address,
  });

  /// Text
  final RichText text;

  /// The address
  final String address;

  /// Parse from a json
  factory RichTextTonAddress.fromJson(Map<String, dynamic> json) =>
      RichTextTonAddress(
        text: RichText.fromJson(json['text']),
        address: json['address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "address": address,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [address]: The address
  @override
  RichTextTonAddress copyWith({
    RichText? text,
    String? address,
  }) =>
      RichTextTonAddress(
        text: text ?? this.text,
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextTonAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextBotCommand** *(richTextBotCommand)* - child of RichText
///
/// A bot command.
///
/// * [text]: Text.
/// * [botCommand]: The bot command.
final class RichTextBotCommand extends RichText {
  /// **RichTextBotCommand** *(richTextBotCommand)* - child of RichText
  ///
  /// A bot command.
  ///
  /// * [text]: Text.
  /// * [botCommand]: The bot command.
  const RichTextBotCommand({
    required this.text,
    required this.botCommand,
  });

  /// Text
  final RichText text;

  /// The bot command
  final String botCommand;

  /// Parse from a json
  factory RichTextBotCommand.fromJson(Map<String, dynamic> json) =>
      RichTextBotCommand(
        text: RichText.fromJson(json['text']),
        botCommand: json['bot_command'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "bot_command": botCommand,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [bot_command]: The bot command
  @override
  RichTextBotCommand copyWith({
    RichText? text,
    String? botCommand,
  }) =>
      RichTextBotCommand(
        text: text ?? this.text,
        botCommand: botCommand ?? this.botCommand,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextBotCommand';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextFixed** *(richTextFixed)* - child of RichText
///
/// A fixed-width rich text.
///
/// * [text]: Text.
final class RichTextFixed extends RichText {
  /// **RichTextFixed** *(richTextFixed)* - child of RichText
  ///
  /// A fixed-width rich text.
  ///
  /// * [text]: Text.
  const RichTextFixed({
    required this.text,
  });

  /// Text
  final RichText text;

  /// Parse from a json
  factory RichTextFixed.fromJson(Map<String, dynamic> json) => RichTextFixed(
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  @override
  RichTextFixed copyWith({
    RichText? text,
  }) =>
      RichTextFixed(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextFixed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextMentionName** *(richTextMentionName)* - child of RichText
///
/// A rich text that serves as a mention of a user.
///
/// * [text]: Text.
/// * [userId]: Identifier of the mentioned user.
final class RichTextMentionName extends RichText {
  /// **RichTextMentionName** *(richTextMentionName)* - child of RichText
  ///
  /// A rich text that serves as a mention of a user.
  ///
  /// * [text]: Text.
  /// * [userId]: Identifier of the mentioned user.
  const RichTextMentionName({
    required this.text,
    required this.userId,
  });

  /// Text
  final RichText text;

  /// Identifier of the mentioned user
  final int userId;

  /// Parse from a json
  factory RichTextMentionName.fromJson(Map<String, dynamic> json) =>
      RichTextMentionName(
        text: RichText.fromJson(json['text']),
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [user_id]: Identifier of the mentioned user
  @override
  RichTextMentionName copyWith({
    RichText? text,
    int? userId,
  }) =>
      RichTextMentionName(
        text: text ?? this.text,
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextMentionName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextUrl** *(richTextUrl)* - child of RichText
///
/// A rich text URL link.
///
/// * [text]: Text.
/// * [url]: URL.
/// * [isCached]: True, if the URL has cached instant view server-side; instant view only.
final class RichTextUrl extends RichText {
  /// **RichTextUrl** *(richTextUrl)* - child of RichText
  ///
  /// A rich text URL link.
  ///
  /// * [text]: Text.
  /// * [url]: URL.
  /// * [isCached]: True, if the URL has cached instant view server-side; instant view only.
  const RichTextUrl({
    required this.text,
    required this.url,
    required this.isCached,
  });

  /// Text
  final RichText text;

  /// URL
  final String url;

  /// True, if the URL has cached instant view server-side; instant view only
  final bool isCached;

  /// Parse from a json
  factory RichTextUrl.fromJson(Map<String, dynamic> json) => RichTextUrl(
        text: RichText.fromJson(json['text']),
        url: json['url'],
        isCached: json['is_cached'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "url": url,
      "is_cached": isCached,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [url]: URL
  /// * [is_cached]: True, if the URL has cached instant view server-side; instant view only
  @override
  RichTextUrl copyWith({
    RichText? text,
    String? url,
    bool? isCached,
  }) =>
      RichTextUrl(
        text: text ?? this.text,
        url: url ?? this.url,
        isCached: isCached ?? this.isCached,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextEmailAddress** *(richTextEmailAddress)* - child of RichText
///
/// A rich text email address.
///
/// * [text]: Text.
/// * [emailAddress]: Email address.
final class RichTextEmailAddress extends RichText {
  /// **RichTextEmailAddress** *(richTextEmailAddress)* - child of RichText
  ///
  /// A rich text email address.
  ///
  /// * [text]: Text.
  /// * [emailAddress]: Email address.
  const RichTextEmailAddress({
    required this.text,
    required this.emailAddress,
  });

  /// Text
  final RichText text;

  /// Email address
  final String emailAddress;

  /// Parse from a json
  factory RichTextEmailAddress.fromJson(Map<String, dynamic> json) =>
      RichTextEmailAddress(
        text: RichText.fromJson(json['text']),
        emailAddress: json['email_address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "email_address": emailAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [email_address]: Email address
  @override
  RichTextEmailAddress copyWith({
    RichText? text,
    String? emailAddress,
  }) =>
      RichTextEmailAddress(
        text: text ?? this.text,
        emailAddress: emailAddress ?? this.emailAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextPhoneNumber** *(richTextPhoneNumber)* - child of RichText
///
/// A rich text phone number.
///
/// * [text]: Text.
/// * [phoneNumber]: Phone number.
final class RichTextPhoneNumber extends RichText {
  /// **RichTextPhoneNumber** *(richTextPhoneNumber)* - child of RichText
  ///
  /// A rich text phone number.
  ///
  /// * [text]: Text.
  /// * [phoneNumber]: Phone number.
  const RichTextPhoneNumber({
    required this.text,
    required this.phoneNumber,
  });

  /// Text
  final RichText text;

  /// Phone number
  final String phoneNumber;

  /// Parse from a json
  factory RichTextPhoneNumber.fromJson(Map<String, dynamic> json) =>
      RichTextPhoneNumber(
        text: RichText.fromJson(json['text']),
        phoneNumber: json['phone_number'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "phone_number": phoneNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [phone_number]: Phone number
  @override
  RichTextPhoneNumber copyWith({
    RichText? text,
    String? phoneNumber,
  }) =>
      RichTextPhoneNumber(
        text: text ?? this.text,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextCustomEmoji** *(richTextCustomEmoji)* - child of RichText
///
/// A custom emoji.
///
/// * [customEmojiId]: Unique identifier of the custom emoji.
/// * [alternativeText]: Alternative text for the custom emoji.
final class RichTextCustomEmoji extends RichText {
  /// **RichTextCustomEmoji** *(richTextCustomEmoji)* - child of RichText
  ///
  /// A custom emoji.
  ///
  /// * [customEmojiId]: Unique identifier of the custom emoji.
  /// * [alternativeText]: Alternative text for the custom emoji.
  const RichTextCustomEmoji({
    required this.customEmojiId,
    required this.alternativeText,
  });

  /// Unique identifier of the custom emoji
  final int customEmojiId;

  /// Alternative text for the custom emoji
  final String alternativeText;

  /// Parse from a json
  factory RichTextCustomEmoji.fromJson(Map<String, dynamic> json) =>
      RichTextCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
        alternativeText: json['alternative_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
      "alternative_text": alternativeText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Unique identifier of the custom emoji
  /// * [alternative_text]: Alternative text for the custom emoji
  @override
  RichTextCustomEmoji copyWith({
    int? customEmojiId,
    String? alternativeText,
  }) =>
      RichTextCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
        alternativeText: alternativeText ?? this.alternativeText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextIcon** *(richTextIcon)* - child of RichText
///
/// A small image inside the text; instant view only.
///
/// * [document]: The image represented as a document. The image can be in GIF, JPEG, or PNG format.
/// * [width]: Width of a bounding box in which the image must be shown; 0 if unknown.
/// * [height]: Height of a bounding box in which the image must be shown; 0 if unknown.
final class RichTextIcon extends RichText {
  /// **RichTextIcon** *(richTextIcon)* - child of RichText
  ///
  /// A small image inside the text; instant view only.
  ///
  /// * [document]: The image represented as a document. The image can be in GIF, JPEG, or PNG format.
  /// * [width]: Width of a bounding box in which the image must be shown; 0 if unknown.
  /// * [height]: Height of a bounding box in which the image must be shown; 0 if unknown.
  const RichTextIcon({
    required this.document,
    required this.width,
    required this.height,
  });

  /// The image represented as a document. The image can be in GIF, JPEG, or PNG format
  final Document document;

  /// Width of a bounding box in which the image must be shown; 0 if unknown
  final int width;

  /// Height of a bounding box in which the image must be shown; 0 if unknown
  final int height;

  /// Parse from a json
  factory RichTextIcon.fromJson(Map<String, dynamic> json) => RichTextIcon(
        document: Document.fromJson(json['document']),
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: The image represented as a document. The image can be in GIF, JPEG, or PNG format
  /// * [width]: Width of a bounding box in which the image must be shown; 0 if unknown
  /// * [height]: Height of a bounding box in which the image must be shown; 0 if unknown
  @override
  RichTextIcon copyWith({
    Document? document,
    int? width,
    int? height,
  }) =>
      RichTextIcon(
        document: document ?? this.document,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextIcon';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextMathematicalExpression** *(richTextMathematicalExpression)* - child of RichText
///
/// A mathematical expression.
///
/// * [expression]: The expression in LaTeX format.
final class RichTextMathematicalExpression extends RichText {
  /// **RichTextMathematicalExpression** *(richTextMathematicalExpression)* - child of RichText
  ///
  /// A mathematical expression.
  ///
  /// * [expression]: The expression in LaTeX format.
  const RichTextMathematicalExpression({
    required this.expression,
  });

  /// The expression in LaTeX format
  final String expression;

  /// Parse from a json
  factory RichTextMathematicalExpression.fromJson(Map<String, dynamic> json) =>
      RichTextMathematicalExpression(
        expression: json['expression'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "expression": expression,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [expression]: The expression in LaTeX format
  @override
  RichTextMathematicalExpression copyWith({
    String? expression,
  }) =>
      RichTextMathematicalExpression(
        expression: expression ?? this.expression,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextMathematicalExpression';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextButton** *(richTextButton)* - child of RichText
///
/// A button.
///
/// * [button]: The button.
final class RichTextButton extends RichText {
  /// **RichTextButton** *(richTextButton)* - child of RichText
  ///
  /// A button.
  ///
  /// * [button]: The button.
  const RichTextButton({
    required this.button,
  });

  /// The button
  final InlineButton button;

  /// Parse from a json
  factory RichTextButton.fromJson(Map<String, dynamic> json) => RichTextButton(
        button: InlineButton.fromJson(json['button']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "button": button.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [button]: The button
  @override
  RichTextButton copyWith({
    InlineButton? button,
  }) =>
      RichTextButton(
        button: button ?? this.button,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextDiff** *(richTextDiff)* - child of RichText
///
/// A rich text replacing another rich text; not supported in inputRichMessage.
///
/// * [text]: Text.
/// * [oldText]: The old text.
final class RichTextDiff extends RichText {
  /// **RichTextDiff** *(richTextDiff)* - child of RichText
  ///
  /// A rich text replacing another rich text; not supported in inputRichMessage.
  ///
  /// * [text]: Text.
  /// * [oldText]: The old text.
  const RichTextDiff({
    required this.text,
    required this.oldText,
  });

  /// Text
  final RichText text;

  /// The old text
  final RichText oldText;

  /// Parse from a json
  factory RichTextDiff.fromJson(Map<String, dynamic> json) => RichTextDiff(
        text: RichText.fromJson(json['text']),
        oldText: RichText.fromJson(json['old_text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "old_text": oldText.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text
  /// * [old_text]: The old text
  @override
  RichTextDiff copyWith({
    RichText? text,
    RichText? oldText,
  }) =>
      RichTextDiff(
        text: text ?? this.text,
        oldText: oldText ?? this.oldText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextDiff';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextReference** *(richTextReference)* - child of RichText
///
/// A reference.
///
/// * [name]: Reference name.
/// * [text]: Text of the reference.
final class RichTextReference extends RichText {
  /// **RichTextReference** *(richTextReference)* - child of RichText
  ///
  /// A reference.
  ///
  /// * [name]: Reference name.
  /// * [text]: Text of the reference.
  const RichTextReference({
    required this.name,
    required this.text,
  });

  /// Reference name
  final String name;

  /// Text of the reference
  final RichText text;

  /// Parse from a json
  factory RichTextReference.fromJson(Map<String, dynamic> json) =>
      RichTextReference(
        name: json['name'],
        text: RichText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Reference name
  /// * [text]: Text of the reference
  @override
  RichTextReference copyWith({
    String? name,
    RichText? text,
  }) =>
      RichTextReference(
        name: name ?? this.name,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextReference';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextReferenceLink** *(richTextReferenceLink)* - child of RichText
///
/// A link to a reference on the same page.
///
/// * [text]: The link text.
/// * [referenceName]: The reference name.
/// * [url]: An HTTP URL that opens the reference.
final class RichTextReferenceLink extends RichText {
  /// **RichTextReferenceLink** *(richTextReferenceLink)* - child of RichText
  ///
  /// A link to a reference on the same page.
  ///
  /// * [text]: The link text.
  /// * [referenceName]: The reference name.
  /// * [url]: An HTTP URL that opens the reference.
  const RichTextReferenceLink({
    required this.text,
    required this.referenceName,
    required this.url,
  });

  /// The link text
  final RichText text;

  /// The reference name
  final String referenceName;

  /// An HTTP URL that opens the reference
  final String url;

  /// Parse from a json
  factory RichTextReferenceLink.fromJson(Map<String, dynamic> json) =>
      RichTextReferenceLink(
        text: RichText.fromJson(json['text']),
        referenceName: json['reference_name'],
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "reference_name": referenceName,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The link text
  /// * [reference_name]: The reference name
  /// * [url]: An HTTP URL that opens the reference
  @override
  RichTextReferenceLink copyWith({
    RichText? text,
    String? referenceName,
    String? url,
  }) =>
      RichTextReferenceLink(
        text: text ?? this.text,
        referenceName: referenceName ?? this.referenceName,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextReferenceLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextAnchor** *(richTextAnchor)* - child of RichText
///
/// An anchor.
///
/// * [name]: Anchor name.
final class RichTextAnchor extends RichText {
  /// **RichTextAnchor** *(richTextAnchor)* - child of RichText
  ///
  /// An anchor.
  ///
  /// * [name]: Anchor name.
  const RichTextAnchor({
    required this.name,
  });

  /// Anchor name
  final String name;

  /// Parse from a json
  factory RichTextAnchor.fromJson(Map<String, dynamic> json) => RichTextAnchor(
        name: json['name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Anchor name
  @override
  RichTextAnchor copyWith({
    String? name,
  }) =>
      RichTextAnchor(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextAnchor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTextAnchorLink** *(richTextAnchorLink)* - child of RichText
///
/// A link to an anchor on the same page.
///
/// * [text]: The link text.
/// * [anchorName]: The anchor name. If the name is empty, the link must bring back to top.
/// * [url]: An HTTP URL that opens the anchor.
final class RichTextAnchorLink extends RichText {
  /// **RichTextAnchorLink** *(richTextAnchorLink)* - child of RichText
  ///
  /// A link to an anchor on the same page.
  ///
  /// * [text]: The link text.
  /// * [anchorName]: The anchor name. If the name is empty, the link must bring back to top.
  /// * [url]: An HTTP URL that opens the anchor.
  const RichTextAnchorLink({
    required this.text,
    required this.anchorName,
    required this.url,
  });

  /// The link text
  final RichText text;

  /// The anchor name. If the name is empty, the link must bring back to top
  final String anchorName;

  /// An HTTP URL that opens the anchor
  final String url;

  /// Parse from a json
  factory RichTextAnchorLink.fromJson(Map<String, dynamic> json) =>
      RichTextAnchorLink(
        text: RichText.fromJson(json['text']),
        anchorName: json['anchor_name'],
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "anchor_name": anchorName,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The link text
  /// * [anchor_name]: The anchor name. If the name is empty, the link must bring back to top
  /// * [url]: An HTTP URL that opens the anchor
  @override
  RichTextAnchorLink copyWith({
    RichText? text,
    String? anchorName,
    String? url,
  }) =>
      RichTextAnchorLink(
        text: text ?? this.text,
        anchorName: anchorName ?? this.anchorName,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTextAnchorLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichTexts** *(richTexts)* - child of RichText
///
/// A concatenation of rich texts.
///
/// * [texts]: Texts.
final class RichTexts extends RichText {
  /// **RichTexts** *(richTexts)* - child of RichText
  ///
  /// A concatenation of rich texts.
  ///
  /// * [texts]: Texts.
  const RichTexts({
    required this.texts,
  });

  /// Texts
  final List<RichText> texts;

  /// Parse from a json
  factory RichTexts.fromJson(Map<String, dynamic> json) => RichTexts(
        texts: List<RichText>.from((json['texts'] ?? [])
            .map((item) => RichText.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "texts": texts.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [texts]: Texts
  @override
  RichTexts copyWith({
    List<RichText>? texts,
  }) =>
      RichTexts(
        texts: texts ?? this.texts,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richTexts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
