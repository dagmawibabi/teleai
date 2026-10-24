part of '../tdapi.dart';

/// **DiceStickers** *(diceStickers)* - parent
///
/// Contains animated stickers which must be used for dice animation rendering.
sealed class DiceStickers extends TdObject {
  /// **DiceStickers** *(diceStickers)* - parent
  ///
  /// Contains animated stickers which must be used for dice animation rendering.
  const DiceStickers();

  /// a DiceStickers return type can be :
  /// * [DiceStickersRegular]
  /// * [DiceStickersSlotMachine]
  factory DiceStickers.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case DiceStickersRegular.defaultObjectId:
        return DiceStickersRegular.fromJson(json);
      case DiceStickersSlotMachine.defaultObjectId:
        return DiceStickersSlotMachine.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of DiceStickers)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  DiceStickers copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'diceStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DiceStickersRegular** *(diceStickersRegular)* - child of DiceStickers
///
/// A regular animated sticker.
///
/// * [sticker]: The animated sticker with the dice animation.
final class DiceStickersRegular extends DiceStickers {
  /// **DiceStickersRegular** *(diceStickersRegular)* - child of DiceStickers
  ///
  /// A regular animated sticker.
  ///
  /// * [sticker]: The animated sticker with the dice animation.
  const DiceStickersRegular({
    required this.sticker,
  });

  /// The animated sticker with the dice animation
  final Sticker sticker;

  /// Parse from a json
  factory DiceStickersRegular.fromJson(Map<String, dynamic> json) =>
      DiceStickersRegular(
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
  /// * [sticker]: The animated sticker with the dice animation
  @override
  DiceStickersRegular copyWith({
    Sticker? sticker,
  }) =>
      DiceStickersRegular(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'diceStickersRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DiceStickersSlotMachine** *(diceStickersSlotMachine)* - child of DiceStickers
///
/// Animated stickers to be combined into a slot machine.
///
/// * [background]: The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish.
/// * [lever]: The animated sticker with the lever animation. The lever animation must play once in the initial dice state.
/// * [leftReel]: The animated sticker with the left reel.
/// * [centerReel]: The animated sticker with the center reel.
/// * [rightReel]: The animated sticker with the right reel.
final class DiceStickersSlotMachine extends DiceStickers {
  /// **DiceStickersSlotMachine** *(diceStickersSlotMachine)* - child of DiceStickers
  ///
  /// Animated stickers to be combined into a slot machine.
  ///
  /// * [background]: The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish.
  /// * [lever]: The animated sticker with the lever animation. The lever animation must play once in the initial dice state.
  /// * [leftReel]: The animated sticker with the left reel.
  /// * [centerReel]: The animated sticker with the center reel.
  /// * [rightReel]: The animated sticker with the right reel.
  const DiceStickersSlotMachine({
    required this.background,
    required this.lever,
    required this.leftReel,
    required this.centerReel,
    required this.rightReel,
  });

  /// The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
  final Sticker background;

  /// The animated sticker with the lever animation. The lever animation must play once in the initial dice state
  final Sticker lever;

  /// The animated sticker with the left reel
  final Sticker leftReel;

  /// The animated sticker with the center reel
  final Sticker centerReel;

  /// The animated sticker with the right reel
  final Sticker rightReel;

  /// Parse from a json
  factory DiceStickersSlotMachine.fromJson(Map<String, dynamic> json) =>
      DiceStickersSlotMachine(
        background: Sticker.fromJson(json['background']),
        lever: Sticker.fromJson(json['lever']),
        leftReel: Sticker.fromJson(json['left_reel']),
        centerReel: Sticker.fromJson(json['center_reel']),
        rightReel: Sticker.fromJson(json['right_reel']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background": background.toJson(),
      "lever": lever.toJson(),
      "left_reel": leftReel.toJson(),
      "center_reel": centerReel.toJson(),
      "right_reel": rightReel.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background]: The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
  /// * [lever]: The animated sticker with the lever animation. The lever animation must play once in the initial dice state
  /// * [left_reel]: The animated sticker with the left reel
  /// * [center_reel]: The animated sticker with the center reel
  /// * [right_reel]: The animated sticker with the right reel
  @override
  DiceStickersSlotMachine copyWith({
    Sticker? background,
    Sticker? lever,
    Sticker? leftReel,
    Sticker? centerReel,
    Sticker? rightReel,
  }) =>
      DiceStickersSlotMachine(
        background: background ?? this.background,
        lever: lever ?? this.lever,
        leftReel: leftReel ?? this.leftReel,
        centerReel: centerReel ?? this.centerReel,
        rightReel: rightReel ?? this.rightReel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'diceStickersSlotMachine';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
