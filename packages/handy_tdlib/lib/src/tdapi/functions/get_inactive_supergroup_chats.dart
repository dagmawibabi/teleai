part of '../tdapi.dart';

/// **GetInactiveSupergroupChats** *(getInactiveSupergroupChats)* - TDLib function
///
/// Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels. and receives the error "CHANNELS_TOO_MUCH". Also, the limit can be increased with Telegram Premium.
///
/// [Chats] is returned on completion.
final class GetInactiveSupergroupChats extends TdFunction {
  /// **GetInactiveSupergroupChats** *(getInactiveSupergroupChats)* - TDLib function
  ///
  /// Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels. and receives the error "CHANNELS_TOO_MUCH". Also, the limit can be increased with Telegram Premium.
  ///
  /// [Chats] is returned on completion.
  const GetInactiveSupergroupChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetInactiveSupergroupChats copyWith() => const GetInactiveSupergroupChats();

  /// TDLib object type
  static const String defaultObjectId = 'getInactiveSupergroupChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
