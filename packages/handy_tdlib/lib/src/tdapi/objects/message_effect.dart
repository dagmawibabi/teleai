part of '../tdapi.dart';

/// **MessageEffect** *(messageEffect)* - basic class
///
/// Contains information about an effect added to a message.
///
/// * [id]: Unique identifier of the effect.
/// * [staticIcon]: Static icon for the effect in WEBP format; may be null if none *(optional)*.
/// * [emoji]: Emoji corresponding to the effect that can be used if static icon isn't available.
/// * [isPremium]: True, if Telegram Premium subscription is required to use the effect.
/// * [type]: Type of the effect.
final class MessageEffect extends TdObject {
  /// **MessageEffect** *(messageEffect)* - basic class
  ///
  /// Contains information about an effect added to a message.
  ///
  /// * [id]: Unique identifier of the effect.
  /// * [staticIcon]: Static icon for the effect in WEBP format; may be null if none *(optional)*.
  /// * [emoji]: Emoji corresponding to the effect that can be used if static icon isn't available.
  /// * [isPremium]: True, if Telegram Premium subscription is required to use the effect.
  /// * [type]: Type of the effect.
  const MessageEffect({
    required this.id,
    this.staticIcon,
    required this.emoji,
    required this.isPremium,
    required this.type,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the effect
  final int id;

  /// Static icon for the effect in WEBP format; may be null if none
  final Sticker? staticIcon;

  /// Emoji corresponding to the effect that can be used if static icon isn't available
  final String emoji;

  /// True, if Telegram Premium subscription is required to use the effect
  final bool isPremium;

  /// Type of the effect
  final MessageEffectType type;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory MessageEffect.fromJson(Map<String, dynamic> json) => MessageEffect(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        staticIcon: json['static_icon'] == null
            ? null
            : Sticker.fromJson(json['static_icon']),
        emoji: json['emoji'],
        isPremium: json['is_premium'],
        type: MessageEffectType.fromJson(json['type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "static_icon": staticIcon?.toJson(),
      "emoji": emoji,
      "is_premium": isPremium,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the effect
  /// * [static_icon]: Static icon for the effect in WEBP format; may be null if none
  /// * [emoji]: Emoji corresponding to the effect that can be used if static icon isn't available
  /// * [is_premium]: True, if Telegram Premium subscription is required to use the effect
  /// * [type]: Type of the effect
  MessageEffect copyWith({
    int? id,
    Sticker? staticIcon,
    String? emoji,
    bool? isPremium,
    MessageEffectType? type,
    dynamic extra,
    int? clientId,
  }) =>
      MessageEffect(
        id: id ?? this.id,
        staticIcon: staticIcon ?? this.staticIcon,
        emoji: emoji ?? this.emoji,
        isPremium: isPremium ?? this.isPremium,
        type: type ?? this.type,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageEffect';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
