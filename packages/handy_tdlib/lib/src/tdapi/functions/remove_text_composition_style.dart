part of '../tdapi.dart';

/// **RemoveTextCompositionStyle** *(removeTextCompositionStyle)* - TDLib function
///
/// Removes a custom text composition style from the list of used by the user styles. If the style was created by the current user, then it can only be deleted.
///
/// * [name]: Name of the style.
///
/// [Ok] is returned on completion.
final class RemoveTextCompositionStyle extends TdFunction {
  /// **RemoveTextCompositionStyle** *(removeTextCompositionStyle)* - TDLib function
  ///
  /// Removes a custom text composition style from the list of used by the user styles. If the style was created by the current user, then it can only be deleted.
  ///
  /// * [name]: Name of the style.
  ///
  /// [Ok] is returned on completion.
  const RemoveTextCompositionStyle({
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
  RemoveTextCompositionStyle copyWith({
    String? name,
  }) =>
      RemoveTextCompositionStyle(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
