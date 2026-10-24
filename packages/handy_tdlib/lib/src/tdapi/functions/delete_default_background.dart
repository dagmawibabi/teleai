part of '../tdapi.dart';

/// **DeleteDefaultBackground** *(deleteDefaultBackground)* - TDLib function
///
/// Deletes default background for chats.
///
/// * [forDarkTheme]: Pass true if the background is deleted for a dark theme.
///
/// [Ok] is returned on completion.
final class DeleteDefaultBackground extends TdFunction {
  /// **DeleteDefaultBackground** *(deleteDefaultBackground)* - TDLib function
  ///
  /// Deletes default background for chats.
  ///
  /// * [forDarkTheme]: Pass true if the background is deleted for a dark theme.
  ///
  /// [Ok] is returned on completion.
  const DeleteDefaultBackground({
    required this.forDarkTheme,
  });

  /// Pass true if the background is deleted for a dark theme
  final bool forDarkTheme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "for_dark_theme": forDarkTheme,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [for_dark_theme]: Pass true if the background is deleted for a dark theme
  DeleteDefaultBackground copyWith({
    bool? forDarkTheme,
  }) =>
      DeleteDefaultBackground(
        forDarkTheme: forDarkTheme ?? this.forDarkTheme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteDefaultBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
