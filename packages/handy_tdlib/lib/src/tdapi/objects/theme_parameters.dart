part of '../tdapi.dart';

/// **ThemeParameters** *(themeParameters)* - basic class
///
/// Contains parameters of the application theme.
///
/// * [backgroundColor]: A color of the background in the RGB format.
/// * [secondaryBackgroundColor]: A secondary color for the background in the RGB format.
/// * [headerBackgroundColor]: A color of the header background in the RGB format.
/// * [bottomBarBackgroundColor]: A color of the bottom bar background in the RGB format.
/// * [sectionBackgroundColor]: A color of the section background in the RGB format.
/// * [sectionSeparatorColor]: A color of the section separator in the RGB format.
/// * [textColor]: A color of text in the RGB format.
/// * [accentTextColor]: An accent color of the text in the RGB format.
/// * [sectionHeaderTextColor]: A color of text on the section headers in the RGB format.
/// * [subtitleTextColor]: A color of the subtitle text in the RGB format.
/// * [destructiveTextColor]: A color of the text for destructive actions in the RGB format.
/// * [hintColor]: A color of hints in the RGB format.
/// * [linkColor]: A color of links in the RGB format.
/// * [buttonColor]: A color of the buttons in the RGB format.
/// * [buttonTextColor]: A color of text on the buttons in the RGB format.
final class ThemeParameters extends TdObject {
  /// **ThemeParameters** *(themeParameters)* - basic class
  ///
  /// Contains parameters of the application theme.
  ///
  /// * [backgroundColor]: A color of the background in the RGB format.
  /// * [secondaryBackgroundColor]: A secondary color for the background in the RGB format.
  /// * [headerBackgroundColor]: A color of the header background in the RGB format.
  /// * [bottomBarBackgroundColor]: A color of the bottom bar background in the RGB format.
  /// * [sectionBackgroundColor]: A color of the section background in the RGB format.
  /// * [sectionSeparatorColor]: A color of the section separator in the RGB format.
  /// * [textColor]: A color of text in the RGB format.
  /// * [accentTextColor]: An accent color of the text in the RGB format.
  /// * [sectionHeaderTextColor]: A color of text on the section headers in the RGB format.
  /// * [subtitleTextColor]: A color of the subtitle text in the RGB format.
  /// * [destructiveTextColor]: A color of the text for destructive actions in the RGB format.
  /// * [hintColor]: A color of hints in the RGB format.
  /// * [linkColor]: A color of links in the RGB format.
  /// * [buttonColor]: A color of the buttons in the RGB format.
  /// * [buttonTextColor]: A color of text on the buttons in the RGB format.
  const ThemeParameters({
    required this.backgroundColor,
    required this.secondaryBackgroundColor,
    required this.headerBackgroundColor,
    required this.bottomBarBackgroundColor,
    required this.sectionBackgroundColor,
    required this.sectionSeparatorColor,
    required this.textColor,
    required this.accentTextColor,
    required this.sectionHeaderTextColor,
    required this.subtitleTextColor,
    required this.destructiveTextColor,
    required this.hintColor,
    required this.linkColor,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  /// A color of the background in the RGB format
  final int backgroundColor;

  /// A secondary color for the background in the RGB format
  final int secondaryBackgroundColor;

  /// A color of the header background in the RGB format
  final int headerBackgroundColor;

  /// A color of the bottom bar background in the RGB format
  final int bottomBarBackgroundColor;

  /// A color of the section background in the RGB format
  final int sectionBackgroundColor;

  /// A color of the section separator in the RGB format
  final int sectionSeparatorColor;

  /// A color of text in the RGB format
  final int textColor;

  /// An accent color of the text in the RGB format
  final int accentTextColor;

  /// A color of text on the section headers in the RGB format
  final int sectionHeaderTextColor;

  /// A color of the subtitle text in the RGB format
  final int subtitleTextColor;

  /// A color of the text for destructive actions in the RGB format
  final int destructiveTextColor;

  /// A color of hints in the RGB format
  final int hintColor;

  /// A color of links in the RGB format
  final int linkColor;

  /// A color of the buttons in the RGB format
  final int buttonColor;

  /// A color of text on the buttons in the RGB format
  final int buttonTextColor;

  /// Parse from a json
  factory ThemeParameters.fromJson(Map<String, dynamic> json) =>
      ThemeParameters(
        backgroundColor: json['background_color'],
        secondaryBackgroundColor: json['secondary_background_color'],
        headerBackgroundColor: json['header_background_color'],
        bottomBarBackgroundColor: json['bottom_bar_background_color'],
        sectionBackgroundColor: json['section_background_color'],
        sectionSeparatorColor: json['section_separator_color'],
        textColor: json['text_color'],
        accentTextColor: json['accent_text_color'],
        sectionHeaderTextColor: json['section_header_text_color'],
        subtitleTextColor: json['subtitle_text_color'],
        destructiveTextColor: json['destructive_text_color'],
        hintColor: json['hint_color'],
        linkColor: json['link_color'],
        buttonColor: json['button_color'],
        buttonTextColor: json['button_text_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background_color": backgroundColor,
      "secondary_background_color": secondaryBackgroundColor,
      "header_background_color": headerBackgroundColor,
      "bottom_bar_background_color": bottomBarBackgroundColor,
      "section_background_color": sectionBackgroundColor,
      "section_separator_color": sectionSeparatorColor,
      "text_color": textColor,
      "accent_text_color": accentTextColor,
      "section_header_text_color": sectionHeaderTextColor,
      "subtitle_text_color": subtitleTextColor,
      "destructive_text_color": destructiveTextColor,
      "hint_color": hintColor,
      "link_color": linkColor,
      "button_color": buttonColor,
      "button_text_color": buttonTextColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background_color]: A color of the background in the RGB format
  /// * [secondary_background_color]: A secondary color for the background in the RGB format
  /// * [header_background_color]: A color of the header background in the RGB format
  /// * [bottom_bar_background_color]: A color of the bottom bar background in the RGB format
  /// * [section_background_color]: A color of the section background in the RGB format
  /// * [section_separator_color]: A color of the section separator in the RGB format
  /// * [text_color]: A color of text in the RGB format
  /// * [accent_text_color]: An accent color of the text in the RGB format
  /// * [section_header_text_color]: A color of text on the section headers in the RGB format
  /// * [subtitle_text_color]: A color of the subtitle text in the RGB format
  /// * [destructive_text_color]: A color of the text for destructive actions in the RGB format
  /// * [hint_color]: A color of hints in the RGB format
  /// * [link_color]: A color of links in the RGB format
  /// * [button_color]: A color of the buttons in the RGB format
  /// * [button_text_color]: A color of text on the buttons in the RGB format
  ThemeParameters copyWith({
    int? backgroundColor,
    int? secondaryBackgroundColor,
    int? headerBackgroundColor,
    int? bottomBarBackgroundColor,
    int? sectionBackgroundColor,
    int? sectionSeparatorColor,
    int? textColor,
    int? accentTextColor,
    int? sectionHeaderTextColor,
    int? subtitleTextColor,
    int? destructiveTextColor,
    int? hintColor,
    int? linkColor,
    int? buttonColor,
    int? buttonTextColor,
  }) =>
      ThemeParameters(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        secondaryBackgroundColor:
            secondaryBackgroundColor ?? this.secondaryBackgroundColor,
        headerBackgroundColor:
            headerBackgroundColor ?? this.headerBackgroundColor,
        bottomBarBackgroundColor:
            bottomBarBackgroundColor ?? this.bottomBarBackgroundColor,
        sectionBackgroundColor:
            sectionBackgroundColor ?? this.sectionBackgroundColor,
        sectionSeparatorColor:
            sectionSeparatorColor ?? this.sectionSeparatorColor,
        textColor: textColor ?? this.textColor,
        accentTextColor: accentTextColor ?? this.accentTextColor,
        sectionHeaderTextColor:
            sectionHeaderTextColor ?? this.sectionHeaderTextColor,
        subtitleTextColor: subtitleTextColor ?? this.subtitleTextColor,
        destructiveTextColor: destructiveTextColor ?? this.destructiveTextColor,
        hintColor: hintColor ?? this.hintColor,
        linkColor: linkColor ?? this.linkColor,
        buttonColor: buttonColor ?? this.buttonColor,
        buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'themeParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
