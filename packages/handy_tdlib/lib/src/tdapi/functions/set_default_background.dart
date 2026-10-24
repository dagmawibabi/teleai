part of '../tdapi.dart';

/// **SetDefaultBackground** *(setDefaultBackground)* - TDLib function
///
/// Sets default background for chats; adds the background to the list of installed backgrounds.
///
/// * [background]: The input background to use; pass null to create a new filled background *(optional)*.
/// * [type]: Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported *(optional)*.
/// * [forDarkTheme]: Pass true if the background is set for a dark theme.
///
/// [Background] is returned on completion.
final class SetDefaultBackground extends TdFunction {
  /// **SetDefaultBackground** *(setDefaultBackground)* - TDLib function
  ///
  /// Sets default background for chats; adds the background to the list of installed backgrounds.
  ///
  /// * [background]: The input background to use; pass null to create a new filled background *(optional)*.
  /// * [type]: Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported *(optional)*.
  /// * [forDarkTheme]: Pass true if the background is set for a dark theme.
  ///
  /// [Background] is returned on completion.
  const SetDefaultBackground({
    this.background,
    this.type,
    required this.forDarkTheme,
  });

  /// The input background to use; pass null to create a new filled background
  final InputBackground? background;

  /// Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported
  final BackgroundType? type;

  /// Pass true if the background is set for a dark theme
  final bool forDarkTheme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "background": background?.toJson(),
      "type": type?.toJson(),
      "for_dark_theme": forDarkTheme,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background]: The input background to use; pass null to create a new filled background
  /// * [type]: Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported
  /// * [for_dark_theme]: Pass true if the background is set for a dark theme
  SetDefaultBackground copyWith({
    InputBackground? background,
    BackgroundType? type,
    bool? forDarkTheme,
  }) =>
      SetDefaultBackground(
        background: background ?? this.background,
        type: type ?? this.type,
        forDarkTheme: forDarkTheme ?? this.forDarkTheme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDefaultBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
