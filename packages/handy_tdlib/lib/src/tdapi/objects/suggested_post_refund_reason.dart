part of '../tdapi.dart';

/// **SuggestedPostRefundReason** *(suggestedPostRefundReason)* - parent
///
/// Describes reason for refund of the payment for a suggested post.
sealed class SuggestedPostRefundReason extends TdObject {
  /// **SuggestedPostRefundReason** *(suggestedPostRefundReason)* - parent
  ///
  /// Describes reason for refund of the payment for a suggested post.
  const SuggestedPostRefundReason();

  /// a SuggestedPostRefundReason return type can be :
  /// * [SuggestedPostRefundReasonPostDeleted]
  /// * [SuggestedPostRefundReasonPaymentRefunded]
  factory SuggestedPostRefundReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SuggestedPostRefundReasonPostDeleted.defaultObjectId:
        return SuggestedPostRefundReasonPostDeleted.fromJson(json);
      case SuggestedPostRefundReasonPaymentRefunded.defaultObjectId:
        return SuggestedPostRefundReasonPaymentRefunded.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SuggestedPostRefundReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SuggestedPostRefundReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostRefundReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostRefundReasonPostDeleted** *(suggestedPostRefundReasonPostDeleted)* - child of SuggestedPostRefundReason
///
/// The post was refunded, because it was deleted by channel administrators in less than getOption("suggested_post_lifetime_min") seconds.
final class SuggestedPostRefundReasonPostDeleted
    extends SuggestedPostRefundReason {
  /// **SuggestedPostRefundReasonPostDeleted** *(suggestedPostRefundReasonPostDeleted)* - child of SuggestedPostRefundReason
  ///
  /// The post was refunded, because it was deleted by channel administrators in less than getOption("suggested_post_lifetime_min") seconds.
  const SuggestedPostRefundReasonPostDeleted();

  /// Parse from a json
  factory SuggestedPostRefundReasonPostDeleted.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedPostRefundReasonPostDeleted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedPostRefundReasonPostDeleted copyWith() =>
      const SuggestedPostRefundReasonPostDeleted();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostRefundReasonPostDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostRefundReasonPaymentRefunded** *(suggestedPostRefundReasonPaymentRefunded)* - child of SuggestedPostRefundReason
///
/// The post was refunded, because the payment for the post was refunded.
final class SuggestedPostRefundReasonPaymentRefunded
    extends SuggestedPostRefundReason {
  /// **SuggestedPostRefundReasonPaymentRefunded** *(suggestedPostRefundReasonPaymentRefunded)* - child of SuggestedPostRefundReason
  ///
  /// The post was refunded, because the payment for the post was refunded.
  const SuggestedPostRefundReasonPaymentRefunded();

  /// Parse from a json
  factory SuggestedPostRefundReasonPaymentRefunded.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedPostRefundReasonPaymentRefunded();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedPostRefundReasonPaymentRefunded copyWith() =>
      const SuggestedPostRefundReasonPaymentRefunded();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedPostRefundReasonPaymentRefunded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
