part of '../tdapi.dart';

/// **ViewSponsoredChat** *(viewSponsoredChat)* - TDLib function
///
/// Informs TDLib that the user fully viewed a sponsored chat.
///
/// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
///
/// [Ok] is returned on completion.
final class ViewSponsoredChat extends TdFunction {
  /// **ViewSponsoredChat** *(viewSponsoredChat)* - TDLib function
  ///
  /// Informs TDLib that the user fully viewed a sponsored chat.
  ///
  /// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
  ///
  /// [Ok] is returned on completion.
  const ViewSponsoredChat({
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
  ViewSponsoredChat copyWith({
    int? sponsoredChatUniqueId,
  }) =>
      ViewSponsoredChat(
        sponsoredChatUniqueId:
            sponsoredChatUniqueId ?? this.sponsoredChatUniqueId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'viewSponsoredChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
