part of '../tdapi.dart';

/// **ChatRevenueTransactionType** *(chatRevenueTransactionType)* - parent
///
/// Describes type of transaction for revenue earned from sponsored messages in a chat.
sealed class ChatRevenueTransactionType extends TdObject {
  /// **ChatRevenueTransactionType** *(chatRevenueTransactionType)* - parent
  ///
  /// Describes type of transaction for revenue earned from sponsored messages in a chat.
  const ChatRevenueTransactionType();

  /// a ChatRevenueTransactionType return type can be :
  /// * [ChatRevenueTransactionTypeUnsupported]
  /// * [ChatRevenueTransactionTypeSponsoredMessageEarnings]
  /// * [ChatRevenueTransactionTypeSuggestedPostEarnings]
  /// * [ChatRevenueTransactionTypeFragmentWithdrawal]
  /// * [ChatRevenueTransactionTypeFragmentRefund]
  factory ChatRevenueTransactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatRevenueTransactionTypeUnsupported.defaultObjectId:
        return ChatRevenueTransactionTypeUnsupported.fromJson(json);
      case ChatRevenueTransactionTypeSponsoredMessageEarnings.defaultObjectId:
        return ChatRevenueTransactionTypeSponsoredMessageEarnings.fromJson(
            json);
      case ChatRevenueTransactionTypeSuggestedPostEarnings.defaultObjectId:
        return ChatRevenueTransactionTypeSuggestedPostEarnings.fromJson(json);
      case ChatRevenueTransactionTypeFragmentWithdrawal.defaultObjectId:
        return ChatRevenueTransactionTypeFragmentWithdrawal.fromJson(json);
      case ChatRevenueTransactionTypeFragmentRefund.defaultObjectId:
        return ChatRevenueTransactionTypeFragmentRefund.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatRevenueTransactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatRevenueTransactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueTransactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatRevenueTransactionTypeUnsupported** *(chatRevenueTransactionTypeUnsupported)* - child of ChatRevenueTransactionType
///
/// Describes an unsupported transaction.
final class ChatRevenueTransactionTypeUnsupported
    extends ChatRevenueTransactionType {
  /// **ChatRevenueTransactionTypeUnsupported** *(chatRevenueTransactionTypeUnsupported)* - child of ChatRevenueTransactionType
  ///
  /// Describes an unsupported transaction.
  const ChatRevenueTransactionTypeUnsupported();

  /// Parse from a json
  factory ChatRevenueTransactionTypeUnsupported.fromJson(
          Map<String, dynamic> json) =>
      const ChatRevenueTransactionTypeUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatRevenueTransactionTypeUnsupported copyWith() =>
      const ChatRevenueTransactionTypeUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueTransactionTypeUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatRevenueTransactionTypeSponsoredMessageEarnings** *(chatRevenueTransactionTypeSponsoredMessageEarnings)* - child of ChatRevenueTransactionType
///
/// Describes earnings from sponsored messages in a chat in some time frame.
///
/// * [startDate]: Point in time (Unix timestamp) when the earnings started.
/// * [endDate]: Point in time (Unix timestamp) when the earnings ended.
final class ChatRevenueTransactionTypeSponsoredMessageEarnings
    extends ChatRevenueTransactionType {
  /// **ChatRevenueTransactionTypeSponsoredMessageEarnings** *(chatRevenueTransactionTypeSponsoredMessageEarnings)* - child of ChatRevenueTransactionType
  ///
  /// Describes earnings from sponsored messages in a chat in some time frame.
  ///
  /// * [startDate]: Point in time (Unix timestamp) when the earnings started.
  /// * [endDate]: Point in time (Unix timestamp) when the earnings ended.
  const ChatRevenueTransactionTypeSponsoredMessageEarnings({
    required this.startDate,
    required this.endDate,
  });

  /// Point in time (Unix timestamp) when the earnings started
  final int startDate;

  /// Point in time (Unix timestamp) when the earnings ended
  final int endDate;

  /// Parse from a json
  factory ChatRevenueTransactionTypeSponsoredMessageEarnings.fromJson(
          Map<String, dynamic> json) =>
      ChatRevenueTransactionTypeSponsoredMessageEarnings(
        startDate: json['start_date'],
        endDate: json['end_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "start_date": startDate,
      "end_date": endDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_date]: Point in time (Unix timestamp) when the earnings started
  /// * [end_date]: Point in time (Unix timestamp) when the earnings ended
  @override
  ChatRevenueTransactionTypeSponsoredMessageEarnings copyWith({
    int? startDate,
    int? endDate,
  }) =>
      ChatRevenueTransactionTypeSponsoredMessageEarnings(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatRevenueTransactionTypeSponsoredMessageEarnings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatRevenueTransactionTypeSuggestedPostEarnings** *(chatRevenueTransactionTypeSuggestedPostEarnings)* - child of ChatRevenueTransactionType
///
/// Describes earnings from a published suggested post.
///
/// * [userId]: Identifier of the user who paid for the suggested post.
final class ChatRevenueTransactionTypeSuggestedPostEarnings
    extends ChatRevenueTransactionType {
  /// **ChatRevenueTransactionTypeSuggestedPostEarnings** *(chatRevenueTransactionTypeSuggestedPostEarnings)* - child of ChatRevenueTransactionType
  ///
  /// Describes earnings from a published suggested post.
  ///
  /// * [userId]: Identifier of the user who paid for the suggested post.
  const ChatRevenueTransactionTypeSuggestedPostEarnings({
    required this.userId,
  });

  /// Identifier of the user who paid for the suggested post
  final int userId;

  /// Parse from a json
  factory ChatRevenueTransactionTypeSuggestedPostEarnings.fromJson(
          Map<String, dynamic> json) =>
      ChatRevenueTransactionTypeSuggestedPostEarnings(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who paid for the suggested post
  @override
  ChatRevenueTransactionTypeSuggestedPostEarnings copyWith({
    int? userId,
  }) =>
      ChatRevenueTransactionTypeSuggestedPostEarnings(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatRevenueTransactionTypeSuggestedPostEarnings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatRevenueTransactionTypeFragmentWithdrawal** *(chatRevenueTransactionTypeFragmentWithdrawal)* - child of ChatRevenueTransactionType
///
/// Describes a withdrawal of earnings through Fragment.
///
/// * [withdrawalDate]: Point in time (Unix timestamp) when the earnings withdrawal started.
/// * [state]: State of the withdrawal.
final class ChatRevenueTransactionTypeFragmentWithdrawal
    extends ChatRevenueTransactionType {
  /// **ChatRevenueTransactionTypeFragmentWithdrawal** *(chatRevenueTransactionTypeFragmentWithdrawal)* - child of ChatRevenueTransactionType
  ///
  /// Describes a withdrawal of earnings through Fragment.
  ///
  /// * [withdrawalDate]: Point in time (Unix timestamp) when the earnings withdrawal started.
  /// * [state]: State of the withdrawal.
  const ChatRevenueTransactionTypeFragmentWithdrawal({
    required this.withdrawalDate,
    required this.state,
  });

  /// Point in time (Unix timestamp) when the earnings withdrawal started
  final int withdrawalDate;

  /// State of the withdrawal
  final RevenueWithdrawalState state;

  /// Parse from a json
  factory ChatRevenueTransactionTypeFragmentWithdrawal.fromJson(
          Map<String, dynamic> json) =>
      ChatRevenueTransactionTypeFragmentWithdrawal(
        withdrawalDate: json['withdrawal_date'],
        state: RevenueWithdrawalState.fromJson(json['state']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "withdrawal_date": withdrawalDate,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [withdrawal_date]: Point in time (Unix timestamp) when the earnings withdrawal started
  /// * [state]: State of the withdrawal
  @override
  ChatRevenueTransactionTypeFragmentWithdrawal copyWith({
    int? withdrawalDate,
    RevenueWithdrawalState? state,
  }) =>
      ChatRevenueTransactionTypeFragmentWithdrawal(
        withdrawalDate: withdrawalDate ?? this.withdrawalDate,
        state: state ?? this.state,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatRevenueTransactionTypeFragmentWithdrawal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatRevenueTransactionTypeFragmentRefund** *(chatRevenueTransactionTypeFragmentRefund)* - child of ChatRevenueTransactionType
///
/// Describes a refund for failed withdrawal of earnings through Fragment.
///
/// * [refundDate]: Point in time (Unix timestamp) when the transaction was refunded.
final class ChatRevenueTransactionTypeFragmentRefund
    extends ChatRevenueTransactionType {
  /// **ChatRevenueTransactionTypeFragmentRefund** *(chatRevenueTransactionTypeFragmentRefund)* - child of ChatRevenueTransactionType
  ///
  /// Describes a refund for failed withdrawal of earnings through Fragment.
  ///
  /// * [refundDate]: Point in time (Unix timestamp) when the transaction was refunded.
  const ChatRevenueTransactionTypeFragmentRefund({
    required this.refundDate,
  });

  /// Point in time (Unix timestamp) when the transaction was refunded
  final int refundDate;

  /// Parse from a json
  factory ChatRevenueTransactionTypeFragmentRefund.fromJson(
          Map<String, dynamic> json) =>
      ChatRevenueTransactionTypeFragmentRefund(
        refundDate: json['refund_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "refund_date": refundDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [refund_date]: Point in time (Unix timestamp) when the transaction was refunded
  @override
  ChatRevenueTransactionTypeFragmentRefund copyWith({
    int? refundDate,
  }) =>
      ChatRevenueTransactionTypeFragmentRefund(
        refundDate: refundDate ?? this.refundDate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatRevenueTransactionTypeFragmentRefund';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
