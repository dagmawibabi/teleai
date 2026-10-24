part of '../tdapi.dart';

/// **GetMessageEffect** *(getMessageEffect)* - TDLib function
///
/// Returns information about a message effect. Returns a 404 error if the effect is not found.
///
/// * [effectId]: Unique identifier of the effect.
///
/// [MessageEffect] is returned on completion.
final class GetMessageEffect extends TdFunction {
  /// **GetMessageEffect** *(getMessageEffect)* - TDLib function
  ///
  /// Returns information about a message effect. Returns a 404 error if the effect is not found.
  ///
  /// * [effectId]: Unique identifier of the effect.
  ///
  /// [MessageEffect] is returned on completion.
  const GetMessageEffect({
    required this.effectId,
  });

  /// Unique identifier of the effect
  final int effectId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "effect_id": effectId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [effect_id]: Unique identifier of the effect
  GetMessageEffect copyWith({
    int? effectId,
  }) =>
      GetMessageEffect(
        effectId: effectId ?? this.effectId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageEffect';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
