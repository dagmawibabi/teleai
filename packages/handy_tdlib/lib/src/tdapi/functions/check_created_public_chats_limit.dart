part of '../tdapi.dart';

/// **CheckCreatedPublicChatsLimit** *(checkCreatedPublicChatsLimit)* - TDLib function
///
/// Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached.. The limit can be increased with Telegram Premium.
///
/// * [type]: Type of the public chats, for which to check the limit.
///
/// [Ok] is returned on completion.
final class CheckCreatedPublicChatsLimit extends TdFunction {
  /// **CheckCreatedPublicChatsLimit** *(checkCreatedPublicChatsLimit)* - TDLib function
  ///
  /// Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached.. The limit can be increased with Telegram Premium.
  ///
  /// * [type]: Type of the public chats, for which to check the limit.
  ///
  /// [Ok] is returned on completion.
  const CheckCreatedPublicChatsLimit({
    required this.type,
  });

  /// Type of the public chats, for which to check the limit
  final PublicChatType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the public chats, for which to check the limit
  CheckCreatedPublicChatsLimit copyWith({
    PublicChatType? type,
  }) =>
      CheckCreatedPublicChatsLimit(
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkCreatedPublicChatsLimit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
