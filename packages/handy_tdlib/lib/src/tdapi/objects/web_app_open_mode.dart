part of '../tdapi.dart';

/// **WebAppOpenMode** *(webAppOpenMode)* - parent
///
/// Describes mode in which a Web App is opened.
sealed class WebAppOpenMode extends TdObject {
  /// **WebAppOpenMode** *(webAppOpenMode)* - parent
  ///
  /// Describes mode in which a Web App is opened.
  const WebAppOpenMode();

  /// a WebAppOpenMode return type can be :
  /// * [WebAppOpenModeCompact]
  /// * [WebAppOpenModeFullSize]
  /// * [WebAppOpenModeFullScreen]
  factory WebAppOpenMode.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case WebAppOpenModeCompact.defaultObjectId:
        return WebAppOpenModeCompact.fromJson(json);
      case WebAppOpenModeFullSize.defaultObjectId:
        return WebAppOpenModeFullSize.fromJson(json);
      case WebAppOpenModeFullScreen.defaultObjectId:
        return WebAppOpenModeFullScreen.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of WebAppOpenMode)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  WebAppOpenMode copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'webAppOpenMode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebAppOpenModeCompact** *(webAppOpenModeCompact)* - child of WebAppOpenMode
///
/// The Web App is opened in the compact mode.
final class WebAppOpenModeCompact extends WebAppOpenMode {
  /// **WebAppOpenModeCompact** *(webAppOpenModeCompact)* - child of WebAppOpenMode
  ///
  /// The Web App is opened in the compact mode.
  const WebAppOpenModeCompact();

  /// Parse from a json
  factory WebAppOpenModeCompact.fromJson(Map<String, dynamic> json) =>
      const WebAppOpenModeCompact();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebAppOpenModeCompact copyWith() => const WebAppOpenModeCompact();

  /// TDLib object type
  static const String defaultObjectId = 'webAppOpenModeCompact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebAppOpenModeFullSize** *(webAppOpenModeFullSize)* - child of WebAppOpenMode
///
/// The Web App is opened in the full-size mode.
final class WebAppOpenModeFullSize extends WebAppOpenMode {
  /// **WebAppOpenModeFullSize** *(webAppOpenModeFullSize)* - child of WebAppOpenMode
  ///
  /// The Web App is opened in the full-size mode.
  const WebAppOpenModeFullSize();

  /// Parse from a json
  factory WebAppOpenModeFullSize.fromJson(Map<String, dynamic> json) =>
      const WebAppOpenModeFullSize();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebAppOpenModeFullSize copyWith() => const WebAppOpenModeFullSize();

  /// TDLib object type
  static const String defaultObjectId = 'webAppOpenModeFullSize';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **WebAppOpenModeFullScreen** *(webAppOpenModeFullScreen)* - child of WebAppOpenMode
///
/// The Web App is opened in the full-screen mode.
final class WebAppOpenModeFullScreen extends WebAppOpenMode {
  /// **WebAppOpenModeFullScreen** *(webAppOpenModeFullScreen)* - child of WebAppOpenMode
  ///
  /// The Web App is opened in the full-screen mode.
  const WebAppOpenModeFullScreen();

  /// Parse from a json
  factory WebAppOpenModeFullScreen.fromJson(Map<String, dynamic> json) =>
      const WebAppOpenModeFullScreen();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  WebAppOpenModeFullScreen copyWith() => const WebAppOpenModeFullScreen();

  /// TDLib object type
  static const String defaultObjectId = 'webAppOpenModeFullScreen';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
