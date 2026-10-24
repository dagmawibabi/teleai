part of '../tdapi.dart';

/// **BuiltInTheme** *(builtInTheme)* - parent
///
/// Describes a built-in theme of an official application.
sealed class BuiltInTheme extends TdObject {
  /// **BuiltInTheme** *(builtInTheme)* - parent
  ///
  /// Describes a built-in theme of an official application.
  const BuiltInTheme();

  /// a BuiltInTheme return type can be :
  /// * [BuiltInThemeClassic]
  /// * [BuiltInThemeDay]
  /// * [BuiltInThemeNight]
  /// * [BuiltInThemeTinted]
  /// * [BuiltInThemeArctic]
  factory BuiltInTheme.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BuiltInThemeClassic.defaultObjectId:
        return BuiltInThemeClassic.fromJson(json);
      case BuiltInThemeDay.defaultObjectId:
        return BuiltInThemeDay.fromJson(json);
      case BuiltInThemeNight.defaultObjectId:
        return BuiltInThemeNight.fromJson(json);
      case BuiltInThemeTinted.defaultObjectId:
        return BuiltInThemeTinted.fromJson(json);
      case BuiltInThemeArctic.defaultObjectId:
        return BuiltInThemeArctic.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BuiltInTheme)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BuiltInTheme copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'builtInTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BuiltInThemeClassic** *(builtInThemeClassic)* - child of BuiltInTheme
///
/// Classic light theme.
final class BuiltInThemeClassic extends BuiltInTheme {
  /// **BuiltInThemeClassic** *(builtInThemeClassic)* - child of BuiltInTheme
  ///
  /// Classic light theme.
  const BuiltInThemeClassic();

  /// Parse from a json
  factory BuiltInThemeClassic.fromJson(Map<String, dynamic> json) =>
      const BuiltInThemeClassic();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BuiltInThemeClassic copyWith() => const BuiltInThemeClassic();

  /// TDLib object type
  static const String defaultObjectId = 'builtInThemeClassic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BuiltInThemeDay** *(builtInThemeDay)* - child of BuiltInTheme
///
/// Regular light theme.
final class BuiltInThemeDay extends BuiltInTheme {
  /// **BuiltInThemeDay** *(builtInThemeDay)* - child of BuiltInTheme
  ///
  /// Regular light theme.
  const BuiltInThemeDay();

  /// Parse from a json
  factory BuiltInThemeDay.fromJson(Map<String, dynamic> json) =>
      const BuiltInThemeDay();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BuiltInThemeDay copyWith() => const BuiltInThemeDay();

  /// TDLib object type
  static const String defaultObjectId = 'builtInThemeDay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BuiltInThemeNight** *(builtInThemeNight)* - child of BuiltInTheme
///
/// Regular dark theme.
final class BuiltInThemeNight extends BuiltInTheme {
  /// **BuiltInThemeNight** *(builtInThemeNight)* - child of BuiltInTheme
  ///
  /// Regular dark theme.
  const BuiltInThemeNight();

  /// Parse from a json
  factory BuiltInThemeNight.fromJson(Map<String, dynamic> json) =>
      const BuiltInThemeNight();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BuiltInThemeNight copyWith() => const BuiltInThemeNight();

  /// TDLib object type
  static const String defaultObjectId = 'builtInThemeNight';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BuiltInThemeTinted** *(builtInThemeTinted)* - child of BuiltInTheme
///
/// Tinted dark theme.
final class BuiltInThemeTinted extends BuiltInTheme {
  /// **BuiltInThemeTinted** *(builtInThemeTinted)* - child of BuiltInTheme
  ///
  /// Tinted dark theme.
  const BuiltInThemeTinted();

  /// Parse from a json
  factory BuiltInThemeTinted.fromJson(Map<String, dynamic> json) =>
      const BuiltInThemeTinted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BuiltInThemeTinted copyWith() => const BuiltInThemeTinted();

  /// TDLib object type
  static const String defaultObjectId = 'builtInThemeTinted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BuiltInThemeArctic** *(builtInThemeArctic)* - child of BuiltInTheme
///
/// Arctic light theme.
final class BuiltInThemeArctic extends BuiltInTheme {
  /// **BuiltInThemeArctic** *(builtInThemeArctic)* - child of BuiltInTheme
  ///
  /// Arctic light theme.
  const BuiltInThemeArctic();

  /// Parse from a json
  factory BuiltInThemeArctic.fromJson(Map<String, dynamic> json) =>
      const BuiltInThemeArctic();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BuiltInThemeArctic copyWith() => const BuiltInThemeArctic();

  /// TDLib object type
  static const String defaultObjectId = 'builtInThemeArctic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
