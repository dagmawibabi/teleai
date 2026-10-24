part of '../tdapi.dart';

/// **GetSuitablePersonalChats** *(getSuitablePersonalChats)* - TDLib function
///
/// Returns a list of channel chats, which can be used as a personal chat.
///
/// [Chats] is returned on completion.
final class GetSuitablePersonalChats extends TdFunction {
  /// **GetSuitablePersonalChats** *(getSuitablePersonalChats)* - TDLib function
  ///
  /// Returns a list of channel chats, which can be used as a personal chat.
  ///
  /// [Chats] is returned on completion.
  const GetSuitablePersonalChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSuitablePersonalChats copyWith() => const GetSuitablePersonalChats();

  /// TDLib object type
  static const String defaultObjectId = 'getSuitablePersonalChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
