part of '../tdapi.dart';

/// **ToggleSupergroupHasAutomaticTranslation** *(toggleSupergroupHasAutomaticTranslation)* - TDLib function
///
/// Toggles whether messages are automatically translated in the channel chat; requires can_change_info administrator right in the channel.. The chat must have at least chatBoostFeatures.min_automatic_translation_boost_level boost level to enable automatic translation.
///
/// * [supergroupId]: The identifier of the channel.
/// * [hasAutomaticTranslation]: The new value of has_automatic_translation.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupHasAutomaticTranslation extends TdFunction {
  /// **ToggleSupergroupHasAutomaticTranslation** *(toggleSupergroupHasAutomaticTranslation)* - TDLib function
  ///
  /// Toggles whether messages are automatically translated in the channel chat; requires can_change_info administrator right in the channel.. The chat must have at least chatBoostFeatures.min_automatic_translation_boost_level boost level to enable automatic translation.
  ///
  /// * [supergroupId]: The identifier of the channel.
  /// * [hasAutomaticTranslation]: The new value of has_automatic_translation.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupHasAutomaticTranslation({
    required this.supergroupId,
    required this.hasAutomaticTranslation,
  });

  /// The identifier of the channel
  final int supergroupId;

  /// The new value of has_automatic_translation
  final bool hasAutomaticTranslation;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "has_automatic_translation": hasAutomaticTranslation,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: The identifier of the channel
  /// * [has_automatic_translation]: The new value of has_automatic_translation
  ToggleSupergroupHasAutomaticTranslation copyWith({
    int? supergroupId,
    bool? hasAutomaticTranslation,
  }) =>
      ToggleSupergroupHasAutomaticTranslation(
        supergroupId: supergroupId ?? this.supergroupId,
        hasAutomaticTranslation:
            hasAutomaticTranslation ?? this.hasAutomaticTranslation,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleSupergroupHasAutomaticTranslation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
