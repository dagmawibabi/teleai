part of '../tdapi.dart';

/// **AddTextCompositionStyle** *(addTextCompositionStyle)* - TDLib function
///
/// Adds a custom text composition style to the list of used by the user styles. May return an error with a message "TONES_SAVED_TOO_MANY". if the maximum number of added custom styles getOption("added_text_composition_style_count_max") has been reached.
///
/// * [name]: Name of the style.
///
/// [Ok] is returned on completion.
final class AddTextCompositionStyle extends TdFunction {
  /// **AddTextCompositionStyle** *(addTextCompositionStyle)* - TDLib function
  ///
  /// Adds a custom text composition style to the list of used by the user styles. May return an error with a message "TONES_SAVED_TOO_MANY". if the maximum number of added custom styles getOption("added_text_composition_style_count_max") has been reached.
  ///
  /// * [name]: Name of the style.
  ///
  /// [Ok] is returned on completion.
  const AddTextCompositionStyle({
    required this.name,
  });

  /// Name of the style
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the style
  AddTextCompositionStyle copyWith({
    String? name,
  }) =>
      AddTextCompositionStyle(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
