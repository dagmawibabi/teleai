part of '../tdapi.dart';

/// **GetChatBoostLinkInfo** *(getChatBoostLinkInfo)* - TDLib function
///
/// Returns information about a link to boost a chat. Can be called for any internal link of the type internalLinkTypeChatBoost.
///
/// * [url]: The link to boost a chat.
///
/// [ChatBoostLinkInfo] is returned on completion.
final class GetChatBoostLinkInfo extends TdFunction {
  /// **GetChatBoostLinkInfo** *(getChatBoostLinkInfo)* - TDLib function
  ///
  /// Returns information about a link to boost a chat. Can be called for any internal link of the type internalLinkTypeChatBoost.
  ///
  /// * [url]: The link to boost a chat.
  ///
  /// [ChatBoostLinkInfo] is returned on completion.
  const GetChatBoostLinkInfo({
    required this.url,
  });

  /// The link to boost a chat
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The link to boost a chat
  GetChatBoostLinkInfo copyWith({
    String? url,
  }) =>
      GetChatBoostLinkInfo(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatBoostLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
