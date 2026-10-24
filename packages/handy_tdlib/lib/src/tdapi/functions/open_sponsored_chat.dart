part of '../tdapi.dart';

/// **OpenSponsoredChat** *(openSponsoredChat)* - TDLib function
///
/// Informs TDLib that the user opened a sponsored chat.
///
/// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
///
/// [Ok] is returned on completion.
final class OpenSponsoredChat extends TdFunction {
  /// **OpenSponsoredChat** *(openSponsoredChat)* - TDLib function
  ///
  /// Informs TDLib that the user opened a sponsored chat.
  ///
  /// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
  ///
  /// [Ok] is returned on completion.
  const OpenSponsoredChat({
    required this.sponsoredChatUniqueId,
  });

  /// Unique identifier of the sponsored chat
  final int sponsoredChatUniqueId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sponsored_chat_unique_id": sponsoredChatUniqueId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sponsored_chat_unique_id]: Unique identifier of the sponsored chat
  OpenSponsoredChat copyWith({
    int? sponsoredChatUniqueId,
  }) =>
      OpenSponsoredChat(
        sponsoredChatUniqueId:
            sponsoredChatUniqueId ?? this.sponsoredChatUniqueId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'openSponsoredChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
