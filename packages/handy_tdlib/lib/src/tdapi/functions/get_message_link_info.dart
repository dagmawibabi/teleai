part of '../tdapi.dart';

/// **GetMessageLinkInfo** *(getMessageLinkInfo)* - TDLib function
///
/// Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage.
///
/// * [url]: The message link.
///
/// [MessageLinkInfo] is returned on completion.
final class GetMessageLinkInfo extends TdFunction {
  /// **GetMessageLinkInfo** *(getMessageLinkInfo)* - TDLib function
  ///
  /// Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage.
  ///
  /// * [url]: The message link.
  ///
  /// [MessageLinkInfo] is returned on completion.
  const GetMessageLinkInfo({
    required this.url,
  });

  /// The message link
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
  /// * [url]: The message link
  GetMessageLinkInfo copyWith({
    String? url,
  }) =>
      GetMessageLinkInfo(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
