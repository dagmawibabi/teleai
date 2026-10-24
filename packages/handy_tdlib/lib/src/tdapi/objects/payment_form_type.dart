part of '../tdapi.dart';

/// **PaymentFormType** *(paymentFormType)* - parent
///
/// Describes type of payment form.
sealed class PaymentFormType extends TdObject {
  /// **PaymentFormType** *(paymentFormType)* - parent
  ///
  /// Describes type of payment form.
  const PaymentFormType();

  /// a PaymentFormType return type can be :
  /// * [PaymentFormTypeRegular]
  /// * [PaymentFormTypeStars]
  /// * [PaymentFormTypeStarSubscription]
  factory PaymentFormType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PaymentFormTypeRegular.defaultObjectId:
        return PaymentFormTypeRegular.fromJson(json);
      case PaymentFormTypeStars.defaultObjectId:
        return PaymentFormTypeStars.fromJson(json);
      case PaymentFormTypeStarSubscription.defaultObjectId:
        return PaymentFormTypeStarSubscription.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PaymentFormType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PaymentFormType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'paymentFormType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentFormTypeRegular** *(paymentFormTypeRegular)* - child of PaymentFormType
///
/// The payment form is for a regular payment.
///
/// * [invoice]: Full information about the invoice.
/// * [paymentProviderUserId]: User identifier of the payment provider bot.
/// * [paymentProvider]: Information about the payment provider.
/// * [additionalPaymentOptions]: The list of additional payment options.
/// * [savedOrderInfo]: Saved server-side order information; may be null *(optional)*.
/// * [savedCredentials]: The list of saved payment credentials.
/// * [canSaveCredentials]: True, if the user can choose to save credentials.
/// * [needPassword]: True, if the user will be able to save credentials, if sets up a 2-step verification password.
final class PaymentFormTypeRegular extends PaymentFormType {
  /// **PaymentFormTypeRegular** *(paymentFormTypeRegular)* - child of PaymentFormType
  ///
  /// The payment form is for a regular payment.
  ///
  /// * [invoice]: Full information about the invoice.
  /// * [paymentProviderUserId]: User identifier of the payment provider bot.
  /// * [paymentProvider]: Information about the payment provider.
  /// * [additionalPaymentOptions]: The list of additional payment options.
  /// * [savedOrderInfo]: Saved server-side order information; may be null *(optional)*.
  /// * [savedCredentials]: The list of saved payment credentials.
  /// * [canSaveCredentials]: True, if the user can choose to save credentials.
  /// * [needPassword]: True, if the user will be able to save credentials, if sets up a 2-step verification password.
  const PaymentFormTypeRegular({
    required this.invoice,
    required this.paymentProviderUserId,
    required this.paymentProvider,
    required this.additionalPaymentOptions,
    this.savedOrderInfo,
    required this.savedCredentials,
    required this.canSaveCredentials,
    required this.needPassword,
  });

  /// Full information about the invoice
  final Invoice invoice;

  /// User identifier of the payment provider bot
  final int paymentProviderUserId;

  /// Information about the payment provider
  final PaymentProvider paymentProvider;

  /// The list of additional payment options
  final List<PaymentOption> additionalPaymentOptions;

  /// Saved server-side order information; may be null
  final OrderInfo? savedOrderInfo;

  /// The list of saved payment credentials
  final List<SavedCredentials> savedCredentials;

  /// True, if the user can choose to save credentials
  final bool canSaveCredentials;

  /// True, if the user will be able to save credentials, if sets up a 2-step verification password
  final bool needPassword;

