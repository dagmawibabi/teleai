part of '../tdapi.dart';

/// **MessageEffectType** *(messageEffectType)* - parent
///
/// Describes type of emoji effect.
sealed class MessageEffectType extends TdObject {
  /// **MessageEffectType** *(messageEffectType)* - parent
  ///
  /// Describes type of emoji effect.
  const MessageEffectType();

  /// a MessageEffectType return type can be :
  /// * [MessageEffectTypeEmojiReaction]
  /// * [MessageEffectTypePremiumSticker]
  factory MessageEffectType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageEffectTypeEmojiReaction.defaultObjectId:
        return MessageEffectTypeEmojiReaction.fromJson(json);
      case MessageEffectTypePremiumSticker.defaultObjectId:
        return MessageEffectTypePremiumSticker.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageEffectType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageEffectType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageEffectType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageEffectTypeEmojiReaction** *(messageEffectTypeEmojiReaction)* - child of MessageEffectType
///
/// An effect from an emoji reaction.
///
/// * [selectAnimation]: Select animation for the effect in TGS format.
/// * [effectAnimation]: Effect animation for the effect in TGS format.
final class MessageEffectTypeEmojiReaction extends MessageEffectType {
  /// **MessageEffectTypeEmojiReaction** *(messageEffectTypeEmojiReaction)* - child of MessageEffectType
  ///
  /// An effect from an emoji reaction.
  ///
  /// * [selectAnimation]: Select animation for the effect in TGS format.
  /// * [effectAnimation]: Effect animation for the effect in TGS format.
  const MessageEffectTypeEmojiReaction({
    required this.selectAnimation,
    required this.effectAnimation,
  });

  /// Select animation for the effect in TGS format
  final Sticker selectAnimation;

  /// Effect animation for the effect in TGS format
  final Sticker effectAnimation;

  /// Parse from a json
  factory MessageEffectTypeEmojiReaction.fromJson(Map<String, dynamic> json) =>
      MessageEffectTypeEmojiReaction(
        selectAnimation: Sticker.fromJson(json['select_animation']),
        effectAnimation: Sticker.fromJson(json['effect_animation']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "select_animation": selectAnimation.toJson(),
      "effect_animation": effectAnimation.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [select_animation]: Select animation for the effect in TGS format
  /// * [effect_animation]: Effect animation for the effect in TGS format
  @override
  MessageEffectTypeEmojiReaction copyWith({
    Sticker? selectAnimation,
    Sticker? effectAnimation,
  }) =>
      MessageEffectTypeEmojiReaction(
        selectAnimation: selectAnimation ?? this.selectAnimation,
        effectAnimation: effectAnimation ?? this.effectAnimation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageEffectTypeEmojiReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageEffectTypePremiumSticker** *(messageEffectTypePremiumSticker)* - child of MessageEffectType
///
/// An effect from a premium sticker.
///
/// * [sticker]: The premium sticker. The effect can be found at sticker.full_type.premium_animation.
final class MessageEffectTypePremiumSticker extends MessageEffectType {
  /// **MessageEffectTypePremiumSticker** *(messageEffectTypePremiumSticker)* - child of MessageEffectType
  ///
  /// An effect from a premium sticker.
  ///
  /// * [sticker]: The premium sticker. The effect can be found at sticker.full_type.premium_animation.
  const MessageEffectTypePremiumSticker({
    required this.sticker,
  });

  /// The premium sticker. The effect can be found at sticker.full_type.premium_animation
  final Sticker sticker;

  /// Parse from a json
  factory MessageEffectTypePremiumSticker.fromJson(Map<String, dynamic> json) =>
      MessageEffectTypePremiumSticker(
        sticker: Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: The premium sticker. The effect can be found at sticker.full_type.premium_animation
  @override
  MessageEffectTypePremiumSticker copyWith({
    Sticker? sticker,
  }) =>
      MessageEffectTypePremiumSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageEffectTypePremiumSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
