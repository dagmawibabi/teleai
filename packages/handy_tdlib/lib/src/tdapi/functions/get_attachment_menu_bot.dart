part of '../tdapi.dart';

/// **GetAttachmentMenuBot** *(getAttachmentMenuBot)* - TDLib function
///
/// Returns information about a bot that can be added to attachment or side menu.
///
/// * [botUserId]: Bot's user identifier.
///
/// [AttachmentMenuBot] is returned on completion.
final class GetAttachmentMenuBot extends TdFunction {
  /// **GetAttachmentMenuBot** *(getAttachmentMenuBot)* - TDLib function
  ///
  /// Returns information about a bot that can be added to attachment or side menu.
  ///
  /// * [botUserId]: Bot's user identifier.
  ///
  /// [AttachmentMenuBot] is returned on completion.
  const GetAttachmentMenuBot({
    required this.botUserId,
  });

  /// Bot's user identifier
  final int botUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Bot's user identifier
  GetAttachmentMenuBot copyWith({
    int? botUserId,
  }) =>
      GetAttachmentMenuBot(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAttachmentMenuBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
