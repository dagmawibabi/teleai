part of '../tdapi.dart';

/// **AvailableReaction** *(availableReaction)* - basic class
///
/// Represents an available reaction.
///
/// * [type]: Type of the reaction.
/// * [needsPremium]: True, if Telegram Premium is needed to send the reaction.
final class AvailableReaction extends TdObject {
  /// **AvailableReaction** *(availableReaction)* - basic class
  ///
  /// Represents an available reaction.
  ///
  /// * [type]: Type of the reaction.
  /// * [needsPremium]: True, if Telegram Premium is needed to send the reaction.
  const AvailableReaction({
    required this.type,
    required this.needsPremium,
  });

  /// Type of the reaction
  final ReactionType type;

  /// True, if Telegram Premium is needed to send the reaction
  final bool needsPremium;

  /// Parse from a json
  factory AvailableReaction.fromJson(Map<String, dynamic> json) =>
      AvailableReaction(
        type: ReactionType.fromJson(json['type']),
        needsPremium: json['needs_premium'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "needs_premium": needsPremium,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the reaction
  /// * [needs_premium]: True, if Telegram Premium is needed to send the reaction
  AvailableReaction copyWith({
    ReactionType? type,
    bool? needsPremium,
  }) =>
      AvailableReaction(
        type: type ?? this.type,
        needsPremium: needsPremium ?? this.needsPremium,
      );

  /// TDLib object type
  static const String defaultObjectId = 'availableReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
