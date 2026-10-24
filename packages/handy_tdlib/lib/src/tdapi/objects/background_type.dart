part of '../tdapi.dart';

/// **BackgroundType** *(backgroundType)* - parent
///
/// Describes the type of background.
sealed class BackgroundType extends TdObject {
  /// **BackgroundType** *(backgroundType)* - parent
  ///
  /// Describes the type of background.
  const BackgroundType();

  /// a BackgroundType return type can be :
  /// * [BackgroundTypeWallpaper]
  /// * [BackgroundTypePattern]
  /// * [BackgroundTypeFill]
  /// * [BackgroundTypeChatTheme]
  factory BackgroundType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BackgroundTypeWallpaper.defaultObjectId:
        return BackgroundTypeWallpaper.fromJson(json);
      case BackgroundTypePattern.defaultObjectId:
        return BackgroundTypePattern.fromJson(json);
      case BackgroundTypeFill.defaultObjectId:
        return BackgroundTypeFill.fromJson(json);
      case BackgroundTypeChatTheme.defaultObjectId:
        return BackgroundTypeChatTheme.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BackgroundType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BackgroundType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'backgroundType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BackgroundTypeWallpaper** *(backgroundTypeWallpaper)* - child of BackgroundType
///
/// A wallpaper in JPEG format.
///
/// * [isBlurred]: True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12.
/// * [isMoving]: True, if the background needs to be slightly moved when device is tilted.
final class BackgroundTypeWallpaper extends BackgroundType {
  /// **BackgroundTypeWallpaper** *(backgroundTypeWallpaper)* - child of BackgroundType
  ///
  /// A wallpaper in JPEG format.
  ///
  /// * [isBlurred]: True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12.
  /// * [isMoving]: True, if the background needs to be slightly moved when device is tilted.
  const BackgroundTypeWallpaper({
    required this.isBlurred,
    required this.isMoving,
  });

  /// True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
  final bool isBlurred;

  /// True, if the background needs to be slightly moved when device is tilted
  final bool isMoving;

  /// Parse from a json
  factory BackgroundTypeWallpaper.fromJson(Map<String, dynamic> json) =>
      BackgroundTypeWallpaper(
        isBlurred: json['is_blurred'],
        isMoving: json['is_moving'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_blurred": isBlurred,
      "is_moving": isMoving,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_blurred]: True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
  /// * [is_moving]: True, if the background needs to be slightly moved when device is tilted
  @override
  BackgroundTypeWallpaper copyWith({
    bool? isBlurred,
    bool? isMoving,
  }) =>
      BackgroundTypeWallpaper(
        isBlurred: isBlurred ?? this.isBlurred,
        isMoving: isMoving ?? this.isMoving,
      );

  /// TDLib object type
  static const String defaultObjectId = 'backgroundTypeWallpaper';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BackgroundTypePattern** *(backgroundTypePattern)* - child of BackgroundType
///
/// A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user.
///
/// * [fill]: Fill of the background.
/// * [intensity]: Intensity of the pattern when it is shown above the filled background; 0-100.
/// * [isInverted]: True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only.
/// * [isMoving]: True, if the background needs to be slightly moved when device is tilted.
final class BackgroundTypePattern extends BackgroundType {
  /// **BackgroundTypePattern** *(backgroundTypePattern)* - child of BackgroundType
  ///
  /// A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user.
  ///
  /// * [fill]: Fill of the background.
  /// * [intensity]: Intensity of the pattern when it is shown above the filled background; 0-100.
  /// * [isInverted]: True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only.
  /// * [isMoving]: True, if the background needs to be slightly moved when device is tilted.
  const BackgroundTypePattern({
    required this.fill,
    required this.intensity,
    required this.isInverted,
    required this.isMoving,
  });

  /// Fill of the background
  final BackgroundFill fill;

  /// Intensity of the pattern when it is shown above the filled background; 0-100
  final int intensity;

  /// True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
  final bool isInverted;

  /// True, if the background needs to be slightly moved when device is tilted
  final bool isMoving;

  /// Parse from a json
  factory BackgroundTypePattern.fromJson(Map<String, dynamic> json) =>
      BackgroundTypePattern(
        fill: BackgroundFill.fromJson(json['fill']),
        intensity: json['intensity'],
        isInverted: json['is_inverted'],
        isMoving: json['is_moving'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "fill": fill.toJson(),
      "intensity": intensity,
      "is_inverted": isInverted,
      "is_moving": isMoving,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [fill]: Fill of the background
  /// * [intensity]: Intensity of the pattern when it is shown above the filled background; 0-100
  /// * [is_inverted]: True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
  /// * [is_moving]: True, if the background needs to be slightly moved when device is tilted
  @override
  BackgroundTypePattern copyWith({
    BackgroundFill? fill,
    int? intensity,
    bool? isInverted,
    bool? isMoving,
  }) =>
      BackgroundTypePattern(
        fill: fill ?? this.fill,
        intensity: intensity ?? this.intensity,
        isInverted: isInverted ?? this.isInverted,
        isMoving: isMoving ?? this.isMoving,
      );

  /// TDLib object type
  static const String defaultObjectId = 'backgroundTypePattern';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BackgroundTypeFill** *(backgroundTypeFill)* - child of BackgroundType
///
/// A filled background.
///
/// * [fill]: The background fill.
final class BackgroundTypeFill extends BackgroundType {
  /// **BackgroundTypeFill** *(backgroundTypeFill)* - child of BackgroundType
  ///
  /// A filled background.
  ///
  /// * [fill]: The background fill.
  const BackgroundTypeFill({
    required this.fill,
  });

  /// The background fill
  final BackgroundFill fill;

  /// Parse from a json
  factory BackgroundTypeFill.fromJson(Map<String, dynamic> json) =>
      BackgroundTypeFill(
        fill: BackgroundFill.fromJson(json['fill']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "fill": fill.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [fill]: The background fill
  @override
  BackgroundTypeFill copyWith({
    BackgroundFill? fill,
  }) =>
      BackgroundTypeFill(
        fill: fill ?? this.fill,
      );

  /// TDLib object type
  static const String defaultObjectId = 'backgroundTypeFill';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BackgroundTypeChatTheme** *(backgroundTypeChatTheme)* - child of BackgroundType
///
/// A background from a chat theme based on an emoji; can be used only as a chat background in channels.
///
/// * [themeName]: Name of the emoji chat theme.
final class BackgroundTypeChatTheme extends BackgroundType {
  /// **BackgroundTypeChatTheme** *(backgroundTypeChatTheme)* - child of BackgroundType
  ///
  /// A background from a chat theme based on an emoji; can be used only as a chat background in channels.
  ///
  /// * [themeName]: Name of the emoji chat theme.
  const BackgroundTypeChatTheme({
    required this.themeName,
  });

  /// Name of the emoji chat theme
  final String themeName;

  /// Parse from a json
  factory BackgroundTypeChatTheme.fromJson(Map<String, dynamic> json) =>
      BackgroundTypeChatTheme(
        themeName: json['theme_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "theme_name": themeName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [theme_name]: Name of the emoji chat theme
  @override
  BackgroundTypeChatTheme copyWith({
    String? themeName,
  }) =>
      BackgroundTypeChatTheme(
        themeName: themeName ?? this.themeName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'backgroundTypeChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
