part of '../tdapi.dart';

/// **RemoveSavedAnimation** *(removeSavedAnimation)* - TDLib function
///
/// Removes an animation from the list of saved animations.
///
/// * [animation]: Animation file to be removed.
///
/// [Ok] is returned on completion.
final class RemoveSavedAnimation extends TdFunction {
  /// **RemoveSavedAnimation** *(removeSavedAnimation)* - TDLib function
  ///
  /// Removes an animation from the list of saved animations.
  ///
  /// * [animation]: Animation file to be removed.
  ///
  /// [Ok] is returned on completion.
  const RemoveSavedAnimation({
    required this.animation,
  });

  /// Animation file to be removed
  final InputFile animation;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: Animation file to be removed
  RemoveSavedAnimation copyWith({
    InputFile? animation,
  }) =>
      RemoveSavedAnimation(
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeSavedAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
