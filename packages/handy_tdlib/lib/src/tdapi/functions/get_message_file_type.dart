part of '../tdapi.dart';

/// **GetMessageFileType** *(getMessageFileType)* - TDLib function
///
/// Returns information about a file with messages exported from another application.
///
/// * [messageFileHead]: Beginning of the message file; up to 100 first lines.
///
/// [MessageFileType] is returned on completion.
final class GetMessageFileType extends TdFunction {
  /// **GetMessageFileType** *(getMessageFileType)* - TDLib function
  ///
  /// Returns information about a file with messages exported from another application.
  ///
  /// * [messageFileHead]: Beginning of the message file; up to 100 first lines.
  ///
  /// [MessageFileType] is returned on completion.
  const GetMessageFileType({
    required this.messageFileHead,
  });

  /// Beginning of the message file; up to 100 first lines
  final String messageFileHead;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message_file_head": messageFileHead,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_file_head]: Beginning of the message file; up to 100 first lines
  GetMessageFileType copyWith({
    String? messageFileHead,
  }) =>
      GetMessageFileType(
        messageFileHead: messageFileHead ?? this.messageFileHead,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageFileType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
