part of '../tdapi.dart';

/// **Animations** *(animations)* - basic class
///
/// Represents a list of animations.
///
/// * [animations]: List of animations.
final class Animations extends TdObject {
  /// **Animations** *(animations)* - basic class
  ///
  /// Represents a list of animations.
  ///
  /// * [animations]: List of animations.
  const Animations({
    required this.animations,
    this.extra,
    this.clientId,
  });

  /// List of animations
  final List<Animation> animations;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Animations.fromJson(Map<String, dynamic> json) => Animations(
        animations: List<Animation>.from((json['animations'] ?? [])
            .map((item) => Animation.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animations": animations.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animations]: List of animations
  Animations copyWith({
    List<Animation>? animations,
    dynamic extra,
    int? clientId,
  }) =>
      Animations(
        animations: animations ?? this.animations,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'animations';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
