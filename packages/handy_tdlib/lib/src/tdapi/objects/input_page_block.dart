part of '../tdapi.dart';

/// **InputPageBlock** *(inputPageBlock)* - parent
///
/// Describes a block of a rich message to send.
sealed class InputPageBlock extends TdObject {
  /// **InputPageBlock** *(inputPageBlock)* - parent
  ///
  /// Describes a block of a rich message to send.
  const InputPageBlock();

  /// a InputPageBlock return type can be :
  /// * [InputPageBlockSectionHeading]
  /// * [InputPageBlockParagraph]
  /// * [InputPageBlockPreformatted]
  /// * [InputPageBlockFooter]
  /// * [InputPageBlockThinking]
  /// * [InputPageBlockDivider]
  /// * [InputPageBlockMathematicalExpression]
  /// * [InputPageBlockAnchor]
  /// * [InputPageBlockList]
  /// * [InputPageBlockBlockQuote]
  /// * [InputPageBlockExpandableBlockQuote]
  /// * [InputPageBlockPullQuote]
  /// * [InputPageBlockAnimation]
  /// * [InputPageBlockAudio]
  /// * [InputPageBlockDocument]
  /// * [InputPageBlockPhoto]
  /// * [InputPageBlockVideo]
  /// * [InputPageBlockVoiceNote]
  /// * [InputPageBlockCollage]
  /// * [InputPageBlockSlideshow]
  /// * [InputPageBlockTable]
  /// * [InputPageBlockDetails]
  /// * [InputPageBlockMap]
  /// * [InputPageBlockButtonRow]
  factory InputPageBlock.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPageBlockSectionHeading.defaultObjectId:
        return InputPageBlockSectionHeading.fromJson(json);
      case InputPageBlockParagraph.defaultObjectId:
        return InputPageBlockParagraph.fromJson(json);
      case InputPageBlockPreformatted.defaultObjectId:
        return InputPageBlockPreformatted.fromJson(json);
      case InputPageBlockFooter.defaultObjectId:
        return InputPageBlockFooter.fromJson(json);
      case InputPageBlockThinking.defaultObjectId:
        return InputPageBlockThinking.fromJson(json);
      case InputPageBlockDivider.defaultObjectId:
        return InputPageBlockDivider.fromJson(json);
      case InputPageBlockMathematicalExpression.defaultObjectId:
        return InputPageBlockMathematicalExpression.fromJson(json);
      case InputPageBlockAnchor.defaultObjectId:
        return InputPageBlockAnchor.fromJson(json);
      case InputPageBlockList.defaultObjectId:
        return InputPageBlockList.fromJson(json);
      case InputPageBlockBlockQuote.defaultObjectId:
        return InputPageBlockBlockQuote.fromJson(json);
      case InputPageBlockExpandableBlockQuote.defaultObjectId:
        return InputPageBlockExpandableBlockQuote.fromJson(json);
      case InputPageBlockPullQuote.defaultObjectId:
        return InputPageBlockPullQuote.fromJson(json);
      case InputPageBlockAnimation.defaultObjectId:
        return InputPageBlockAnimation.fromJson(json);
      case InputPageBlockAudio.defaultObjectId:
        return InputPageBlockAudio.fromJson(json);
      case InputPageBlockDocument.defaultObjectId:
        return InputPageBlockDocument.fromJson(json);
      case InputPageBlockPhoto.defaultObjectId:
        return InputPageBlockPhoto.fromJson(json);
      case InputPageBlockVideo.defaultObjectId:
        return InputPageBlockVideo.fromJson(json);
      case InputPageBlockVoiceNote.defaultObjectId:
        return InputPageBlockVoiceNote.fromJson(json);
      case InputPageBlockCollage.defaultObjectId:
        return InputPageBlockCollage.fromJson(json);
      case InputPageBlockSlideshow.defaultObjectId:
        return InputPageBlockSlideshow.fromJson(json);
      case InputPageBlockTable.defaultObjectId:
        return InputPageBlockTable.fromJson(json);
      case InputPageBlockDetails.defaultObjectId:
        return InputPageBlockDetails.fromJson(json);
      case InputPageBlockMap.defaultObjectId:
        return InputPageBlockMap.fromJson(json);
      case InputPageBlockButtonRow.defaultObjectId:
        return InputPageBlockButtonRow.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPageBlock)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPageBlock copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlock';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockSectionHeading** *(inputPageBlockSectionHeading)* - child of InputPageBlock
