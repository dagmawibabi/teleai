part of '../tdapi.dart';

/// **PageBlockHorizontalAlignment** *(pageBlockHorizontalAlignment)* - parent
///
/// Describes a horizontal alignment of a table cell content.
sealed class PageBlockHorizontalAlignment extends TdObject {
  /// **PageBlockHorizontalAlignment** *(pageBlockHorizontalAlignment)* - parent
  ///
  /// Describes a horizontal alignment of a table cell content.
  const PageBlockHorizontalAlignment();

  /// a PageBlockHorizontalAlignment return type can be :
  /// * [PageBlockHorizontalAlignmentLeft]
  /// * [PageBlockHorizontalAlignmentCenter]
  /// * [PageBlockHorizontalAlignmentRight]
  factory PageBlockHorizontalAlignment.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PageBlockHorizontalAlignmentLeft.defaultObjectId:
        return PageBlockHorizontalAlignmentLeft.fromJson(json);
      case PageBlockHorizontalAlignmentCenter.defaultObjectId:
        return PageBlockHorizontalAlignmentCenter.fromJson(json);
      case PageBlockHorizontalAlignmentRight.defaultObjectId:
        return PageBlockHorizontalAlignmentRight.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PageBlockHorizontalAlignment)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PageBlockHorizontalAlignment copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockHorizontalAlignment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockHorizontalAlignmentLeft** *(pageBlockHorizontalAlignmentLeft)* - child of PageBlockHorizontalAlignment
///
/// The content must be left-aligned.
final class PageBlockHorizontalAlignmentLeft
    extends PageBlockHorizontalAlignment {
  /// **PageBlockHorizontalAlignmentLeft** *(pageBlockHorizontalAlignmentLeft)* - child of PageBlockHorizontalAlignment
  ///
  /// The content must be left-aligned.
  const PageBlockHorizontalAlignmentLeft();

  /// Parse from a json
  factory PageBlockHorizontalAlignmentLeft.fromJson(
          Map<String, dynamic> json) =>
      const PageBlockHorizontalAlignmentLeft();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockHorizontalAlignmentLeft copyWith() =>
      const PageBlockHorizontalAlignmentLeft();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockHorizontalAlignmentLeft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockHorizontalAlignmentCenter** *(pageBlockHorizontalAlignmentCenter)* - child of PageBlockHorizontalAlignment
///
/// The content must be center-aligned.
final class PageBlockHorizontalAlignmentCenter
    extends PageBlockHorizontalAlignment {
  /// **PageBlockHorizontalAlignmentCenter** *(pageBlockHorizontalAlignmentCenter)* - child of PageBlockHorizontalAlignment
  ///
  /// The content must be center-aligned.
  const PageBlockHorizontalAlignmentCenter();

  /// Parse from a json
  factory PageBlockHorizontalAlignmentCenter.fromJson(
          Map<String, dynamic> json) =>
      const PageBlockHorizontalAlignmentCenter();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockHorizontalAlignmentCenter copyWith() =>
      const PageBlockHorizontalAlignmentCenter();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockHorizontalAlignmentCenter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PageBlockHorizontalAlignmentRight** *(pageBlockHorizontalAlignmentRight)* - child of PageBlockHorizontalAlignment
///
/// The content must be right-aligned.
final class PageBlockHorizontalAlignmentRight
    extends PageBlockHorizontalAlignment {
  /// **PageBlockHorizontalAlignmentRight** *(pageBlockHorizontalAlignmentRight)* - child of PageBlockHorizontalAlignment
  ///
  /// The content must be right-aligned.
  const PageBlockHorizontalAlignmentRight();

  /// Parse from a json
  factory PageBlockHorizontalAlignmentRight.fromJson(
          Map<String, dynamic> json) =>
      const PageBlockHorizontalAlignmentRight();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PageBlockHorizontalAlignmentRight copyWith() =>
      const PageBlockHorizontalAlignmentRight();

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockHorizontalAlignmentRight';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
