part of '../tdapi.dart';

/// **ReportSponsoredChat** *(reportSponsoredChat)* - TDLib function
///
/// Reports a sponsored chat to Telegram moderators.
///
/// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
/// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
///
/// [ReportSponsoredResult] is returned on completion.
final class ReportSponsoredChat extends TdFunction {
  /// **ReportSponsoredChat** *(reportSponsoredChat)* - TDLib function
  ///
  /// Reports a sponsored chat to Telegram moderators.
  ///
  /// * [sponsoredChatUniqueId]: Unique identifier of the sponsored chat.
  /// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
  ///
  /// [ReportSponsoredResult] is returned on completion.
  const ReportSponsoredChat({
    required this.sponsoredChatUniqueId,
    required this.optionId,
  });

  /// Unique identifier of the sponsored chat
  final int sponsoredChatUniqueId;

  /// Option identifier chosen by the user; leave empty for the initial request
  final String optionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sponsored_chat_unique_id": sponsoredChatUniqueId,
      "option_id": optionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sponsored_chat_unique_id]: Unique identifier of the sponsored chat
  /// * [option_id]: Option identifier chosen by the user; leave empty for the initial request
  ReportSponsoredChat copyWith({
    int? sponsoredChatUniqueId,
    String? optionId,
  }) =>
      ReportSponsoredChat(
        sponsoredChatUniqueId:
            sponsoredChatUniqueId ?? this.sponsoredChatUniqueId,
        optionId: optionId ?? this.optionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSponsoredChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
