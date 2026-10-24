part of '../tdapi.dart';

/// **GetTextCompositionStyleExample** *(getTextCompositionStyleExample)* - TDLib function
///
/// Returns an example of usage of a custom text composition style.
///
/// * [name]: Name of the style.
/// * [exampleNumber]: 0-based unique number of the requested example; must be non-negative and less than getOption("text_composition_style_example_count").
///
/// [TextCompositionStyleExample] is returned on completion.
final class GetTextCompositionStyleExample extends TdFunction {
  /// **GetTextCompositionStyleExample** *(getTextCompositionStyleExample)* - TDLib function
  ///
  /// Returns an example of usage of a custom text composition style.
  ///
  /// * [name]: Name of the style.
  /// * [exampleNumber]: 0-based unique number of the requested example; must be non-negative and less than getOption("text_composition_style_example_count").
  ///
  /// [TextCompositionStyleExample] is returned on completion.
  const GetTextCompositionStyleExample({
    required this.name,
    required this.exampleNumber,
  });

  /// Name of the style
  final String name;

  /// 0-based unique number of the requested example; must be non-negative and less than getOption("text_composition_style_example_count")
  final int exampleNumber;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "example_number": exampleNumber,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the style
  /// * [example_number]: 0-based unique number of the requested example; must be non-negative and less than getOption("text_composition_style_example_count")
  GetTextCompositionStyleExample copyWith({
    String? name,
    int? exampleNumber,
  }) =>
      GetTextCompositionStyleExample(
        name: name ?? this.name,
        exampleNumber: exampleNumber ?? this.exampleNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTextCompositionStyleExample';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
