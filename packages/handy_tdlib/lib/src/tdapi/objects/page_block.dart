part of '../tdapi.dart';

/// **PageBlock** *(pageBlock)* - parent
///
/// Describes a block of an instant view for a web page or a block of a rich message.
sealed class PageBlock extends TdObject {
  /// **PageBlock** *(pageBlock)* - parent
  ///
  /// Describes a block of an instant view for a web page or a block of a rich message.
  const PageBlock();

  /// a PageBlock return type can be :
  /// * [PageBlockTitle]
  /// * [PageBlockSubtitle]
  /// * [PageBlockAuthorDate]
  /// * [PageBlockHeader]
  /// * [PageBlockSubheader]
  /// * [PageBlockSectionHeading]
  /// * [PageBlockKicker]
  /// * [PageBlockParagraph]
  /// * [PageBlockPreformatted]
  /// * [PageBlockFooter]
  /// * [PageBlockThinking]
  /// * [PageBlockDivider]
  /// * [PageBlockMathematicalExpression]
  /// * [PageBlockAnchor]
  /// * [PageBlockList]
  /// * [PageBlockBlockQuote]
  /// * [PageBlockExpandableBlockQuote]
  /// * [PageBlockPullQuote]
  /// * [PageBlockAnimation]
  /// * [PageBlockAudio]
  /// * [PageBlockDocument]
  /// * [PageBlockPhoto]
  /// * [PageBlockVideo]
  /// * [PageBlockVoiceNote]
  /// * [PageBlockCover]
  /// * [PageBlockEmbedded]
  /// * [PageBlockEmbeddedPost]
  /// * [PageBlockCollage]
  /// * [PageBlockSlideshow]
  /// * [PageBlockChatLink]
  /// * [PageBlockTable]
  /// * [PageBlockDetails]
  /// * [PageBlockRelatedArticles]
  /// * [PageBlockMap]
  /// * [PageBlockButtonRow]
  /// * [PageBlockUnsupported]
  factory PageBlock.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PageBlockTitle.defaultObjectId:
        return PageBlockTitle.fromJson(json);
      case PageBlockSubtitle.defaultObjectId:
        return PageBlockSubtitle.fromJson(json);
      case PageBlockAuthorDate.defaultObjectId:
        return PageBlockAuthorDate.fromJson(json);
      case PageBlockHeader.defaultObjectId:
        return PageBlockHeader.fromJson(json);
      case PageBlockSubheader.defaultObjectId:
        return PageBlockSubheader.fromJson(json);
      case PageBlockSectionHeading.defaultObjectId:
        return PageBlockSectionHeading.fromJson(json);
      case PageBlockKicker.defaultObjectId:
        return PageBlockKicker.fromJson(json);
      case PageBlockParagraph.defaultObjectId:
        return PageBlockParagraph.fromJson(json);
      case PageBlockPreformatted.defaultObjectId:
        return PageBlockPreformatted.fromJson(json);
      case PageBlockFooter.defaultObjectId:
        return PageBlockFooter.fromJson(json);
      case PageBlockThinking.defaultObjectId:
        return PageBlockThinking.fromJson(json);
      case PageBlockDivider.defaultObjectId:
        return PageBlockDivider.fromJson(json);
      case PageBlockMathematicalExpression.defaultObjectId:
        return PageBlockMathematicalExpression.fromJson(json);
      case PageBlockAnchor.defaultObjectId:
        return PageBlockAnchor.fromJson(json);
      case PageBlockList.defaultObjectId:
        return PageBlockList.fromJson(json);
      case PageBlockBlockQuote.defaultObjectId:
        return PageBlockBlockQuote.fromJson(json);
      case PageBlockExpandableBlockQuote.defaultObjectId:
        return PageBlockExpandableBlockQuote.fromJson(json);
      case PageBlockPullQuote.defaultObjectId:
        return PageBlockPullQuote.fromJson(json);
      case PageBlockAnimation.defaultObjectId:
        return PageBlockAnimation.fromJson(json);
      case PageBlockAudio.defaultObjectId:
        return PageBlockAudio.fromJson(json);
      case PageBlockDocument.defaultObjectId:
        return PageBlockDocument.fromJson(json);
      case PageBlockPhoto.defaultObjectId:
        return PageBlockPhoto.fromJson(json);
      case PageBlockVideo.defaultObjectId:
        return PageBlockVideo.fromJson(json);
      case PageBlockVoiceNote.defaultObjectId:
        return PageBlockVoiceNote.fromJson(json);
      case PageBlockCover.defaultObjectId:
        return PageBlockCover.fromJson(json);
      case PageBlockEmbedded.defaultObjectId:
        return PageBlockEmbedded.fromJson(json);
      case PageBlockEmbeddedPost.defaultObjectId:
        return PageBlockEmbeddedPost.fromJson(json);
      case PageBlockCollage.defaultObjectId:
        return PageBlockCollage.fromJson(json);
      case PageBlockSlideshow.defaultObjectId:
        return PageBlockSlideshow.fromJson(json);
      case PageBlockChatLink.defaultObjectId:
        return PageBlockChatLink.fromJson(json);
      case PageBlockTable.defaultObjectId:
        return PageBlockTable.fromJson(json);
      case PageBlockDetails.defaultObjectId:
        return PageBlockDetails.fromJson(json);
      case PageBlockRelatedArticles.defaultObjectId:
        return PageBlockRelatedArticles.fromJson(json);
      case PageBlockMap.defaultObjectId:
        return PageBlockMap.fromJson(json);
      case PageBlockButtonRow.defaultObjectId:
        return PageBlockButtonRow.fromJson(json);
      case PageBlockUnsupported.defaultObjectId:
        return PageBlockUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PageBlock)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PageBlock copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlock';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockTitle** *(pageBlockTitle)* - child of PageBlock
///
/// The title of a page; instant view only.
///
/// * [title]: Title.
final class PageBlockTitle extends PageBlock {
  /// **PageBlockTitle** *(pageBlockTitle)* - child of PageBlock
  ///
  /// The title of a page; instant view only.
  ///
  /// * [title]: Title.
  const PageBlockTitle({
    required this.title,
  });

  /// Title
  final RichText title;

