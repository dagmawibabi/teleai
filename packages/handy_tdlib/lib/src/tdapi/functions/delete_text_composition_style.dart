part of '../tdapi.dart';

/// **DeleteTextCompositionStyle** *(deleteTextCompositionStyle)* - TDLib function
///
/// Deletes a custom text composition style that was created by the current user.
///
/// * [name]: Name of the style.
///
/// [Ok] is returned on completion.
final class DeleteTextCompositionStyle extends TdFunction {
  /// **DeleteTextCompositionStyle** *(deleteTextCompositionStyle)* - TDLib function
  ///
  /// Deletes a custom text composition style that was created by the current user.
  ///
  /// * [name]: Name of the style.
  ///
  /// [Ok] is returned on completion.
  const DeleteTextCompositionStyle({
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
  DeleteTextCompositionStyle copyWith({
    String? name,
  }) =>
      DeleteTextCompositionStyle(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
