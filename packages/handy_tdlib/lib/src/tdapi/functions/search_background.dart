part of '../tdapi.dart';

/// **SearchBackground** *(searchBackground)* - TDLib function
///
/// Searches for a background by its name.
///
/// * [name]: The name of the background.
///
/// [Background] is returned on completion.
final class SearchBackground extends TdFunction {
  /// **SearchBackground** *(searchBackground)* - TDLib function
  ///
  /// Searches for a background by its name.
  ///
  /// * [name]: The name of the background.
  ///
  /// [Background] is returned on completion.
  const SearchBackground({
    required this.name,
  });

  /// The name of the background
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
  /// * [name]: The name of the background
  SearchBackground copyWith({
    String? name,
  }) =>
      SearchBackground(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
