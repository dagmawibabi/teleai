part of '../tdapi.dart';

/// **SetDefaultReactionType** *(setDefaultReactionType)* - TDLib function
///
/// Changes type of default reaction for the current user.
///
/// * [reactionType]: New type of the default reaction. The paid reaction can't be set as default.
///
/// [Ok] is returned on completion.
final class SetDefaultReactionType extends TdFunction {
  /// **SetDefaultReactionType** *(setDefaultReactionType)* - TDLib function
  ///
  /// Changes type of default reaction for the current user.
  ///
  /// * [reactionType]: New type of the default reaction. The paid reaction can't be set as default.
  ///
  /// [Ok] is returned on completion.
  const SetDefaultReactionType({
    required this.reactionType,
  });

  /// New type of the default reaction. The paid reaction can't be set as default
  final ReactionType reactionType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "reaction_type": reactionType.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reaction_type]: New type of the default reaction. The paid reaction can't be set as default
  SetDefaultReactionType copyWith({
    ReactionType? reactionType,
  }) =>
      SetDefaultReactionType(
        reactionType: reactionType ?? this.reactionType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDefaultReactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
