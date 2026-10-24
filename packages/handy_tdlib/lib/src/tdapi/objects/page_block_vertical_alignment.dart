part of '../tdapi.dart';

/// **PageBlockVerticalAlignment** *(pageBlockVerticalAlignment)* - parent
///
/// Describes a vertical alignment of a table cell content.
sealed class PageBlockVerticalAlignment extends TdObject {
  /// **PageBlockVerticalAlignment** *(pageBlockVerticalAlignment)* - parent
  ///
  /// Describes a vertical alignment of a table cell content.
  const PageBlockVerticalAlignment();

  /// a PageBlockVerticalAlignment return type can be :
  /// * [PageBlockVerticalAlignmentTop]
  /// * [PageBlockVerticalAlignmentMiddle]
  /// * [PageBlockVerticalAlignmentBottom]
  factory PageBlockVerticalAlignment.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PageBlockVerticalAlignmentTop.defaultObjectId:
        return PageBlockVerticalAlignmentTop.fromJson(json);
      case PageBlockVerticalAlignmentMiddle.defaultObjectId:
        return PageBlockVerticalAlignmentMiddle.fromJson(json);
      case PageBlockVerticalAlignmentBottom.defaultObjectId:
        return PageBlockVerticalAlignmentBottom.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PageBlockVerticalAlignment)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PageBlockVerticalAlignment copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVerticalAlignment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockVerticalAlignmentTop** *(pageBlockVerticalAlignmentTop)* - child of PageBlockVerticalAlignment
///
/// The content must be top-aligned.
final class PageBlockVerticalAlignmentTop extends PageBlockVerticalAlignment {
  /// **PageBlockVerticalAlignmentTop** *(pageBlockVerticalAlignmentTop)* - child of PageBlockVerticalAlignment
  ///
  /// The content must be top-aligned.
  const PageBlockVerticalAlignmentTop();

  /// Parse from a json
  factory PageBlockVerticalAlignmentTop.fromJson(Map<String, dynamic> json) =>
      const PageBlockVerticalAlignmentTop();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockVerticalAlignmentTop copyWith() =>
      const PageBlockVerticalAlignmentTop();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVerticalAlignmentTop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockVerticalAlignmentMiddle** *(pageBlockVerticalAlignmentMiddle)* - child of PageBlockVerticalAlignment
///
/// The content must be middle-aligned.
final class PageBlockVerticalAlignmentMiddle
    extends PageBlockVerticalAlignment {
  /// **PageBlockVerticalAlignmentMiddle** *(pageBlockVerticalAlignmentMiddle)* - child of PageBlockVerticalAlignment
  ///
  /// The content must be middle-aligned.
  const PageBlockVerticalAlignmentMiddle();

  /// Parse from a json
  factory PageBlockVerticalAlignmentMiddle.fromJson(
          Map<String, dynamic> json) =>
      const PageBlockVerticalAlignmentMiddle();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockVerticalAlignmentMiddle copyWith() =>
      const PageBlockVerticalAlignmentMiddle();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVerticalAlignmentMiddle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockVerticalAlignmentBottom** *(pageBlockVerticalAlignmentBottom)* - child of PageBlockVerticalAlignment
///
/// The content must be bottom-aligned.
final class PageBlockVerticalAlignmentBottom
    extends PageBlockVerticalAlignment {
  /// **PageBlockVerticalAlignmentBottom** *(pageBlockVerticalAlignmentBottom)* - child of PageBlockVerticalAlignment
  ///
  /// The content must be bottom-aligned.
  const PageBlockVerticalAlignmentBottom();

  /// Parse from a json
  factory PageBlockVerticalAlignmentBottom.fromJson(
          Map<String, dynamic> json) =>
      const PageBlockVerticalAlignmentBottom();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockVerticalAlignmentBottom copyWith() =>
      const PageBlockVerticalAlignmentBottom();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockVerticalAlignmentBottom';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
