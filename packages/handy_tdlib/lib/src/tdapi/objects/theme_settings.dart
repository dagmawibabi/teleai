part of '../tdapi.dart';

/// **ThemeSettings** *(themeSettings)* - basic class
///
/// Describes theme settings.
///
/// * [baseTheme]: Base theme for this theme.
/// * [accentColor]: Theme accent color in ARGB format.
/// * [background]: The background to be used in chats; may be null *(optional)*.
/// * [outgoingMessageFill]: The fill to be used as a background for outgoing messages; may be null if the fill from the base theme must be used instead *(optional)*.
/// * [animateOutgoingMessageFill]: If true, the freeform gradient fill needs to be animated on every sent message.
/// * [hasOutgoingMessageAccentColor]: True, if there is chosen accent color for outgoing messages; otherwise, the color must be deduced from other theme settings.
/// * [outgoingMessageAccentColor]: Accent color of outgoing messages in ARGB format; must be ignored if has_outgoing_message_accent_color is false.
final class ThemeSettings extends TdObject {
  /// **ThemeSettings** *(themeSettings)* - basic class
  ///
  /// Describes theme settings.
  ///
  /// * [baseTheme]: Base theme for this theme.
  /// * [accentColor]: Theme accent color in ARGB format.
  /// * [background]: The background to be used in chats; may be null *(optional)*.
  /// * [outgoingMessageFill]: The fill to be used as a background for outgoing messages; may be null if the fill from the base theme must be used instead *(optional)*.
  /// * [animateOutgoingMessageFill]: If true, the freeform gradient fill needs to be animated on every sent message.
  /// * [hasOutgoingMessageAccentColor]: True, if there is chosen accent color for outgoing messages; otherwise, the color must be deduced from other theme settings.
  /// * [outgoingMessageAccentColor]: Accent color of outgoing messages in ARGB format; must be ignored if has_outgoing_message_accent_color is false.
  const ThemeSettings({
    required this.baseTheme,
    required this.accentColor,
    this.background,
    this.outgoingMessageFill,
    required this.animateOutgoingMessageFill,
    required this.hasOutgoingMessageAccentColor,
    required this.outgoingMessageAccentColor,
  });

  /// Base theme for this theme
  final BuiltInTheme baseTheme;

  /// Theme accent color in ARGB format
  final int accentColor;

  /// The background to be used in chats; may be null
  final Background? background;

  /// The fill to be used as a background for outgoing messages; may be null if the fill from the base theme must be used instead
  final BackgroundFill? outgoingMessageFill;

  /// If true, the freeform gradient fill needs to be animated on every sent message
  final bool animateOutgoingMessageFill;

  /// True, if there is chosen accent color for outgoing messages; otherwise, the color must be deduced from other theme settings
  final bool hasOutgoingMessageAccentColor;

  /// Accent color of outgoing messages in ARGB format; must be ignored if has_outgoing_message_accent_color is false
  final int outgoingMessageAccentColor;

  /// Parse from a json
  factory ThemeSettings.fromJson(Map<String, dynamic> json) => ThemeSettings(
        baseTheme: BuiltInTheme.fromJson(json['base_theme']),
        accentColor: json['accent_color'],
        background: json['background'] == null
            ? null
            : Background.fromJson(json['background']),
        outgoingMessageFill: json['outgoing_message_fill'] == null
            ? null
            : BackgroundFill.fromJson(json['outgoing_message_fill']),
        animateOutgoingMessageFill: json['animate_outgoing_message_fill'],
        hasOutgoingMessageAccentColor:
            json['has_outgoing_message_accent_color'],
        outgoingMessageAccentColor: json['outgoing_message_accent_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "base_theme": baseTheme.toJson(),
      "accent_color": accentColor,
      "background": background?.toJson(),
      "outgoing_message_fill": outgoingMessageFill?.toJson(),
      "animate_outgoing_message_fill": animateOutgoingMessageFill,
      "has_outgoing_message_accent_color": hasOutgoingMessageAccentColor,
      "outgoing_message_accent_color": outgoingMessageAccentColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [base_theme]: Base theme for this theme
  /// * [accent_color]: Theme accent color in ARGB format
  /// * [background]: The background to be used in chats; may be null
  /// * [outgoing_message_fill]: The fill to be used as a background for outgoing messages; may be null if the fill from the base theme must be used instead
  /// * [animate_outgoing_message_fill]: If true, the freeform gradient fill needs to be animated on every sent message
  /// * [has_outgoing_message_accent_color]: True, if there is chosen accent color for outgoing messages; otherwise, the color must be deduced from other theme settings
  /// * [outgoing_message_accent_color]: Accent color of outgoing messages in ARGB format; must be ignored if has_outgoing_message_accent_color is false
  ThemeSettings copyWith({
    BuiltInTheme? baseTheme,
    int? accentColor,
    Background? background,
    BackgroundFill? outgoingMessageFill,
    bool? animateOutgoingMessageFill,
    bool? hasOutgoingMessageAccentColor,
    int? outgoingMessageAccentColor,
  }) =>
      ThemeSettings(
        baseTheme: baseTheme ?? this.baseTheme,
        accentColor: accentColor ?? this.accentColor,
        background: background ?? this.background,
        outgoingMessageFill: outgoingMessageFill ?? this.outgoingMessageFill,
        animateOutgoingMessageFill:
            animateOutgoingMessageFill ?? this.animateOutgoingMessageFill,
        hasOutgoingMessageAccentColor:
            hasOutgoingMessageAccentColor ?? this.hasOutgoingMessageAccentColor,
        outgoingMessageAccentColor:
            outgoingMessageAccentColor ?? this.outgoingMessageAccentColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'themeSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