  /// Parse from a json
  factory PageBlockTitle.fromJson(Map<String, dynamic> json) => PageBlockTitle(
        title: RichText.fromJson(json['title']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title
  @override
  PageBlockTitle copyWith({
    RichText? title,
  }) =>
      PageBlockTitle(
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockSubtitle** *(pageBlockSubtitle)* - child of PageBlock
///
/// The subtitle of a page; instant view only.
///
/// * [subtitle]: Subtitle.
final class PageBlockSubtitle extends PageBlock {
  /// **PageBlockSubtitle** *(pageBlockSubtitle)* - child of PageBlock
  ///
  /// The subtitle of a page; instant view only.
  ///
  /// * [subtitle]: Subtitle.
  const PageBlockSubtitle({
    required this.subtitle,
  });

  /// Subtitle
  final RichText subtitle;

  /// Parse from a json
  factory PageBlockSubtitle.fromJson(Map<String, dynamic> json) =>
      PageBlockSubtitle(
        subtitle: RichText.fromJson(json['subtitle']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subtitle": subtitle.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subtitle]: Subtitle
  @override
  PageBlockSubtitle copyWith({
    RichText? subtitle,
  }) =>
      PageBlockSubtitle(
        subtitle: subtitle ?? this.subtitle,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockSubtitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockAuthorDate** *(pageBlockAuthorDate)* - child of PageBlock
///
/// The author and publishing date of a page; instant view only.
///
/// * [author]: Author.
/// * [publishDate]: Point in time (Unix timestamp) when the article was published; 0 if unknown.
final class PageBlockAuthorDate extends PageBlock {
  /// **PageBlockAuthorDate** *(pageBlockAuthorDate)* - child of PageBlock
  ///
  /// The author and publishing date of a page; instant view only.
  ///
  /// * [author]: Author.
  /// * [publishDate]: Point in time (Unix timestamp) when the article was published; 0 if unknown.
  const PageBlockAuthorDate({
    required this.author,
    required this.publishDate,
  });

  /// Author
  final RichText author;

  /// Point in time (Unix timestamp) when the article was published; 0 if unknown
  final int publishDate;

  /// Parse from a json
  factory PageBlockAuthorDate.fromJson(Map<String, dynamic> json) =>
      PageBlockAuthorDate(
        author: RichText.fromJson(json['author']),
        publishDate: json['publish_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "author": author.toJson(),
      "publish_date": publishDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [author]: Author
  /// * [publish_date]: Point in time (Unix timestamp) when the article was published; 0 if unknown
  @override
  PageBlockAuthorDate copyWith({
    RichText? author,
    int? publishDate,
  }) =>
      PageBlockAuthorDate(
        author: author ?? this.author,
        publishDate: publishDate ?? this.publishDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockAuthorDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockHeader** *(pageBlockHeader)* - child of PageBlock
///
/// A header; instant view only.
///
/// * [header]: Header.
final class PageBlockHeader extends PageBlock {
  /// **PageBlockHeader** *(pageBlockHeader)* - child of PageBlock
  ///
  /// A header; instant view only.
  ///
  /// * [header]: Header.
  const PageBlockHeader({
    required this.header,
  });

  /// Header
  final RichText header;

  /// Parse from a json
  factory PageBlockHeader.fromJson(Map<String, dynamic> json) =>
      PageBlockHeader(
        header: RichText.fromJson(json['header']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "header": header.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [header]: Header
  @override
  PageBlockHeader copyWith({
    RichText? header,
  }) =>
      PageBlockHeader(
        header: header ?? this.header,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockHeader';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockSubheader** *(pageBlockSubheader)* - child of PageBlock
///
/// A subheader; instant view only.
///
/// * [subheader]: Subheader.
final class PageBlockSubheader extends PageBlock {
  /// **PageBlockSubheader** *(pageBlockSubheader)* - child of PageBlock
  ///
  /// A subheader; instant view only.
  ///
  /// * [subheader]: Subheader.
  const PageBlockSubheader({
    required this.subheader,
  });

  /// Subheader
  final RichText subheader;

  /// Parse from a json
  factory PageBlockSubheader.fromJson(Map<String, dynamic> json) =>
      PageBlockSubheader(
        subheader: RichText.fromJson(json['subheader']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subheader": subheader.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subheader]: Subheader
  @override
  PageBlockSubheader copyWith({
    RichText? subheader,
  }) =>
      PageBlockSubheader(
        subheader: subheader ?? this.subheader,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockSubheader';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockSectionHeading** *(pageBlockSectionHeading)* - child of PageBlock
///
/// A section heading.
///
/// * [text]: Text of the section heading.
/// * [size]: Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest.
final class PageBlockSectionHeading extends PageBlock {
  /// **PageBlockSectionHeading** *(pageBlockSectionHeading)* - child of PageBlock
  ///
  /// A section heading.
  ///
  /// * [text]: Text of the section heading.
  /// * [size]: Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest.
  const PageBlockSectionHeading({
    required this.text,
    required this.size,
  });

  /// Text of the section heading
  final RichText text;

  /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
  final int size;

  /// Parse from a json
  factory PageBlockSectionHeading.fromJson(Map<String, dynamic> json) =>
      PageBlockSectionHeading(
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
  PageBlockSectionHeading copyWith({
    RichText? text,
    int? size,
  }) =>
      PageBlockSectionHeading(
        text: text ?? this.text,
        size: size ?? this.size,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockSectionHeading';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockKicker** *(pageBlockKicker)* - child of PageBlock
///
/// A kicker; instant view only.
///
/// * [kicker]: Kicker.
final class PageBlockKicker extends PageBlock {
  /// **PageBlockKicker** *(pageBlockKicker)* - child of PageBlock
  ///
  /// A kicker; instant view only.
  ///
  /// * [kicker]: Kicker.
  const PageBlockKicker({
    required this.kicker,
  });

  /// Kicker
  final RichText kicker;

  /// Parse from a json
  factory PageBlockKicker.fromJson(Map<String, dynamic> json) =>
      PageBlockKicker(
        kicker: RichText.fromJson(json['kicker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "kicker": kicker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [kicker]: Kicker
  @override
  PageBlockKicker copyWith({
    RichText? kicker,
  }) =>
      PageBlockKicker(
        kicker: kicker ?? this.kicker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockKicker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockParagraph** *(pageBlockParagraph)* - child of PageBlock
///
/// A text paragraph.
///
/// * [text]: Paragraph text.
final class PageBlockParagraph extends PageBlock {
  /// **PageBlockParagraph** *(pageBlockParagraph)* - child of PageBlock
  ///
  /// A text paragraph.
  ///
  /// * [text]: Paragraph text.
  const PageBlockParagraph({
    required this.text,
  });

  /// Paragraph text
  final RichText text;

  /// Parse from a json
  factory PageBlockParagraph.fromJson(Map<String, dynamic> json) =>
      PageBlockParagraph(
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
  PageBlockParagraph copyWith({
    RichText? text,
  }) =>
      PageBlockParagraph(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockParagraph';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockPreformatted** *(pageBlockPreformatted)* - child of PageBlock
///
/// A preformatted text paragraph.
///
/// * [text]: Paragraph text.
/// * [language]: Programming language for which the text needs to be formatted.
final class PageBlockPreformatted extends PageBlock {
  /// **PageBlockPreformatted** *(pageBlockPreformatted)* - child of PageBlock
  ///
  /// A preformatted text paragraph.
  ///
  /// * [text]: Paragraph text.
  /// * [language]: Programming language for which the text needs to be formatted.
  const PageBlockPreformatted({
    required this.text,
    required this.language,
  });

  /// Paragraph text
  final RichText text;

  /// Programming language for which the text needs to be formatted
  final String language;

  /// Parse from a json
  factory PageBlockPreformatted.fromJson(Map<String, dynamic> json) =>
      PageBlockPreformatted(
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
  PageBlockPreformatted copyWith({
    RichText? text,
    String? language,
  }) =>
      PageBlockPreformatted(
        text: text ?? this.text,
        language: language ?? this.language,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockPreformatted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockFooter** *(pageBlockFooter)* - child of PageBlock
///
/// The footer of a page.
///
/// * [footer]: Footer.
final class PageBlockFooter extends PageBlock {
  /// **PageBlockFooter** *(pageBlockFooter)* - child of PageBlock
  ///
  /// The footer of a page.
  ///
  /// * [footer]: Footer.
  const PageBlockFooter({
    required this.footer,
  });

  /// Footer
  final RichText footer;

  /// Parse from a json
  factory PageBlockFooter.fromJson(Map<String, dynamic> json) =>
      PageBlockFooter(
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
  PageBlockFooter copyWith({
    RichText? footer,
  }) =>
      PageBlockFooter(
        footer: footer ?? this.footer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockFooter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockThinking** *(pageBlockThinking)* - child of PageBlock
///
/// A "Thinking..." placeholder; for pending rich messages only.
///
/// * [text]: Text of the placeholder.
final class PageBlockThinking extends PageBlock {
  /// **PageBlockThinking** *(pageBlockThinking)* - child of PageBlock
  ///
  /// A "Thinking..." placeholder; for pending rich messages only.
  ///
  /// * [text]: Text of the placeholder.
  const PageBlockThinking({
    required this.text,
  });

  /// Text of the placeholder
  final RichText text;

  /// Parse from a json
  factory PageBlockThinking.fromJson(Map<String, dynamic> json) =>
      PageBlockThinking(
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
  PageBlockThinking copyWith({
    RichText? text,
  }) =>
      PageBlockThinking(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockThinking';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockDivider** *(pageBlockDivider)* - child of PageBlock
///
/// An empty block separating a page.
final class PageBlockDivider extends PageBlock {
  /// **PageBlockDivider** *(pageBlockDivider)* - child of PageBlock
  ///
  /// An empty block separating a page.
  const PageBlockDivider();

  /// Parse from a json
  factory PageBlockDivider.fromJson(Map<String, dynamic> json) =>
      const PageBlockDivider();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockDivider copyWith() => const PageBlockDivider();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockDivider';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockMathematicalExpression** *(pageBlockMathematicalExpression)* - child of PageBlock
///
/// A mathematical expression.
///
/// * [expression]: The expression in LaTeX format.
final class PageBlockMathematicalExpression extends PageBlock {
  /// **PageBlockMathematicalExpression** *(pageBlockMathematicalExpression)* - child of PageBlock
  ///
  /// A mathematical expression.
  ///
  /// * [expression]: The expression in LaTeX format.
  const PageBlockMathematicalExpression({
    required this.expression,
  });

  /// The expression in LaTeX format
  final String expression;

  /// Parse from a json
  factory PageBlockMathematicalExpression.fromJson(Map<String, dynamic> json) =>
      PageBlockMathematicalExpression(
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
  PageBlockMathematicalExpression copyWith({
    String? expression,
  }) =>
      PageBlockMathematicalExpression(
        expression: expression ?? this.expression,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockMathematicalExpression';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockAnchor** *(pageBlockAnchor)* - child of PageBlock
///
/// An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor.
///
/// * [name]: Name of the anchor.
final class PageBlockAnchor extends PageBlock {
  /// **PageBlockAnchor** *(pageBlockAnchor)* - child of PageBlock
  ///
  /// An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor.
  ///
  /// * [name]: Name of the anchor.
  const PageBlockAnchor({
    required this.name,
  });

  /// Name of the anchor
  final String name;

  /// Parse from a json
  factory PageBlockAnchor.fromJson(Map<String, dynamic> json) =>
      PageBlockAnchor(
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
  PageBlockAnchor copyWith({
    String? name,
  }) =>
      PageBlockAnchor(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockAnchor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockList** *(pageBlockList)* - child of PageBlock
///
/// A list of data blocks.
///
/// * [items]: The items of the list.
final class PageBlockList extends PageBlock {
  /// **PageBlockList** *(pageBlockList)* - child of PageBlock
  ///
  /// A list of data blocks.
  ///
  /// * [items]: The items of the list.
  const PageBlockList({
    required this.items,
  });

  /// The items of the list
  final List<PageBlockListItem> items;

  /// Parse from a json
  factory PageBlockList.fromJson(Map<String, dynamic> json) => PageBlockList(
        items: List<PageBlockListItem>.from((json['items'] ?? [])
            .map((item) => PageBlockListItem.fromJson(item))
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
  PageBlockList copyWith({
    List<PageBlockListItem>? items,
  }) =>
      PageBlockList(
        items: items ?? this.items,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockBlockQuote** *(pageBlockBlockQuote)* - child of PageBlock
///
/// A block quote.
///
/// * [blocks]: Quote blocks.
/// * [credit]: Quote credit; may be null if none *(optional)*.
final class PageBlockBlockQuote extends PageBlock {
  /// **PageBlockBlockQuote** *(pageBlockBlockQuote)* - child of PageBlock
  ///
  /// A block quote.
  ///
  /// * [blocks]: Quote blocks.
  /// * [credit]: Quote credit; may be null if none *(optional)*.
  const PageBlockBlockQuote({
    required this.blocks,
    this.credit,
  });

  /// Quote blocks
  final List<PageBlock> blocks;

  /// Quote credit; may be null if none
  final RichText? credit;

  /// Parse from a json
  factory PageBlockBlockQuote.fromJson(Map<String, dynamic> json) =>
      PageBlockBlockQuote(
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
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
  /// * [credit]: Quote credit; may be null if none
  @override
  PageBlockBlockQuote copyWith({
    List<PageBlock>? blocks,
    RichText? credit,
  }) =>
      PageBlockBlockQuote(
        blocks: blocks ?? this.blocks,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockExpandableBlockQuote** *(pageBlockExpandableBlockQuote)* - child of PageBlock
///
/// An expandable block quote.
///
/// * [text]: Text of the quote.
/// * [credit]: Quote credit; may be null if none *(optional)*.
final class PageBlockExpandableBlockQuote extends PageBlock {
  /// **PageBlockExpandableBlockQuote** *(pageBlockExpandableBlockQuote)* - child of PageBlock
  ///
  /// An expandable block quote.
  ///
  /// * [text]: Text of the quote.
  /// * [credit]: Quote credit; may be null if none *(optional)*.
  const PageBlockExpandableBlockQuote({
    required this.text,
    this.credit,
  });

  /// Text of the quote
  final RichText text;

  /// Quote credit; may be null if none
  final RichText? credit;

  /// Parse from a json
  factory PageBlockExpandableBlockQuote.fromJson(Map<String, dynamic> json) =>
      PageBlockExpandableBlockQuote(
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
  /// * [text]: Text of the quote
  /// * [credit]: Quote credit; may be null if none
  @override
  PageBlockExpandableBlockQuote copyWith({
    RichText? text,
    RichText? credit,
  }) =>
      PageBlockExpandableBlockQuote(
        text: text ?? this.text,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockExpandableBlockQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockPullQuote** *(pageBlockPullQuote)* - child of PageBlock
///
/// A pull quote.
///
/// * [text]: Quote text.
/// * [credit]: Quote credit; may be null if none *(optional)*.
final class PageBlockPullQuote extends PageBlock {
  /// **PageBlockPullQuote** *(pageBlockPullQuote)* - child of PageBlock
  ///
  /// A pull quote.
  ///
  /// * [text]: Quote text.
  /// * [credit]: Quote credit; may be null if none *(optional)*.
  const PageBlockPullQuote({
    required this.text,
    this.credit,
  });

  /// Quote text
  final RichText text;

  /// Quote credit; may be null if none
  final RichText? credit;

  /// Parse from a json
  factory PageBlockPullQuote.fromJson(Map<String, dynamic> json) =>
      PageBlockPullQuote(
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
  /// * [credit]: Quote credit; may be null if none
  @override
  PageBlockPullQuote copyWith({
    RichText? text,
    RichText? credit,
  }) =>
      PageBlockPullQuote(
        text: text ?? this.text,
        credit: credit ?? this.credit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockPullQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockAnimation** *(pageBlockAnimation)* - child of PageBlock
///
/// An animation.
///
/// * [animation]: Animation file; may be null *(optional)*.
/// * [caption]: Animation caption; may be null if none *(optional)*.
/// * [needAutoplay]: True, if the animation must be played automatically.
/// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
final class PageBlockAnimation extends PageBlock {
  /// **PageBlockAnimation** *(pageBlockAnimation)* - child of PageBlock
  ///
  /// An animation.
  ///
  /// * [animation]: Animation file; may be null *(optional)*.
  /// * [caption]: Animation caption; may be null if none *(optional)*.
  /// * [needAutoplay]: True, if the animation must be played automatically.
  /// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
  const PageBlockAnimation({
    this.animation,
    this.caption,
    required this.needAutoplay,
    required this.hasSpoiler,
  });

  /// Animation file; may be null
  final Animation? animation;

  /// Animation caption; may be null if none
  final PageBlockCaption? caption;

  /// True, if the animation must be played automatically
  final bool needAutoplay;

  /// True, if the animation preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory PageBlockAnimation.fromJson(Map<String, dynamic> json) =>
      PageBlockAnimation(
        animation: json['animation'] == null
            ? null
            : Animation.fromJson(json['animation']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        needAutoplay: json['need_autoplay'],
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation?.toJson(),
      "caption": caption?.toJson(),
      "need_autoplay": needAutoplay,
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: Animation file; may be null
  /// * [caption]: Animation caption; may be null if none
  /// * [need_autoplay]: True, if the animation must be played automatically
  /// * [has_spoiler]: True, if the animation preview must be covered by a spoiler animation
  @override
  PageBlockAnimation copyWith({
    Animation? animation,
    PageBlockCaption? caption,
    bool? needAutoplay,
    bool? hasSpoiler,
  }) =>
      PageBlockAnimation(
        animation: animation ?? this.animation,
        caption: caption ?? this.caption,
        needAutoplay: needAutoplay ?? this.needAutoplay,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockAudio** *(pageBlockAudio)* - child of PageBlock
///
/// An audio file.
///
/// * [audio]: Audio file.
/// * [caption]: Audio file caption; may be null if none *(optional)*.
final class PageBlockAudio extends PageBlock {
  /// **PageBlockAudio** *(pageBlockAudio)* - child of PageBlock
  ///
  /// An audio file.
  ///
  /// * [audio]: Audio file.
  /// * [caption]: Audio file caption; may be null if none *(optional)*.
  const PageBlockAudio({
    required this.audio,
    this.caption,
  });

  /// Audio file
  final Audio audio;

  /// Audio file caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockAudio.fromJson(Map<String, dynamic> json) => PageBlockAudio(
        audio: Audio.fromJson(json['audio']),
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
  /// * [audio]: Audio file
  /// * [caption]: Audio file caption; may be null if none
  @override
  PageBlockAudio copyWith({
    Audio? audio,
    PageBlockCaption? caption,
  }) =>
      PageBlockAudio(
        audio: audio ?? this.audio,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockDocument** *(pageBlockDocument)* - child of PageBlock
///
/// A general file.
///
/// * [document]: The file.
/// * [caption]: File caption; may be null if none *(optional)*.
final class PageBlockDocument extends PageBlock {
  /// **PageBlockDocument** *(pageBlockDocument)* - child of PageBlock
  ///
  /// A general file.
  ///
  /// * [document]: The file.
  /// * [caption]: File caption; may be null if none *(optional)*.
  const PageBlockDocument({
    required this.document,
    this.caption,
  });

  /// The file
  final Document document;

  /// File caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockDocument.fromJson(Map<String, dynamic> json) =>
      PageBlockDocument(
        document: Document.fromJson(json['document']),
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
  /// * [document]: The file
  /// * [caption]: File caption; may be null if none
  @override
  PageBlockDocument copyWith({
    Document? document,
    PageBlockCaption? caption,
  }) =>
      PageBlockDocument(
        document: document ?? this.document,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockPhoto** *(pageBlockPhoto)* - child of PageBlock
///
/// A photo.
///
/// * [photo]: Photo file; may be null *(optional)*.
/// * [caption]: Photo caption; may be null if none *(optional)*.
/// * [url]: URL that needs to be opened when the photo is clicked; instant view only.
/// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
final class PageBlockPhoto extends PageBlock {
  /// **PageBlockPhoto** *(pageBlockPhoto)* - child of PageBlock
  ///
  /// A photo.
  ///
  /// * [photo]: Photo file; may be null *(optional)*.
  /// * [caption]: Photo caption; may be null if none *(optional)*.
  /// * [url]: URL that needs to be opened when the photo is clicked; instant view only.
  /// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
  const PageBlockPhoto({
    this.photo,
    this.caption,
    required this.url,
    required this.hasSpoiler,
  });

  /// Photo file; may be null
  final Photo? photo;

  /// Photo caption; may be null if none
  final PageBlockCaption? caption;

  /// URL that needs to be opened when the photo is clicked; instant view only
  final String url;

  /// True, if the photo preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory PageBlockPhoto.fromJson(Map<String, dynamic> json) => PageBlockPhoto(
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        url: json['url'],
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
      "caption": caption?.toJson(),
      "url": url,
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo file; may be null
  /// * [caption]: Photo caption; may be null if none
  /// * [url]: URL that needs to be opened when the photo is clicked; instant view only
  /// * [has_spoiler]: True, if the photo preview must be covered by a spoiler animation
  @override
  PageBlockPhoto copyWith({
    Photo? photo,
    PageBlockCaption? caption,
    String? url,
    bool? hasSpoiler,
  }) =>
      PageBlockPhoto(
        photo: photo ?? this.photo,
        caption: caption ?? this.caption,
        url: url ?? this.url,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockVideo** *(pageBlockVideo)* - child of PageBlock
///
/// A video.
///
/// * [video]: Video file; may be null *(optional)*.
/// * [caption]: Video caption; may be null if none *(optional)*.
/// * [needAutoplay]: True, if the video must be played automatically.
/// * [isLooped]: True, if the video must be looped.
/// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
final class PageBlockVideo extends PageBlock {
  /// **PageBlockVideo** *(pageBlockVideo)* - child of PageBlock
  ///
  /// A video.
  ///
  /// * [video]: Video file; may be null *(optional)*.
  /// * [caption]: Video caption; may be null if none *(optional)*.
  /// * [needAutoplay]: True, if the video must be played automatically.
  /// * [isLooped]: True, if the video must be looped.
  /// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
  const PageBlockVideo({
    this.video,
    this.caption,
    required this.needAutoplay,
    required this.isLooped,
    required this.hasSpoiler,
  });

  /// Video file; may be null
  final Video? video;

  /// Video caption; may be null if none
  final PageBlockCaption? caption;

  /// True, if the video must be played automatically
  final bool needAutoplay;

  /// True, if the video must be looped
  final bool isLooped;

  /// True, if the video preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// Parse from a json
  factory PageBlockVideo.fromJson(Map<String, dynamic> json) => PageBlockVideo(
        video: json['video'] == null ? null : Video.fromJson(json['video']),
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        needAutoplay: json['need_autoplay'],
        isLooped: json['is_looped'],
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video?.toJson(),
      "caption": caption?.toJson(),
      "need_autoplay": needAutoplay,
      "is_looped": isLooped,
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Video file; may be null
  /// * [caption]: Video caption; may be null if none
  /// * [need_autoplay]: True, if the video must be played automatically
  /// * [is_looped]: True, if the video must be looped
  /// * [has_spoiler]: True, if the video preview must be covered by a spoiler animation
  @override
  PageBlockVideo copyWith({
    Video? video,
    PageBlockCaption? caption,
    bool? needAutoplay,
    bool? isLooped,
    bool? hasSpoiler,
  }) =>
      PageBlockVideo(
        video: video ?? this.video,
        caption: caption ?? this.caption,
        needAutoplay: needAutoplay ?? this.needAutoplay,
        isLooped: isLooped ?? this.isLooped,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockVoiceNote** *(pageBlockVoiceNote)* - child of PageBlock
///
/// A voice note.
///
/// * [voiceNote]: Voice note.
/// * [caption]: Voice note caption; may be null if none *(optional)*.
final class PageBlockVoiceNote extends PageBlock {
  /// **PageBlockVoiceNote** *(pageBlockVoiceNote)* - child of PageBlock
  ///
  /// A voice note.
  ///
  /// * [voiceNote]: Voice note.
  /// * [caption]: Voice note caption; may be null if none *(optional)*.
  const PageBlockVoiceNote({
    required this.voiceNote,
    this.caption,
  });

  /// Voice note
  final VoiceNote voiceNote;

  /// Voice note caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockVoiceNote.fromJson(Map<String, dynamic> json) =>
      PageBlockVoiceNote(
        voiceNote: VoiceNote.fromJson(json['voice_note']),
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
  /// * [voice_note]: Voice note
  /// * [caption]: Voice note caption; may be null if none
  @override
  PageBlockVoiceNote copyWith({
    VoiceNote? voiceNote,
    PageBlockCaption? caption,
  }) =>
      PageBlockVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockCover** *(pageBlockCover)* - child of PageBlock
///
/// A page cover; instant view only.
///
/// * [cover]: Cover.
final class PageBlockCover extends PageBlock {
  /// **PageBlockCover** *(pageBlockCover)* - child of PageBlock
  ///
  /// A page cover; instant view only.
  ///
  /// * [cover]: Cover.
  const PageBlockCover({
    required this.cover,
  });

  /// Cover
  final PageBlock cover;

  /// Parse from a json
  factory PageBlockCover.fromJson(Map<String, dynamic> json) => PageBlockCover(
        cover: PageBlock.fromJson(json['cover']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "cover": cover.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [cover]: Cover
  @override
  PageBlockCover copyWith({
    PageBlock? cover,
  }) =>
      PageBlockCover(
        cover: cover ?? this.cover,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockCover';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockEmbedded** *(pageBlockEmbedded)* - child of PageBlock
///
/// An embedded web page; instant view only.
///
/// * [url]: URL of the embedded page, if available.
/// * [html]: HTML-markup of the embedded page.
/// * [posterPhoto]: Poster photo, if available; may be null *(optional)*.
/// * [width]: Block width; 0 if unknown.
/// * [height]: Block height; 0 if unknown.
/// * [caption]: Block caption; may be null if none *(optional)*.
/// * [isFullWidth]: True, if the block must be full width.
/// * [allowScrolling]: True, if scrolling needs to be allowed.
final class PageBlockEmbedded extends PageBlock {
  /// **PageBlockEmbedded** *(pageBlockEmbedded)* - child of PageBlock
  ///
  /// An embedded web page; instant view only.
  ///
  /// * [url]: URL of the embedded page, if available.
  /// * [html]: HTML-markup of the embedded page.
  /// * [posterPhoto]: Poster photo, if available; may be null *(optional)*.
  /// * [width]: Block width; 0 if unknown.
  /// * [height]: Block height; 0 if unknown.
  /// * [caption]: Block caption; may be null if none *(optional)*.
  /// * [isFullWidth]: True, if the block must be full width.
  /// * [allowScrolling]: True, if scrolling needs to be allowed.
  const PageBlockEmbedded({
    required this.url,
    required this.html,
    this.posterPhoto,
    required this.width,
    required this.height,
    this.caption,
    required this.isFullWidth,
    required this.allowScrolling,
  });

  /// URL of the embedded page, if available
  final String url;

  /// HTML-markup of the embedded page
  final String html;

  /// Poster photo, if available; may be null
  final Photo? posterPhoto;

  /// Block width; 0 if unknown
  final int width;

  /// Block height; 0 if unknown
  final int height;

  /// Block caption; may be null if none
  final PageBlockCaption? caption;

  /// True, if the block must be full width
  final bool isFullWidth;

  /// True, if scrolling needs to be allowed
  final bool allowScrolling;

  /// Parse from a json
  factory PageBlockEmbedded.fromJson(Map<String, dynamic> json) =>
      PageBlockEmbedded(
        url: json['url'],
        html: json['html'],
        posterPhoto: json['poster_photo'] == null
            ? null
            : Photo.fromJson(json['poster_photo']),
        width: json['width'],
        height: json['height'],
        caption: json['caption'] == null
            ? null
            : PageBlockCaption.fromJson(json['caption']),
        isFullWidth: json['is_full_width'],
        allowScrolling: json['allow_scrolling'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "html": html,
      "poster_photo": posterPhoto?.toJson(),
      "width": width,
      "height": height,
      "caption": caption?.toJson(),
      "is_full_width": isFullWidth,
      "allow_scrolling": allowScrolling,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the embedded page, if available
  /// * [html]: HTML-markup of the embedded page
  /// * [poster_photo]: Poster photo, if available; may be null
  /// * [width]: Block width; 0 if unknown
  /// * [height]: Block height; 0 if unknown
  /// * [caption]: Block caption; may be null if none
  /// * [is_full_width]: True, if the block must be full width
  /// * [allow_scrolling]: True, if scrolling needs to be allowed
  @override
  PageBlockEmbedded copyWith({
    String? url,
    String? html,
    Photo? posterPhoto,
    int? width,
    int? height,
    PageBlockCaption? caption,
    bool? isFullWidth,
    bool? allowScrolling,
  }) =>
      PageBlockEmbedded(
        url: url ?? this.url,
        html: html ?? this.html,
        posterPhoto: posterPhoto ?? this.posterPhoto,
        width: width ?? this.width,
        height: height ?? this.height,
        caption: caption ?? this.caption,
        isFullWidth: isFullWidth ?? this.isFullWidth,
        allowScrolling: allowScrolling ?? this.allowScrolling,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockEmbedded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockEmbeddedPost** *(pageBlockEmbeddedPost)* - child of PageBlock
///
/// An embedded post; instant view only.
///
/// * [url]: URL of the embedded post.
/// * [author]: Post author.
/// * [authorPhoto]: Post author photo; may be null *(optional)*.
/// * [date]: Point in time (Unix timestamp) when the post was created; 0 if unknown.
/// * [blocks]: Post content.
/// * [caption]: Post caption; may be null if none *(optional)*.
final class PageBlockEmbeddedPost extends PageBlock {
  /// **PageBlockEmbeddedPost** *(pageBlockEmbeddedPost)* - child of PageBlock
  ///
  /// An embedded post; instant view only.
  ///
  /// * [url]: URL of the embedded post.
  /// * [author]: Post author.
  /// * [authorPhoto]: Post author photo; may be null *(optional)*.
  /// * [date]: Point in time (Unix timestamp) when the post was created; 0 if unknown.
  /// * [blocks]: Post content.
  /// * [caption]: Post caption; may be null if none *(optional)*.
  const PageBlockEmbeddedPost({
    required this.url,
    required this.author,
    this.authorPhoto,
    required this.date,
    required this.blocks,
    this.caption,
  });

  /// URL of the embedded post
  final String url;

  /// Post author
  final String author;

  /// Post author photo; may be null
  final Photo? authorPhoto;

  /// Point in time (Unix timestamp) when the post was created; 0 if unknown
  final int date;

  /// Post content
  final List<PageBlock> blocks;

  /// Post caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockEmbeddedPost.fromJson(Map<String, dynamic> json) =>
      PageBlockEmbeddedPost(
        url: json['url'],
        author: json['author'],
        authorPhoto: json['author_photo'] == null
            ? null
            : Photo.fromJson(json['author_photo']),
        date: json['date'],
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
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
      "url": url,
      "author": author,
      "author_photo": authorPhoto?.toJson(),
      "date": date,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the embedded post
  /// * [author]: Post author
  /// * [author_photo]: Post author photo; may be null
  /// * [date]: Point in time (Unix timestamp) when the post was created; 0 if unknown
  /// * [blocks]: Post content
  /// * [caption]: Post caption; may be null if none
  @override
  PageBlockEmbeddedPost copyWith({
    String? url,
    String? author,
    Photo? authorPhoto,
    int? date,
    List<PageBlock>? blocks,
    PageBlockCaption? caption,
  }) =>
      PageBlockEmbeddedPost(
        url: url ?? this.url,
        author: author ?? this.author,
        authorPhoto: authorPhoto ?? this.authorPhoto,
        date: date ?? this.date,
        blocks: blocks ?? this.blocks,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockEmbeddedPost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockCollage** *(pageBlockCollage)* - child of PageBlock
///
/// A collage.
///
/// * [blocks]: Collage item contents.
/// * [caption]: Block caption; may be null if none *(optional)*.
final class PageBlockCollage extends PageBlock {
  /// **PageBlockCollage** *(pageBlockCollage)* - child of PageBlock
  ///
  /// A collage.
  ///
  /// * [blocks]: Collage item contents.
  /// * [caption]: Block caption; may be null if none *(optional)*.
  const PageBlockCollage({
    required this.blocks,
    this.caption,
  });

  /// Collage item contents
  final List<PageBlock> blocks;

  /// Block caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockCollage.fromJson(Map<String, dynamic> json) =>
      PageBlockCollage(
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
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
  /// * [caption]: Block caption; may be null if none
  @override
  PageBlockCollage copyWith({
    List<PageBlock>? blocks,
    PageBlockCaption? caption,
  }) =>
      PageBlockCollage(
        blocks: blocks ?? this.blocks,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockCollage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockSlideshow** *(pageBlockSlideshow)* - child of PageBlock
///
/// A slideshow.
///
/// * [blocks]: Slideshow item contents.
/// * [caption]: Block caption; may be null if none *(optional)*.
final class PageBlockSlideshow extends PageBlock {
  /// **PageBlockSlideshow** *(pageBlockSlideshow)* - child of PageBlock
  ///
  /// A slideshow.
  ///
  /// * [blocks]: Slideshow item contents.
  /// * [caption]: Block caption; may be null if none *(optional)*.
  const PageBlockSlideshow({
    required this.blocks,
    this.caption,
  });

  /// Slideshow item contents
  final List<PageBlock> blocks;

  /// Block caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockSlideshow.fromJson(Map<String, dynamic> json) =>
      PageBlockSlideshow(
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
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
  /// * [caption]: Block caption; may be null if none
  @override
  PageBlockSlideshow copyWith({
    List<PageBlock>? blocks,
    PageBlockCaption? caption,
  }) =>
      PageBlockSlideshow(
        blocks: blocks ?? this.blocks,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockSlideshow';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockChatLink** *(pageBlockChatLink)* - child of PageBlock
///
/// A link to a chat; instant view only.
///
/// * [title]: Chat title.
/// * [photo]: Chat photo; may be null *(optional)*.
/// * [accentColorId]: Identifier of the accent color for chat title and background of chat photo.
/// * [username]: Chat username by which all other information about the chat can be resolved.
final class PageBlockChatLink extends PageBlock {
  /// **PageBlockChatLink** *(pageBlockChatLink)* - child of PageBlock
  ///
  /// A link to a chat; instant view only.
  ///
  /// * [title]: Chat title.
  /// * [photo]: Chat photo; may be null *(optional)*.
  /// * [accentColorId]: Identifier of the accent color for chat title and background of chat photo.
  /// * [username]: Chat username by which all other information about the chat can be resolved.
  const PageBlockChatLink({
    required this.title,
    this.photo,
    required this.accentColorId,
    required this.username,
  });

  /// Chat title
  final String title;

  /// Chat photo; may be null
  final ChatPhotoInfo? photo;

  /// Identifier of the accent color for chat title and background of chat photo
  final int accentColorId;

  /// Chat username by which all other information about the chat can be resolved
  final String username;

  /// Parse from a json
  factory PageBlockChatLink.fromJson(Map<String, dynamic> json) =>
      PageBlockChatLink(
        title: json['title'],
        photo: json['photo'] == null
            ? null
            : ChatPhotoInfo.fromJson(json['photo']),
        accentColorId: json['accent_color_id'],
        username: json['username'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "photo": photo?.toJson(),
      "accent_color_id": accentColorId,
      "username": username,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Chat title
  /// * [photo]: Chat photo; may be null
  /// * [accent_color_id]: Identifier of the accent color for chat title and background of chat photo
  /// * [username]: Chat username by which all other information about the chat can be resolved
  @override
  PageBlockChatLink copyWith({
    String? title,
    ChatPhotoInfo? photo,
    int? accentColorId,
    String? username,
  }) =>
      PageBlockChatLink(
        title: title ?? this.title,
        photo: photo ?? this.photo,
        accentColorId: accentColorId ?? this.accentColorId,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockTable** *(pageBlockTable)* - child of PageBlock
///
/// A table.
///
/// * [caption]: Table caption; may be null if none *(optional)*.
/// * [cells]: Table cells.
/// * [isBordered]: True, if the table is bordered.
/// * [isStriped]: True, if the table is striped.
/// * [isCompact]: True, if table cells must have smaller indents.
final class PageBlockTable extends PageBlock {
  /// **PageBlockTable** *(pageBlockTable)* - child of PageBlock
  ///
  /// A table.
  ///
  /// * [caption]: Table caption; may be null if none *(optional)*.
  /// * [cells]: Table cells.
  /// * [isBordered]: True, if the table is bordered.
  /// * [isStriped]: True, if the table is striped.
  /// * [isCompact]: True, if table cells must have smaller indents.
  const PageBlockTable({
    this.caption,
    required this.cells,
    required this.isBordered,
    required this.isStriped,
    required this.isCompact,
  });

  /// Table caption; may be null if none
  final RichText? caption;

  /// Table cells
  final List<List<PageBlockTableCell>> cells;

  /// True, if the table is bordered
  final bool isBordered;

  /// True, if the table is striped
  final bool isStriped;

  /// True, if table cells must have smaller indents
  final bool isCompact;

  /// Parse from a json
  factory PageBlockTable.fromJson(Map<String, dynamic> json) => PageBlockTable(
        caption:
            json['caption'] == null ? null : RichText.fromJson(json['caption']),
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
      "caption": caption?.toJson(),
      "cells": cells.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "is_bordered": isBordered,
      "is_striped": isStriped,
      "is_compact": isCompact,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [caption]: Table caption; may be null if none
  /// * [cells]: Table cells
  /// * [is_bordered]: True, if the table is bordered
  /// * [is_striped]: True, if the table is striped
  /// * [is_compact]: True, if table cells must have smaller indents
  @override
  PageBlockTable copyWith({
    RichText? caption,
    List<List<PageBlockTableCell>>? cells,
    bool? isBordered,
    bool? isStriped,
    bool? isCompact,
  }) =>
      PageBlockTable(
        caption: caption ?? this.caption,
        cells: cells ?? this.cells,
        isBordered: isBordered ?? this.isBordered,
        isStriped: isStriped ?? this.isStriped,
        isCompact: isCompact ?? this.isCompact,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockTable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockDetails** *(pageBlockDetails)* - child of PageBlock
///
/// A collapsible block.
///
/// * [header]: Always visible heading for the block.
/// * [blocks]: Block contents.
/// * [isOpen]: True, if the block is open by default.
final class PageBlockDetails extends PageBlock {
  /// **PageBlockDetails** *(pageBlockDetails)* - child of PageBlock
  ///
  /// A collapsible block.
  ///
  /// * [header]: Always visible heading for the block.
  /// * [blocks]: Block contents.
  /// * [isOpen]: True, if the block is open by default.
  const PageBlockDetails({
    required this.header,
    required this.blocks,
    required this.isOpen,
  });

  /// Always visible heading for the block
  final RichText header;

  /// Block contents
  final List<PageBlock> blocks;

  /// True, if the block is open by default
  final bool isOpen;

  /// Parse from a json
  factory PageBlockDetails.fromJson(Map<String, dynamic> json) =>
      PageBlockDetails(
        header: RichText.fromJson(json['header']),
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
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
  PageBlockDetails copyWith({
    RichText? header,
    List<PageBlock>? blocks,
    bool? isOpen,
  }) =>
      PageBlockDetails(
        header: header ?? this.header,
        blocks: blocks ?? this.blocks,
        isOpen: isOpen ?? this.isOpen,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockRelatedArticles** *(pageBlockRelatedArticles)* - child of PageBlock
///
/// Related articles; instant view only.
///
/// * [header]: Block header.
/// * [articles]: List of related articles.
final class PageBlockRelatedArticles extends PageBlock {
  /// **PageBlockRelatedArticles** *(pageBlockRelatedArticles)* - child of PageBlock
  ///
  /// Related articles; instant view only.
  ///
  /// * [header]: Block header.
  /// * [articles]: List of related articles.
  const PageBlockRelatedArticles({
    required this.header,
    required this.articles,
  });

  /// Block header
  final RichText header;

  /// List of related articles
  final List<PageBlockRelatedArticle> articles;

  /// Parse from a json
  factory PageBlockRelatedArticles.fromJson(Map<String, dynamic> json) =>
      PageBlockRelatedArticles(
        header: RichText.fromJson(json['header']),
        articles: List<PageBlockRelatedArticle>.from((json['articles'] ?? [])
            .map((item) => PageBlockRelatedArticle.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "header": header.toJson(),
      "articles": articles.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [header]: Block header
  /// * [articles]: List of related articles
  @override
  PageBlockRelatedArticles copyWith({
    RichText? header,
    List<PageBlockRelatedArticle>? articles,
  }) =>
      PageBlockRelatedArticles(
        header: header ?? this.header,
        articles: articles ?? this.articles,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockRelatedArticles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockMap** *(pageBlockMap)* - child of PageBlock
///
/// A map.
///
/// * [location]: Location of the map center.
/// * [zoom]: Map zoom level.
/// * [width]: Map width.
/// * [height]: Map height.
/// * [caption]: Block caption; may be null if none *(optional)*.
final class PageBlockMap extends PageBlock {
  /// **PageBlockMap** *(pageBlockMap)* - child of PageBlock
  ///
  /// A map.
  ///
  /// * [location]: Location of the map center.
  /// * [zoom]: Map zoom level.
  /// * [width]: Map width.
  /// * [height]: Map height.
  /// * [caption]: Block caption; may be null if none *(optional)*.
  const PageBlockMap({
    required this.location,
    required this.zoom,
    required this.width,
    required this.height,
    this.caption,
  });

  /// Location of the map center
  final Location location;

  /// Map zoom level
  final int zoom;

  /// Map width
  final int width;

  /// Map height
  final int height;

  /// Block caption; may be null if none
  final PageBlockCaption? caption;

  /// Parse from a json
  factory PageBlockMap.fromJson(Map<String, dynamic> json) => PageBlockMap(
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
  /// * [zoom]: Map zoom level
  /// * [width]: Map width
  /// * [height]: Map height
  /// * [caption]: Block caption; may be null if none
  @override
  PageBlockMap copyWith({
    Location? location,
    int? zoom,
    int? width,
    int? height,
    PageBlockCaption? caption,
  }) =>
      PageBlockMap(
        location: location ?? this.location,
        zoom: zoom ?? this.zoom,
        width: width ?? this.width,
        height: height ?? this.height,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockMap';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockButtonRow** *(pageBlockButtonRow)* - child of PageBlock
///
/// A list of buttons shown in a row.
///
/// * [buttons]: The buttons.
/// * [align]: Horizontal alignment of the buttons; may be null if the buttons must be shown full-width *(optional)*.
final class PageBlockButtonRow extends PageBlock {
  /// **PageBlockButtonRow** *(pageBlockButtonRow)* - child of PageBlock
  ///
  /// A list of buttons shown in a row.
  ///
  /// * [buttons]: The buttons.
  /// * [align]: Horizontal alignment of the buttons; may be null if the buttons must be shown full-width *(optional)*.
  const PageBlockButtonRow({
    required this.buttons,
    this.align,
  });

  /// The buttons
  final List<InlineButton> buttons;

  /// Horizontal alignment of the buttons; may be null if the buttons must be shown full-width
  final PageBlockHorizontalAlignment? align;

  /// Parse from a json
  factory PageBlockButtonRow.fromJson(Map<String, dynamic> json) =>
      PageBlockButtonRow(
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
  /// * [align]: Horizontal alignment of the buttons; may be null if the buttons must be shown full-width
  @override
  PageBlockButtonRow copyWith({
    List<InlineButton>? buttons,
    PageBlockHorizontalAlignment? align,
  }) =>
      PageBlockButtonRow(
        buttons: buttons ?? this.buttons,
        align: align ?? this.align,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockButtonRow';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockUnsupported** *(pageBlockUnsupported)* - child of PageBlock
///
/// Represents a block unsupported by the current application version.
final class PageBlockUnsupported extends PageBlock {
  /// **PageBlockUnsupported** *(pageBlockUnsupported)* - child of PageBlock
  ///
  /// Represents a block unsupported by the current application version.
  const PageBlockUnsupported();

  /// Parse from a json
  factory PageBlockUnsupported.fromJson(Map<String, dynamic> json) =>
      const PageBlockUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockUnsupported copyWith() => const PageBlockUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