  /// Parse from a json
  factory PaymentFormTypeRegular.fromJson(Map<String, dynamic> json) =>
      PaymentFormTypeRegular(
        invoice: Invoice.fromJson(json['invoice']),
        paymentProviderUserId: json['payment_provider_user_id'],
        paymentProvider: PaymentProvider.fromJson(json['payment_provider']),
        additionalPaymentOptions: List<PaymentOption>.from(
            (json['additional_payment_options'] ?? [])
                .map((item) => PaymentOption.fromJson(item))
                .toList()),
        savedOrderInfo: json['saved_order_info'] == null
            ? null
            : OrderInfo.fromJson(json['saved_order_info']),
        savedCredentials: List<SavedCredentials>.from(
            (json['saved_credentials'] ?? [])
                .map((item) => SavedCredentials.fromJson(item))
                .toList()),
        canSaveCredentials: json['can_save_credentials'],
        needPassword: json['need_password'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invoice": invoice.toJson(),
      "payment_provider_user_id": paymentProviderUserId,
      "payment_provider": paymentProvider.toJson(),
      "additional_payment_options":
          additionalPaymentOptions.map((i) => i.toJson()).toList(),
      "saved_order_info": savedOrderInfo?.toJson(),
      "saved_credentials": savedCredentials.map((i) => i.toJson()).toList(),
      "can_save_credentials": canSaveCredentials,
      "need_password": needPassword,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invoice]: Full information about the invoice
  /// * [payment_provider_user_id]: User identifier of the payment provider bot
  /// * [payment_provider]: Information about the payment provider
  /// * [additional_payment_options]: The list of additional payment options
  /// * [saved_order_info]: Saved server-side order information; may be null
  /// * [saved_credentials]: The list of saved payment credentials
  /// * [can_save_credentials]: True, if the user can choose to save credentials
  /// * [need_password]: True, if the user will be able to save credentials, if sets up a 2-step verification password
  @override
  PaymentFormTypeRegular copyWith({
    Invoice? invoice,
    int? paymentProviderUserId,
    PaymentProvider? paymentProvider,
    List<PaymentOption>? additionalPaymentOptions,
    OrderInfo? savedOrderInfo,
    List<SavedCredentials>? savedCredentials,
    bool? canSaveCredentials,
    bool? needPassword,
  }) =>
      PaymentFormTypeRegular(
        invoice: invoice ?? this.invoice,
        paymentProviderUserId:
            paymentProviderUserId ?? this.paymentProviderUserId,
        paymentProvider: paymentProvider ?? this.paymentProvider,
        additionalPaymentOptions:
            additionalPaymentOptions ?? this.additionalPaymentOptions,
        savedOrderInfo: savedOrderInfo ?? this.savedOrderInfo,
        savedCredentials: savedCredentials ?? this.savedCredentials,
        canSaveCredentials: canSaveCredentials ?? this.canSaveCredentials,
        needPassword: needPassword ?? this.needPassword,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentFormTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentFormTypeStars** *(paymentFormTypeStars)* - child of PaymentFormType
///
/// The payment form is for a payment in Telegram Stars.
///
/// * [starCount]: Number of Telegram Stars that will be paid.
final class PaymentFormTypeStars extends PaymentFormType {
  /// **PaymentFormTypeStars** *(paymentFormTypeStars)* - child of PaymentFormType
  ///
  /// The payment form is for a payment in Telegram Stars.
  ///
  /// * [starCount]: Number of Telegram Stars that will be paid.
  const PaymentFormTypeStars({
    required this.starCount,
  });

  /// Number of Telegram Stars that will be paid
  final int starCount;

  /// Parse from a json
  factory PaymentFormTypeStars.fromJson(Map<String, dynamic> json) =>
      PaymentFormTypeStars(
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that will be paid
  @override
  PaymentFormTypeStars copyWith({
    int? starCount,
  }) =>
      PaymentFormTypeStars(
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentFormTypeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentFormTypeStarSubscription** *(paymentFormTypeStarSubscription)* - child of PaymentFormType
///
/// The payment form is for a payment in Telegram Stars for subscription.
///
/// * [pricing]: Information about subscription plan.
final class PaymentFormTypeStarSubscription extends PaymentFormType {
  /// **PaymentFormTypeStarSubscription** *(paymentFormTypeStarSubscription)* - child of PaymentFormType
  ///
  /// The payment form is for a payment in Telegram Stars for subscription.
  ///
  /// * [pricing]: Information about subscription plan.
  const PaymentFormTypeStarSubscription({
    required this.pricing,
  });

  /// Information about subscription plan
  final StarSubscriptionPricing pricing;

  /// Parse from a json
  factory PaymentFormTypeStarSubscription.fromJson(Map<String, dynamic> json) =>
      PaymentFormTypeStarSubscription(
        pricing: StarSubscriptionPricing.fromJson(json['pricing']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "pricing": pricing.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pricing]: Information about subscription plan
  @override
  PaymentFormTypeStarSubscription copyWith({
    StarSubscriptionPricing? pricing,
  }) =>
      PaymentFormTypeStarSubscription(
        pricing: pricing ?? this.pricing,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentFormTypeStarSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