///
/// A section heading.
///
/// * [text]: Text of the section heading.
/// * [size]: Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest.
final class InputPageBlockSectionHeading extends InputPageBlock {
  /// **InputPageBlockSectionHeading** *(inputPageBlockSectionHeading)* - child of InputPageBlock
  ///
  /// A section heading.
  ///
  /// * [text]: Text of the section heading.
  /// * [size]: Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest.
  const InputPageBlockSectionHeading({
    required this.text,
    required this.size,
  });

  /// Text of the section heading
  final RichText text;

  /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
  final int size;

  /// Parse from a json
  factory InputPageBlockSectionHeading.fromJson(Map<String, dynamic> json) =>
      InputPageBlockSectionHeading(
        text: RichText.fromJson(json['text']),
        size: json['size'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "size": size,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the section heading
  /// * [size]: Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
  @override
  InputPageBlockSectionHeading copyWith({
    RichText? text,
    int? size,
  }) =>
      InputPageBlockSectionHeading(
        text: text ?? this.text,
        size: size ?? this.size,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockSectionHeading';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockParagraph** *(inputPageBlockParagraph)* - child of InputPageBlock
///
/// A text paragraph.
///
/// * [text]: Paragraph text.
final class InputPageBlockParagraph extends InputPageBlock {
  /// **InputPageBlockParagraph** *(inputPageBlockParagraph)* - child of InputPageBlock
  ///
  /// A text paragraph.
  ///
  /// * [text]: Paragraph text.
  const InputPageBlockParagraph({
    required this.text,
  });

  /// Paragraph text
  final RichText text;

  /// Parse from a json
  factory InputPageBlockParagraph.fromJson(Map<String, dynamic> json) =>
      InputPageBlockParagraph(
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
  /// * [text]: Paragraph text
  @override
  InputPageBlockParagraph copyWith({
    RichText? text,
  }) =>
      InputPageBlockParagraph(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockParagraph';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockPreformatted** *(inputPageBlockPreformatted)* - child of InputPageBlock
///
/// A preformatted text paragraph.
///
/// * [text]: Paragraph text.
/// * [language]: Programming language for which the text needs to be formatted.
final class InputPageBlockPreformatted extends InputPageBlock {
  /// **InputPageBlockPreformatted** *(inputPageBlockPreformatted)* - child of InputPageBlock
  ///
  /// A preformatted text paragraph.
  ///
  /// * [text]: Paragraph text.
  /// * [language]: Programming language for which the text needs to be formatted.
  const InputPageBlockPreformatted({
    required this.text,
    required this.language,
  });

  /// Paragraph text
  final RichText text;

  /// Programming language for which the text needs to be formatted
  final String language;

  /// Parse from a json
  factory InputPageBlockPreformatted.fromJson(Map<String, dynamic> json) =>
      InputPageBlockPreformatted(
        text: RichText.fromJson(json['text']),
        language: json['language'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "language": language,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Paragraph text
  /// * [language]: Programming language for which the text needs to be formatted
  @override
  InputPageBlockPreformatted copyWith({
    RichText? text,
    String? language,
  }) =>
      InputPageBlockPreformatted(
        text: text ?? this.text,
        language: language ?? this.language,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockPreformatted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockFooter** *(inputPageBlockFooter)* - child of InputPageBlock
///
/// The footer of the page.
///
/// * [footer]: Footer.
final class InputPageBlockFooter extends InputPageBlock {
  /// **InputPageBlockFooter** *(inputPageBlockFooter)* - child of InputPageBlock
  ///
  /// The footer of the page.
  ///
  /// * [footer]: Footer.
  const InputPageBlockFooter({
    required this.footer,
  });

  /// Footer
  final RichText footer;

  /// Parse from a json
  factory InputPageBlockFooter.fromJson(Map<String, dynamic> json) =>
      InputPageBlockFooter(
        footer: RichText.fromJson(json['footer']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "footer": footer.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [footer]: Footer
  @override
  InputPageBlockFooter copyWith({
    RichText? footer,
  }) =>
      InputPageBlockFooter(
        footer: footer ?? this.footer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockFooter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockThinking** *(inputPageBlockThinking)* - child of InputPageBlock
///
/// A "Thinking..." placeholder; for pending rich messages only; for bots only.
///
/// * [text]: Text of the placeholder.
final class InputPageBlockThinking extends InputPageBlock {
  /// **InputPageBlockThinking** *(inputPageBlockThinking)* - child of InputPageBlock
  ///
  /// A "Thinking..." placeholder; for pending rich messages only; for bots only.
  ///
  /// * [text]: Text of the placeholder.
  const InputPageBlockThinking({
    required this.text,
  });

  /// Text of the placeholder
  final RichText text;

  /// Parse from a json
  factory InputPageBlockThinking.fromJson(Map<String, dynamic> json) =>
      InputPageBlockThinking(
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
  /// * [text]: Text of the placeholder
  @override
  InputPageBlockThinking copyWith({
    RichText? text,
  }) =>
      InputPageBlockThinking(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockThinking';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockDivider** *(inputPageBlockDivider)* - child of InputPageBlock
///
/// An empty block separating the page.
final class InputPageBlockDivider extends InputPageBlock {
  /// **InputPageBlockDivider** *(inputPageBlockDivider)* - child of InputPageBlock
  ///
  /// An empty block separating the page.
  const InputPageBlockDivider();

  /// Parse from a json
  factory InputPageBlockDivider.fromJson(Map<String, dynamic> json) =>
      const InputPageBlockDivider();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InputPageBlockDivider copyWith() => const InputPageBlockDivider();

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockDivider';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockMathematicalExpression** *(inputPageBlockMathematicalExpression)* - child of InputPageBlock
///
/// A mathematical expression.
///
/// * [expression]: The expression in LaTeX format.
final class InputPageBlockMathematicalExpression extends InputPageBlock {
  /// **InputPageBlockMathematicalExpression** *(inputPageBlockMathematicalExpression)* - child of InputPageBlock
  ///
  /// A mathematical expression.
  ///
  /// * [expression]: The expression in LaTeX format.
  const InputPageBlockMathematicalExpression({
    required this.expression,
  });

  /// The expression in LaTeX format
  final String expression;

  /// Parse from a json
  factory InputPageBlockMathematicalExpression.fromJson(
          Map<String, dynamic> json) =>
      InputPageBlockMathematicalExpression(
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
  InputPageBlockMathematicalExpression copyWith({
    String? expression,
  }) =>
      InputPageBlockMathematicalExpression(
        expression: expression ?? this.expression,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockMathematicalExpression';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockAnchor** *(inputPageBlockAnchor)* - child of InputPageBlock
///
/// An invisible anchor.
///
/// * [name]: Name of the anchor.
final class InputPageBlockAnchor extends InputPageBlock {
  /// **InputPageBlockAnchor** *(inputPageBlockAnchor)* - child of InputPageBlock
  ///
  /// An invisible anchor.
  ///
  /// * [name]: Name of the anchor.
  const InputPageBlockAnchor({
    required this.name,
  });

  /// Name of the anchor
  final String name;

  /// Parse from a json
  factory InputPageBlockAnchor.fromJson(Map<String, dynamic> json) =>
      InputPageBlockAnchor(
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
  /// * [name]: Name of the anchor
  @override
  InputPageBlockAnchor copyWith({
    String? name,
  }) =>
      InputPageBlockAnchor(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockAnchor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockList** *(inputPageBlockList)* - child of InputPageBlock
///
/// A list of data blocks.
///
/// * [items]: The items of the list.
final class InputPageBlockList extends InputPageBlock {
  /// **InputPageBlockList** *(inputPageBlockList)* - child of InputPageBlock
  ///
  /// A list of data blocks.
  ///
  /// * [items]: The items of the list.
  const InputPageBlockList({
    required this.items,
  });

  /// The items of the list
  final List<InputPageBlockListItem> items;

  /// Parse from a json
  factory InputPageBlockList.fromJson(Map<String, dynamic> json) =>
      InputPageBlockList(
        items: List<InputPageBlockListItem>.from((json['items'] ?? [])
            .map((item) => InputPageBlockListItem.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "items": items.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [items]: The items of the list
  @override
  InputPageBlockList copyWith({
    List<InputPageBlockListItem>? items,
  }) =>
      InputPageBlockList(
        items: items ?? this.items,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockBlockQuote** *(inputPageBlockBlockQuote)* - child of InputPageBlock
///
/// A block quote.
///
/// * [blocks]: Quote blocks.
/// * [credit]: Quote credit; pass null if none *(optional)*.
final class InputPageBlockBlockQuote extends InputPageBlock {
  /// **InputPageBlockBlockQuote** *(inputPageBlockBlockQuote)* - child of InputPageBlock
  ///
  /// A block quote.
  ///
  /// * [blocks]: Quote blocks.
  /// * [credit]: Quote credit; pass null if none *(optional)*.
  const InputPageBlockBlockQuote({
    required this.blocks,
    this.credit,
  });

  /// Quote blocks
  final List<InputPageBlock> blocks;

  /// Quote credit; pass null if none
  final RichText? credit;

  /// Parse from a json
  factory InputPageBlockBlockQuote.fromJson(Map<String, dynamic> json) =>
      InputPageBlockBlockQuote(
        blocks: List<InputPageBlock>.from((json['blocks'] ?? [])
            .map((item) => InputPageBlock.fromJson(item))
            .toList()),
        credit:
            json['credit'] == null ? null : RichText.fromJson(json['credit']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "credit": credit?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [blocks]: Quote blocks
  /// * [credit]: Quote credit; pass null if none
  @override
  InputPageBlockBlockQuote copyWith({
    List<InputPageBlock>? blocks,
    RichText? credit,
  }) =>
      InputPageBlockBlockQuote(
        blocks: blocks ?? this.blocks,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockExpandableBlockQuote** *(inputPageBlockExpandableBlockQuote)* - child of InputPageBlock
///
/// An expandable block quote.
///
/// * [text]: Quote text.
/// * [credit]: Quote credit; pass null if none *(optional)*.
final class InputPageBlockExpandableBlockQuote extends InputPageBlock {
  /// **InputPageBlockExpandableBlockQuote** *(inputPageBlockExpandableBlockQuote)* - child of InputPageBlock
  ///
  /// An expandable block quote.
  ///
  /// * [text]: Quote text.
  /// * [credit]: Quote credit; pass null if none *(optional)*.
  const InputPageBlockExpandableBlockQuote({
    required this.text,
    this.credit,
  });

  /// Quote text
  final RichText text;

  /// Quote credit; pass null if none
  final RichText? credit;

  /// Parse from a json
  factory InputPageBlockExpandableBlockQuote.fromJson(
          Map<String, dynamic> json) =>
      InputPageBlockExpandableBlockQuote(
        text: RichText.fromJson(json['text']),
        credit:
            json['credit'] == null ? null : RichText.fromJson(json['credit']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "credit": credit?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Quote text
  /// * [credit]: Quote credit; pass null if none
  @override
  InputPageBlockExpandableBlockQuote copyWith({
    RichText? text,
    RichText? credit,
  }) =>
      InputPageBlockExpandableBlockQuote(
        text: text ?? this.text,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockExpandableBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockPullQuote** *(inputPageBlockPullQuote)* - child of InputPageBlock
///
/// A pull quote.
///
/// * [text]: Quote text.
/// * [credit]: Quote credit; pass null if none *(optional)*.
final class InputPageBlockPullQuote extends InputPageBlock {
  /// **InputPageBlockPullQuote** *(inputPageBlockPullQuote)* - child of InputPageBlock
  ///
  /// A pull quote.
  ///
  /// * [text]: Quote text.
  /// * [credit]: Quote credit; pass null if none *(optional)*.
  const InputPageBlockPullQuote({
    required this.text,
    this.credit,
  });

  /// Quote text
  final RichText text;

  /// Quote credit; pass null if none
  final RichText? credit;

  /// Parse from a json
  factory InputPageBlockPullQuote.fromJson(Map<String, dynamic> json) =>
      InputPageBlockPullQuote(
        text: RichText.fromJson(json['text']),
        credit:
            json['credit'] == null ? null : RichText.fromJson(json['credit']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "credit": credit?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Quote text
  /// * [credit]: Quote credit; pass null if none
  @override
  InputPageBlockPullQuote copyWith({
    RichText? text,
    RichText? credit,
  }) =>
      InputPageBlockPullQuote(
        text: text ?? this.text,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockPullQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockAnimation** *(inputPageBlockAnimation)* - child of InputPageBlock
///
/// An animation.
///
/// * [animation]: The animation to be sent.
/// * [caption]: Animation caption; pass null if none *(optional)*.
/// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
final class InputPageBlockAnimation extends InputPageBlock {
  /// **InputPageBlockAnimation** *(inputPageBlockAnimation)* - child of InputPageBlock
  ///
  /// An animation.
  ///
  /// * [animation]: The animation to be sent.
  /// * [caption]: Animation caption; pass null if none *(optional)*.
  /// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
  const InputPageBlockAnimation({
    required this.animation,
    this.caption,
    required this.hasSpoiler,
  });

  /// The animation to be sent
  final InputAnimation animation;

  /// Animation caption; pass null if none
  final PageBlockCaption? caption;

  /// True, if the animation preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory InputPageBlockAnimation.fromJson(Map<String, dynamic> json) =>
      InputPageBlockAnimation(
        animation: InputAnimation.fromJson(json['animation']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "caption": caption?.toJson(),
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: The animation to be sent
  /// * [caption]: Animation caption; pass null if none
  /// * [has_spoiler]: True, if the animation preview must be covered by a spoiler animation
  @override
  InputPageBlockAnimation copyWith({
    InputAnimation? animation,
    PageBlockCaption? caption,
    bool? hasSpoiler,
  }) =>
      InputPageBlockAnimation(
        animation: animation ?? this.animation,
        caption: caption ?? this.caption,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockAudio** *(inputPageBlockAudio)* - child of InputPageBlock
///
/// An audio file.
///
/// * [audio]: The audio to be sent.
/// * [caption]: Audio file caption; pass null if none *(optional)*.
final class InputPageBlockAudio extends InputPageBlock {
  /// **InputPageBlockAudio** *(inputPageBlockAudio)* - child of InputPageBlock
  ///
  /// An audio file.
  ///
  /// * [audio]: The audio to be sent.
  /// * [caption]: Audio file caption; pass null if none *(optional)*.
  const InputPageBlockAudio({
    required this.audio,
    this.caption,
  });

  /// The audio to be sent
  final InputAudio audio;

  /// Audio file caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockAudio.fromJson(Map<String, dynamic> json) =>
      InputPageBlockAudio(
        audio: InputAudio.fromJson(json['audio']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: The audio to be sent
  /// * [caption]: Audio file caption; pass null if none
  @override
  InputPageBlockAudio copyWith({
    InputAudio? audio,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockAudio(
        audio: audio ?? this.audio,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockDocument** *(inputPageBlockDocument)* - child of InputPageBlock
///
/// A general file.
///
/// * [document]: The file to be sent.
/// * [caption]: File caption; pass null if none *(optional)*.
final class InputPageBlockDocument extends InputPageBlock {
  /// **InputPageBlockDocument** *(inputPageBlockDocument)* - child of InputPageBlock
  ///
  /// A general file.
  ///
  /// * [document]: The file to be sent.
  /// * [caption]: File caption; pass null if none *(optional)*.
  const InputPageBlockDocument({
    required this.document,
    this.caption,
  });

  /// The file to be sent
  final InputDocument document;

  /// File caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockDocument.fromJson(Map<String, dynamic> json) =>
      InputPageBlockDocument(
        document: InputDocument.fromJson(json['document']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: The file to be sent
  /// * [caption]: File caption; pass null if none
  @override
  InputPageBlockDocument copyWith({
    InputDocument? document,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockDocument(
        document: document ?? this.document,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockPhoto** *(inputPageBlockPhoto)* - child of InputPageBlock
///
/// A photo.
///
/// * [photo]: The photo to be sent.
/// * [caption]: Photo caption; pass null if none *(optional)*.
/// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
final class InputPageBlockPhoto extends InputPageBlock {
  /// **InputPageBlockPhoto** *(inputPageBlockPhoto)* - child of InputPageBlock
  ///
  /// A photo.
  ///
  /// * [photo]: The photo to be sent.
  /// * [caption]: Photo caption; pass null if none *(optional)*.
  /// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
  const InputPageBlockPhoto({
    required this.photo,
    this.caption,
    required this.hasSpoiler,
  });

  /// The photo to be sent
  final InputPhoto photo;

  /// Photo caption; pass null if none
  final PageBlockCaption? caption;

  /// True, if the photo preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory InputPageBlockPhoto.fromJson(Map<String, dynamic> json) =>
      InputPageBlockPhoto(
        photo: InputPhoto.fromJson(json['photo']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "caption": caption?.toJson(),
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: The photo to be sent
  /// * [caption]: Photo caption; pass null if none
  /// * [has_spoiler]: True, if the photo preview must be covered by a spoiler animation
  @override
  InputPageBlockPhoto copyWith({
    InputPhoto? photo,
    PageBlockCaption? caption,
    bool? hasSpoiler,
  }) =>
      InputPageBlockPhoto(
        photo: photo ?? this.photo,
        caption: caption ?? this.caption,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockVideo** *(inputPageBlockVideo)* - child of InputPageBlock
///
/// A video.
///
/// * [video]: The video to be sent.
/// * [caption]: Video caption; pass null if none *(optional)*.
/// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
final class InputPageBlockVideo extends InputPageBlock {
  /// **InputPageBlockVideo** *(inputPageBlockVideo)* - child of InputPageBlock
  ///
  /// A video.
  ///
  /// * [video]: The video to be sent.
  /// * [caption]: Video caption; pass null if none *(optional)*.
  /// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
  const InputPageBlockVideo({
    required this.video,
    this.caption,
    required this.hasSpoiler,
  });

  /// The video to be sent
  final InputVideo video;

  /// Video caption; pass null if none
  final PageBlockCaption? caption;

  /// True, if the video preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory InputPageBlockVideo.fromJson(Map<String, dynamic> json) =>
      InputPageBlockVideo(
        video: InputVideo.fromJson(json['video']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "caption": caption?.toJson(),
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: The video to be sent
  /// * [caption]: Video caption; pass null if none
  /// * [has_spoiler]: True, if the video preview must be covered by a spoiler animation
  @override
  InputPageBlockVideo copyWith({
    InputVideo? video,
    PageBlockCaption? caption,
    bool? hasSpoiler,
  }) =>
      InputPageBlockVideo(
        video: video ?? this.video,
        caption: caption ?? this.caption,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockVoiceNote** *(inputPageBlockVoiceNote)* - child of InputPageBlock
///
/// A voice note.
///
/// * [voiceNote]: The voice note to be sent.
/// * [caption]: Voice note caption; pass null if none *(optional)*.
final class InputPageBlockVoiceNote extends InputPageBlock {
  /// **InputPageBlockVoiceNote** *(inputPageBlockVoiceNote)* - child of InputPageBlock
  ///
  /// A voice note.
  ///
  /// * [voiceNote]: The voice note to be sent.
  /// * [caption]: Voice note caption; pass null if none *(optional)*.
  const InputPageBlockVoiceNote({
    required this.voiceNote,
    this.caption,
  });

  /// The voice note to be sent
  final InputVoiceNote voiceNote;

  /// Voice note caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockVoiceNote.fromJson(Map<String, dynamic> json) =>
      InputPageBlockVoiceNote(
        voiceNote: InputVoiceNote.fromJson(json['voice_note']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote.toJson(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: The voice note to be sent
  /// * [caption]: Voice note caption; pass null if none
  @override
  InputPageBlockVoiceNote copyWith({
    InputVoiceNote? voiceNote,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockCollage** *(inputPageBlockCollage)* - child of InputPageBlock
///
/// A collage.
///
/// * [blocks]: Collage item contents.
/// * [caption]: Block caption; pass null if none *(optional)*.
final class InputPageBlockCollage extends InputPageBlock {
  /// **InputPageBlockCollage** *(inputPageBlockCollage)* - child of InputPageBlock
  ///
  /// A collage.
  ///
  /// * [blocks]: Collage item contents.
  /// * [caption]: Block caption; pass null if none *(optional)*.
  const InputPageBlockCollage({
    required this.blocks,
    this.caption,
  });

  /// Collage item contents
  final List<InputPageBlock> blocks;

  /// Block caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockCollage.fromJson(Map<String, dynamic> json) =>
      InputPageBlockCollage(
        blocks: List<InputPageBlock>.from((json['blocks'] ?? [])
            .map((item) => InputPageBlock.fromJson(item))
            .toList()),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [blocks]: Collage item contents
  /// * [caption]: Block caption; pass null if none
  @override
  InputPageBlockCollage copyWith({
    List<InputPageBlock>? blocks,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockCollage(
        blocks: blocks ?? this.blocks,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockCollage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockSlideshow** *(inputPageBlockSlideshow)* - child of InputPageBlock
///
/// A slideshow.
///
/// * [blocks]: Slideshow item contents.
/// * [caption]: Block caption; pass null if none *(optional)*.
final class InputPageBlockSlideshow extends InputPageBlock {
  /// **InputPageBlockSlideshow** *(inputPageBlockSlideshow)* - child of InputPageBlock
  ///
  /// A slideshow.
  ///
  /// * [blocks]: Slideshow item contents.
  /// * [caption]: Block caption; pass null if none *(optional)*.
  const InputPageBlockSlideshow({
    required this.blocks,
    this.caption,
  });

  /// Slideshow item contents
  final List<InputPageBlock> blocks;

  /// Block caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockSlideshow.fromJson(Map<String, dynamic> json) =>
      InputPageBlockSlideshow(
        blocks: List<InputPageBlock>.from((json['blocks'] ?? [])
            .map((item) => InputPageBlock.fromJson(item))
            .toList()),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [blocks]: Slideshow item contents
  /// * [caption]: Block caption; pass null if none
  @override
  InputPageBlockSlideshow copyWith({
    List<InputPageBlock>? blocks,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockSlideshow(
        blocks: blocks ?? this.blocks,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockSlideshow';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockTable** *(inputPageBlockTable)* - child of InputPageBlock
///
/// A table.
///
/// * [caption]: Table caption.
/// * [cells]: Table cells.
/// * [isBordered]: Pass true if the table is bordered.
/// * [isStriped]: Pass true if the table is striped.
/// * [isCompact]: Pass true if table cells must have smaller indents.
final class InputPageBlockTable extends InputPageBlock {
  /// **InputPageBlockTable** *(inputPageBlockTable)* - child of InputPageBlock
  ///
  /// A table.
  ///
  /// * [caption]: Table caption.
  /// * [cells]: Table cells.
  /// * [isBordered]: Pass true if the table is bordered.
  /// * [isStriped]: Pass true if the table is striped.
  /// * [isCompact]: Pass true if table cells must have smaller indents.
  const InputPageBlockTable({
    required this.caption,
    required this.cells,
    required this.isBordered,
    required this.isStriped,
    required this.isCompact,
  });

  /// Table caption
  final RichText caption;

  /// Table cells
  final List<List<PageBlockTableCell>> cells;

  /// Pass true if the table is bordered
  final bool isBordered;

  /// Pass true if the table is striped
  final bool isStriped;

  /// Pass true if table cells must have smaller indents
  final bool isCompact;

  /// Parse from a json
  factory InputPageBlockTable.fromJson(Map<String, dynamic> json) =>
      InputPageBlockTable(
        caption: RichText.fromJson(json['caption']),
        cells: List<List<PageBlockTableCell>>.from((json['cells'] ?? [])
            .map((item) => List<PageBlockTableCell>.from((item ?? [])
                .map((innerItem) => PageBlockTableCell.fromJson(innerItem))
                .toList()))
            .toList()),
        isBordered: json['is_bordered'],
        isStriped: json['is_striped'],
        isCompact: json['is_compact'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "caption": caption.toJson(),
      "cells": cells.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "is_bordered": isBordered,
      "is_striped": isStriped,
      "is_compact": isCompact,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [caption]: Table caption
  /// * [cells]: Table cells
  /// * [is_bordered]: Pass true if the table is bordered
  /// * [is_striped]: Pass true if the table is striped
  /// * [is_compact]: Pass true if table cells must have smaller indents
  @override
  InputPageBlockTable copyWith({
    RichText? caption,
    List<List<PageBlockTableCell>>? cells,
    bool? isBordered,
    bool? isStriped,
    bool? isCompact,
  }) =>
      InputPageBlockTable(
        caption: caption ?? this.caption,
        cells: cells ?? this.cells,
        isBordered: isBordered ?? this.isBordered,
        isStriped: isStriped ?? this.isStriped,
        isCompact: isCompact ?? this.isCompact,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockTable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockDetails** *(inputPageBlockDetails)* - child of InputPageBlock
///
/// A collapsible block.
///
/// * [header]: Always visible heading for the block.
/// * [blocks]: Block contents.
/// * [isOpen]: True, if the block is open by default.
final class InputPageBlockDetails extends InputPageBlock {
  /// **InputPageBlockDetails** *(inputPageBlockDetails)* - child of InputPageBlock
  ///
  /// A collapsible block.
  ///
  /// * [header]: Always visible heading for the block.
  /// * [blocks]: Block contents.
  /// * [isOpen]: True, if the block is open by default.
  const InputPageBlockDetails({
    required this.header,
    required this.blocks,
    required this.isOpen,
  });

  /// Always visible heading for the block
  final RichText header;

  /// Block contents
  final List<InputPageBlock> blocks;

  /// True, if the block is open by default
  final bool isOpen;

  /// Parse from a json
  factory InputPageBlockDetails.fromJson(Map<String, dynamic> json) =>
      InputPageBlockDetails(
        header: RichText.fromJson(json['header']),
        blocks: List<InputPageBlock>.from((json['blocks'] ?? [])
            .map((item) => InputPageBlock.fromJson(item))
            .toList()),
        isOpen: json['is_open'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "header": header.toJson(),
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "is_open": isOpen,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [header]: Always visible heading for the block
  /// * [blocks]: Block contents
  /// * [is_open]: True, if the block is open by default
  @override
  InputPageBlockDetails copyWith({
    RichText? header,
    List<InputPageBlock>? blocks,
    bool? isOpen,
  }) =>
      InputPageBlockDetails(
        header: header ?? this.header,
        blocks: blocks ?? this.blocks,
        isOpen: isOpen ?? this.isOpen,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockMap** *(inputPageBlockMap)* - child of InputPageBlock
///
/// A map. The map's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
///
/// * [location]: Location of the map center.
/// * [zoom]: Map zoom level; 0-24.
/// * [width]: Map width; 0-10000.
/// * [height]: Map height; 0-10000.
/// * [caption]: Block caption; pass null if none *(optional)*.
final class InputPageBlockMap extends InputPageBlock {
  /// **InputPageBlockMap** *(inputPageBlockMap)* - child of InputPageBlock
  ///
  /// A map. The map's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
  ///
  /// * [location]: Location of the map center.
  /// * [zoom]: Map zoom level; 0-24.
  /// * [width]: Map width; 0-10000.
  /// * [height]: Map height; 0-10000.
  /// * [caption]: Block caption; pass null if none *(optional)*.
  const InputPageBlockMap({
    required this.location,
    required this.zoom,
    required this.width,
    required this.height,
    this.caption,
  });

  /// Location of the map center
  final Location location;

  /// Map zoom level; 0-24
  final int zoom;

  /// Map width; 0-10000
  final int width;

  /// Map height; 0-10000
  final int height;

  /// Block caption; pass null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory InputPageBlockMap.fromJson(Map<String, dynamic> json) =>
      InputPageBlockMap(
        location: Location.fromJson(json['location']),
        zoom: json['zoom'],
        width: json['width'],
        height: json['height'],
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "zoom": zoom,
      "width": width,
      "height": height,
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: Location of the map center
  /// * [zoom]: Map zoom level; 0-24
  /// * [width]: Map width; 0-10000
  /// * [height]: Map height; 0-10000
  /// * [caption]: Block caption; pass null if none
  @override
  InputPageBlockMap copyWith({
    Location? location,
    int? zoom,
    int? width,
    int? height,
    PageBlockCaption? caption,
  }) =>
      InputPageBlockMap(
        location: location ?? this.location,
        zoom: zoom ?? this.zoom,
        width: width ?? this.width,
        height: height ?? this.height,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockMap';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPageBlockButtonRow** *(inputPageBlockButtonRow)* - child of InputPageBlock
///
/// A list of buttons shown in a row.
///
/// * [buttons]: The buttons.
/// * [align]: Horizontal alignment of the buttons; pass null if the buttons must be shown full-width *(optional)*.
final class InputPageBlockButtonRow extends InputPageBlock {
  /// **InputPageBlockButtonRow** *(inputPageBlockButtonRow)* - child of InputPageBlock
  ///
  /// A list of buttons shown in a row.
  ///
  /// * [buttons]: The buttons.
  /// * [align]: Horizontal alignment of the buttons; pass null if the buttons must be shown full-width *(optional)*.
  const InputPageBlockButtonRow({
    required this.buttons,
    this.align,
  });

  /// The buttons
  final List<InlineButton> buttons;

  /// Horizontal alignment of the buttons; pass null if the buttons must be shown full-width
  final PageBlockHorizontalAlignment? align;

  /// Parse from a json
  factory InputPageBlockButtonRow.fromJson(Map<String, dynamic> json) =>
      InputPageBlockButtonRow(
        buttons: List<InlineButton>.from((json['buttons'] ?? [])
            .map((item) => InlineButton.fromJson(item))
            .toList()),
        align: json['align'] == null
            ? null
            : PageBlockHorizontalAlignment.fromJson(json['align']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "buttons": buttons.map((i) => i.toJson()).toList(),
      "align": align?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [buttons]: The buttons
  /// * [align]: Horizontal alignment of the buttons; pass null if the buttons must be shown full-width
  @override
  InputPageBlockButtonRow copyWith({
    List<InlineButton>? buttons,
    PageBlockHorizontalAlignment? align,
  }) =>
      InputPageBlockButtonRow(
        buttons: buttons ?? this.buttons,
        align: align ?? this.align,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPageBlockButtonRow';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
