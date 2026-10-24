part of '../tdapi.dart';

/// **GetBusinessChatLinks** *(getBusinessChatLinks)* - TDLib function
///
/// Returns business chat links created for the current account.
///
/// [BusinessChatLinks] is returned on completion.
final class GetBusinessChatLinks extends TdFunction {
  /// **GetBusinessChatLinks** *(getBusinessChatLinks)* - TDLib function
  ///
  /// Returns business chat links created for the current account.
  ///
  /// [BusinessChatLinks] is returned on completion.
  const GetBusinessChatLinks();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetBusinessChatLinks copyWith() => const GetBusinessChatLinks();

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessChatLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
