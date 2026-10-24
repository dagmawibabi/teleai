part of '../tdapi.dart';

/// **ButtonStyle** *(buttonStyle)* - parent
///
/// Describes style of a button.
sealed class ButtonStyle extends TdObject {
  /// **ButtonStyle** *(buttonStyle)* - parent
  ///
  /// Describes style of a button.
  const ButtonStyle();

  /// a ButtonStyle return type can be :
  /// * [ButtonStyleDefault]
  /// * [ButtonStylePrimary]
  /// * [ButtonStyleDanger]
  /// * [ButtonStyleSuccess]
  /// * [ButtonStyleLink]
  factory ButtonStyle.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ButtonStyleDefault.defaultObjectId:
        return ButtonStyleDefault.fromJson(json);
      case ButtonStylePrimary.defaultObjectId:
        return ButtonStylePrimary.fromJson(json);
      case ButtonStyleDanger.defaultObjectId:
        return ButtonStyleDanger.fromJson(json);
      case ButtonStyleSuccess.defaultObjectId:
        return ButtonStyleSuccess.fromJson(json);
      case ButtonStyleLink.defaultObjectId:
        return ButtonStyleLink.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ButtonStyle)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ButtonStyle copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ButtonStyleDefault** *(buttonStyleDefault)* - child of ButtonStyle
///
/// The button has default style.
final class ButtonStyleDefault extends ButtonStyle {
  /// **ButtonStyleDefault** *(buttonStyleDefault)* - child of ButtonStyle
  ///
  /// The button has default style.
  const ButtonStyleDefault();

  /// Parse from a json
  factory ButtonStyleDefault.fromJson(Map<String, dynamic> json) =>
      const ButtonStyleDefault();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ButtonStyleDefault copyWith() => const ButtonStyleDefault();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStyleDefault';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ButtonStylePrimary** *(buttonStylePrimary)* - child of ButtonStyle
///
/// The button has dark blue color.
final class ButtonStylePrimary extends ButtonStyle {
  /// **ButtonStylePrimary** *(buttonStylePrimary)* - child of ButtonStyle
  ///
  /// The button has dark blue color.
  const ButtonStylePrimary();

  /// Parse from a json
  factory ButtonStylePrimary.fromJson(Map<String, dynamic> json) =>
      const ButtonStylePrimary();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ButtonStylePrimary copyWith() => const ButtonStylePrimary();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStylePrimary';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ButtonStyleDanger** *(buttonStyleDanger)* - child of ButtonStyle
///
/// The button has red color.
final class ButtonStyleDanger extends ButtonStyle {
  /// **ButtonStyleDanger** *(buttonStyleDanger)* - child of ButtonStyle
  ///
  /// The button has red color.
  const ButtonStyleDanger();

  /// Parse from a json
  factory ButtonStyleDanger.fromJson(Map<String, dynamic> json) =>
      const ButtonStyleDanger();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ButtonStyleDanger copyWith() => const ButtonStyleDanger();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStyleDanger';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ButtonStyleSuccess** *(buttonStyleSuccess)* - child of ButtonStyle
///
/// The button has green color.
final class ButtonStyleSuccess extends ButtonStyle {
  /// **ButtonStyleSuccess** *(buttonStyleSuccess)* - child of ButtonStyle
  ///
  /// The button has green color.
  const ButtonStyleSuccess();

  /// Parse from a json
  factory ButtonStyleSuccess.fromJson(Map<String, dynamic> json) =>
      const ButtonStyleSuccess();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ButtonStyleSuccess copyWith() => const ButtonStyleSuccess();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStyleSuccess';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ButtonStyleLink** *(buttonStyleLink)* - child of ButtonStyle
///
/// The button must be shown as a link. The style is allowed only for callback buttons in inlineButton.
final class ButtonStyleLink extends ButtonStyle {
  /// **ButtonStyleLink** *(buttonStyleLink)* - child of ButtonStyle
  ///
  /// The button must be shown as a link. The style is allowed only for callback buttons in inlineButton.
  const ButtonStyleLink();

  /// Parse from a json
  factory ButtonStyleLink.fromJson(Map<String, dynamic> json) =>
      const ButtonStyleLink();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ButtonStyleLink copyWith() => const ButtonStyleLink();

  /// TDLib object type
  static const String defaultObjectId = 'buttonStyleLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
