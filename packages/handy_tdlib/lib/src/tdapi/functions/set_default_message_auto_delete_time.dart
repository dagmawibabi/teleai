part of '../tdapi.dart';

/// **SetDefaultMessageAutoDeleteTime** *(setDefaultMessageAutoDeleteTime)* - TDLib function
///
/// Changes the default message auto-delete time for new chats.
///
/// * [messageAutoDeleteTime]: New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
///
/// [Ok] is returned on completion.
final class SetDefaultMessageAutoDeleteTime extends TdFunction {
  /// **SetDefaultMessageAutoDeleteTime** *(setDefaultMessageAutoDeleteTime)* - TDLib function
  ///
  /// Changes the default message auto-delete time for new chats.
  ///
  /// * [messageAutoDeleteTime]: New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
  ///
  /// [Ok] is returned on completion.
  const SetDefaultMessageAutoDeleteTime({
    required this.messageAutoDeleteTime,
  });

  /// New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  final MessageAutoDeleteTime messageAutoDeleteTime;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message_auto_delete_time": messageAutoDeleteTime.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_auto_delete_time]: New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  SetDefaultMessageAutoDeleteTime copyWith({
    MessageAutoDeleteTime? messageAutoDeleteTime,
  }) =>
      SetDefaultMessageAutoDeleteTime(
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDefaultMessageAutoDeleteTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
