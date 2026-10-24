part of '../tdapi.dart';

/// **RemoveInstalledBackground** *(removeInstalledBackground)* - TDLib function
///
/// Removes background from the list of installed backgrounds.
///
/// * [backgroundId]: The background identifier.
///
/// [Ok] is returned on completion.
final class RemoveInstalledBackground extends TdFunction {
  /// **RemoveInstalledBackground** *(removeInstalledBackground)* - TDLib function
  ///
  /// Removes background from the list of installed backgrounds.
  ///
  /// * [backgroundId]: The background identifier.
  ///
  /// [Ok] is returned on completion.
  const RemoveInstalledBackground({
    required this.backgroundId,
  });

  /// The background identifier
  final int backgroundId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "background_id": backgroundId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background_id]: The background identifier
  RemoveInstalledBackground copyWith({
    int? backgroundId,
  }) =>
      RemoveInstalledBackground(
        backgroundId: backgroundId ?? this.backgroundId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeInstalledBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
