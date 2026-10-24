part of '../tdapi.dart';

/// **GetChatBoostLevelFeatures** *(getChatBoostLevelFeatures)* - TDLib function
///
/// Returns the list of features available on the specific chat boost level. This is an offline method.
///
/// * [isChannel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups.
/// * [level]: Chat boost level.
///
/// [ChatBoostLevelFeatures] is returned on completion.
final class GetChatBoostLevelFeatures extends TdFunction {
  /// **GetChatBoostLevelFeatures** *(getChatBoostLevelFeatures)* - TDLib function
  ///
  /// Returns the list of features available on the specific chat boost level. This is an offline method.
  ///
  /// * [isChannel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups.
  /// * [level]: Chat boost level.
  ///
  /// [ChatBoostLevelFeatures] is returned on completion.
  const GetChatBoostLevelFeatures({
    required this.isChannel,
    required this.level,
  });

  /// Pass true to get the list of features for channels; pass false to get the list of features for supergroups
  final bool isChannel;

  /// Chat boost level
  final int level;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "is_channel": isChannel,
      "level": level,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_channel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups
  /// * [level]: Chat boost level
  GetChatBoostLevelFeatures copyWith({
    bool? isChannel,
    int? level,
  }) =>
      GetChatBoostLevelFeatures(
        isChannel: isChannel ?? this.isChannel,
        level: level ?? this.level,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatBoostLevelFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
