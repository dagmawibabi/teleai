part of '../tdapi.dart';

/// **GetPaymentReceipt** *(getPaymentReceipt)* - TDLib function
///
/// Returns information about a successful payment.
///
/// * [chatId]: Chat identifier of the messagePaymentSuccessful message.
/// * [messageId]: Message identifier.
///
/// [PaymentReceipt] is returned on completion.
final class GetPaymentReceipt extends TdFunction {
  /// **GetPaymentReceipt** *(getPaymentReceipt)* - TDLib function
  ///
  /// Returns information about a successful payment.
  ///
  /// * [chatId]: Chat identifier of the messagePaymentSuccessful message.
  /// * [messageId]: Message identifier.
  ///
  /// [PaymentReceipt] is returned on completion.
  const GetPaymentReceipt({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier of the messagePaymentSuccessful message
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the messagePaymentSuccessful message
  /// * [message_id]: Message identifier
  GetPaymentReceipt copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetPaymentReceipt(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPaymentReceipt';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
