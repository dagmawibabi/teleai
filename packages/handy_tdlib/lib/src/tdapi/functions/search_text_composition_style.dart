part of '../tdapi.dart';

/// **SearchTextCompositionStyle** *(searchTextCompositionStyle)* - TDLib function
///
/// Searches a custom text composition style by its name.
///
/// * [name]: Name of the style.
///
/// [TextCompositionStyle] is returned on completion.
final class SearchTextCompositionStyle extends TdFunction {
  /// **SearchTextCompositionStyle** *(searchTextCompositionStyle)* - TDLib function
  ///
  /// Searches a custom text composition style by its name.
  ///
  /// * [name]: Name of the style.
  ///
  /// [TextCompositionStyle] is returned on completion.
  const SearchTextCompositionStyle({
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
  SearchTextCompositionStyle copyWith({
    String? name,
  }) =>
      SearchTextCompositionStyle(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
