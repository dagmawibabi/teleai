part of '../tdapi.dart';

/// **DeleteBusinessChatLink** *(deleteBusinessChatLink)* - TDLib function
///
/// Deletes a business chat link of the current account.
///
/// * [link]: The link to delete.
///
/// [Ok] is returned on completion.
final class DeleteBusinessChatLink extends TdFunction {
  /// **DeleteBusinessChatLink** *(deleteBusinessChatLink)* - TDLib function
  ///
  /// Deletes a business chat link of the current account.
  ///
  /// * [link]: The link to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteBusinessChatLink({
    required this.link,
  });

  /// The link to delete
  final String link;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link": link,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The link to delete
  DeleteBusinessChatLink copyWith({
    String? link,
  }) =>
      DeleteBusinessChatLink(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBusinessChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
