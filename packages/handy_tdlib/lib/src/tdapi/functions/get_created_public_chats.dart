part of '../tdapi.dart';

/// **GetCreatedPublicChats** *(getCreatedPublicChats)* - TDLib function
///
/// Returns a list of public chats of the specified type, owned by the user.
///
/// * [type]: Type of the public chats to return.
///
/// [Chats] is returned on completion.
final class GetCreatedPublicChats extends TdFunction {
  /// **GetCreatedPublicChats** *(getCreatedPublicChats)* - TDLib function
  ///
  /// Returns a list of public chats of the specified type, owned by the user.
  ///
  /// * [type]: Type of the public chats to return.
  ///
  /// [Chats] is returned on completion.
  const GetCreatedPublicChats({
    required this.type,
  });

  /// Type of the public chats to return
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
  /// * [type]: Type of the public chats to return
  GetCreatedPublicChats copyWith({
    PublicChatType? type,
  }) =>
      GetCreatedPublicChats(
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCreatedPublicChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
