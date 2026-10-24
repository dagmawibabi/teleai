part of '../tdapi.dart';

/// **HideSuggestedAction** *(hideSuggestedAction)* - TDLib function
///
/// Hides a suggested action.
///
/// * [action]: Suggested action to hide.
///
/// [Ok] is returned on completion.
final class HideSuggestedAction extends TdFunction {
  /// **HideSuggestedAction** *(hideSuggestedAction)* - TDLib function
  ///
  /// Hides a suggested action.
  ///
  /// * [action]: Suggested action to hide.
  ///
  /// [Ok] is returned on completion.
  const HideSuggestedAction({
    required this.action,
  });

  /// Suggested action to hide
  final SuggestedAction action;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "action": action.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [action]: Suggested action to hide
  HideSuggestedAction copyWith({
    SuggestedAction? action,
  }) =>
      HideSuggestedAction(
        action: action ?? this.action,
      );

  /// TDLib object type
  static const String defaultObjectId = 'hideSuggestedAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
