part of '../tdapi.dart';

/// **CreateBusinessChatLink** *(createBusinessChatLink)* - TDLib function
///
/// Creates a business chat link for the current account. Requires Telegram Business subscription. There can be up to getOption("business_chat_link_count_max") links created. Returns the created link.
///
/// * [linkInfo]: Information about the link to create.
///
/// [BusinessChatLink] is returned on completion.
final class CreateBusinessChatLink extends TdFunction {
  /// **CreateBusinessChatLink** *(createBusinessChatLink)* - TDLib function
  ///
  /// Creates a business chat link for the current account. Requires Telegram Business subscription. There can be up to getOption("business_chat_link_count_max") links created. Returns the created link.
  ///
  /// * [linkInfo]: Information about the link to create.
  ///
  /// [BusinessChatLink] is returned on completion.
  const CreateBusinessChatLink({
    required this.linkInfo,
  });

  /// Information about the link to create
  final InputBusinessChatLink linkInfo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link_info": linkInfo.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link_info]: Information about the link to create
  CreateBusinessChatLink copyWith({
    InputBusinessChatLink? linkInfo,
  }) =>
      CreateBusinessChatLink(
        linkInfo: linkInfo ?? this.linkInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createBusinessChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
