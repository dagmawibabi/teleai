part of '../tdapi.dart';

/// **GetBusinessChatLinkInfo** *(getBusinessChatLinkInfo)* - TDLib function
///
/// Returns information about a business chat link.
///
/// * [linkName]: Name of the link.
///
/// [BusinessChatLinkInfo] is returned on completion.
final class GetBusinessChatLinkInfo extends TdFunction {
  /// **GetBusinessChatLinkInfo** *(getBusinessChatLinkInfo)* - TDLib function
  ///
  /// Returns information about a business chat link.
  ///
  /// * [linkName]: Name of the link.
  ///
  /// [BusinessChatLinkInfo] is returned on completion.
  const GetBusinessChatLinkInfo({
    required this.linkName,
  });

  /// Name of the link
  final String linkName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link_name": linkName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link_name]: Name of the link
  GetBusinessChatLinkInfo copyWith({
    String? linkName,
  }) =>
      GetBusinessChatLinkInfo(
        linkName: linkName ?? this.linkName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessChatLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
