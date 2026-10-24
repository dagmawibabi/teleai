part of '../tdapi.dart';

/// **GetChatBoostFeatures** *(getChatBoostFeatures)* - TDLib function
///
/// Returns the list of features available for different chat boost levels. This is an offline method.
///
/// * [isChannel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups.
///
/// [ChatBoostFeatures] is returned on completion.
final class GetChatBoostFeatures extends TdFunction {
  /// **GetChatBoostFeatures** *(getChatBoostFeatures)* - TDLib function
  ///
  /// Returns the list of features available for different chat boost levels. This is an offline method.
  ///
  /// * [isChannel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups.
  ///
  /// [ChatBoostFeatures] is returned on completion.
  const GetChatBoostFeatures({
    required this.isChannel,
  });

  /// Pass true to get the list of features for channels; pass false to get the list of features for supergroups
  final bool isChannel;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "is_channel": isChannel,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_channel]: Pass true to get the list of features for channels; pass false to get the list of features for supergroups
  GetChatBoostFeatures copyWith({
    bool? isChannel,
  }) =>
      GetChatBoostFeatures(
        isChannel: isChannel ?? this.isChannel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatBoostFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
