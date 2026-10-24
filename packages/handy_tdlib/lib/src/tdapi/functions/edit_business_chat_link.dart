part of '../tdapi.dart';

/// **EditBusinessChatLink** *(editBusinessChatLink)* - TDLib function
///
/// Edits a business chat link of the current account. Requires Telegram Business subscription. Returns the edited link.
///
/// * [link]: The link to edit.
/// * [linkInfo]: New description of the link.
///
/// [BusinessChatLink] is returned on completion.
final class EditBusinessChatLink extends TdFunction {
  /// **EditBusinessChatLink** *(editBusinessChatLink)* - TDLib function
  ///
  /// Edits a business chat link of the current account. Requires Telegram Business subscription. Returns the edited link.
  ///
  /// * [link]: The link to edit.
  /// * [linkInfo]: New description of the link.
  ///
  /// [BusinessChatLink] is returned on completion.
  const EditBusinessChatLink({
    required this.link,
    required this.linkInfo,
  });

  /// The link to edit
  final String link;

  /// New description of the link
  final InputBusinessChatLink linkInfo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link": link,
      "link_info": linkInfo.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The link to edit
  /// * [link_info]: New description of the link
  EditBusinessChatLink copyWith({
    String? link,
    InputBusinessChatLink? linkInfo,
  }) =>
      EditBusinessChatLink(
        link: link ?? this.link,
        linkInfo: linkInfo ?? this.linkInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
