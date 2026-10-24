part of '../tdapi.dart';

/// **InputInvoice** *(inputInvoice)* - parent
///
/// Describes an invoice to process.
sealed class InputInvoice extends TdObject {
  /// **InputInvoice** *(inputInvoice)* - parent
  ///
  /// Describes an invoice to process.
  const InputInvoice();

  /// a InputInvoice return type can be :
  /// * [InputInvoiceMessage]
  /// * [InputInvoiceName]
  /// * [InputInvoiceTelegram]
  factory InputInvoice.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputInvoiceMessage.defaultObjectId:
        return InputInvoiceMessage.fromJson(json);
      case InputInvoiceName.defaultObjectId:
        return InputInvoiceName.fromJson(json);
      case InputInvoiceTelegram.defaultObjectId:
        return InputInvoiceTelegram.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputInvoice)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputInvoice copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputInvoiceMessage** *(inputInvoiceMessage)* - child of InputInvoice
///
/// An invoice from a message of the type messageInvoice or paid media purchase from messagePaidMedia.
///
/// * [chatId]: Chat identifier of the message.
/// * [messageId]: Message identifier. Use messageProperties.can_be_paid to check whether the message can be used in the method.
final class InputInvoiceMessage extends InputInvoice {
  /// **InputInvoiceMessage** *(inputInvoiceMessage)* - child of InputInvoice
  ///
  /// An invoice from a message of the type messageInvoice or paid media purchase from messagePaidMedia.
  ///
  /// * [chatId]: Chat identifier of the message.
  /// * [messageId]: Message identifier. Use messageProperties.can_be_paid to check whether the message can be used in the method.
  const InputInvoiceMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier of the message
  final int chatId;

  /// Message identifier. Use messageProperties.can_be_paid to check whether the message can be used in the method
  final int messageId;

  /// Parse from a json
  factory InputInvoiceMessage.fromJson(Map<String, dynamic> json) =>
      InputInvoiceMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the message
  /// * [message_id]: Message identifier. Use messageProperties.can_be_paid to check whether the message can be used in the method
  @override
  InputInvoiceMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      InputInvoiceMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputInvoiceMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputInvoiceName** *(inputInvoiceName)* - child of InputInvoice
///
/// An invoice from a link of the type internalLinkTypeInvoice.
///
/// * [name]: Name of the invoice.
final class InputInvoiceName extends InputInvoice {
  /// **InputInvoiceName** *(inputInvoiceName)* - child of InputInvoice
  ///
  /// An invoice from a link of the type internalLinkTypeInvoice.
  ///
  /// * [name]: Name of the invoice.
  const InputInvoiceName({
    required this.name,
  });

  /// Name of the invoice
  final String name;

  /// Parse from a json
  factory InputInvoiceName.fromJson(Map<String, dynamic> json) =>
      InputInvoiceName(
        name: json['name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the invoice
  @override
  InputInvoiceName copyWith({
    String? name,
  }) =>
      InputInvoiceName(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputInvoiceName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputInvoiceTelegram** *(inputInvoiceTelegram)* - child of InputInvoice
///
/// An invoice for a payment toward Telegram; must not be used in the in-store apps.
///
/// * [purpose]: Transaction purpose.
final class InputInvoiceTelegram extends InputInvoice {
  /// **InputInvoiceTelegram** *(inputInvoiceTelegram)* - child of InputInvoice
  ///
  /// An invoice for a payment toward Telegram; must not be used in the in-store apps.
  ///
  /// * [purpose]: Transaction purpose.
  const InputInvoiceTelegram({
    required this.purpose,
  });

  /// Transaction purpose
  final TelegramPaymentPurpose purpose;

  /// Parse from a json
  factory InputInvoiceTelegram.fromJson(Map<String, dynamic> json) =>
      InputInvoiceTelegram(
        purpose: TelegramPaymentPurpose.fromJson(json['purpose']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "purpose": purpose.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [purpose]: Transaction purpose
  @override
  InputInvoiceTelegram copyWith({
    TelegramPaymentPurpose? purpose,
  }) =>
      InputInvoiceTelegram(
        purpose: purpose ?? this.purpose,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputInvoiceTelegram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
