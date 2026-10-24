part of '../tdapi.dart';

/// **RevenueWithdrawalState** *(revenueWithdrawalState)* - parent
///
/// Describes state of a revenue withdrawal.
sealed class RevenueWithdrawalState extends TdObject {
  /// **RevenueWithdrawalState** *(revenueWithdrawalState)* - parent
  ///
  /// Describes state of a revenue withdrawal.
  const RevenueWithdrawalState();

  /// a RevenueWithdrawalState return type can be :
  /// * [RevenueWithdrawalStatePending]
  /// * [RevenueWithdrawalStateSucceeded]
  /// * [RevenueWithdrawalStateFailed]
  factory RevenueWithdrawalState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case RevenueWithdrawalStatePending.defaultObjectId:
        return RevenueWithdrawalStatePending.fromJson(json);
      case RevenueWithdrawalStateSucceeded.defaultObjectId:
        return RevenueWithdrawalStateSucceeded.fromJson(json);
      case RevenueWithdrawalStateFailed.defaultObjectId:
        return RevenueWithdrawalStateFailed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of RevenueWithdrawalState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  RevenueWithdrawalState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'revenueWithdrawalState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RevenueWithdrawalStatePending** *(revenueWithdrawalStatePending)* - child of RevenueWithdrawalState
///
/// Withdrawal is pending.
final class RevenueWithdrawalStatePending extends RevenueWithdrawalState {
  /// **RevenueWithdrawalStatePending** *(revenueWithdrawalStatePending)* - child of RevenueWithdrawalState
  ///
  /// Withdrawal is pending.
  const RevenueWithdrawalStatePending();

  /// Parse from a json
  factory RevenueWithdrawalStatePending.fromJson(Map<String, dynamic> json) =>
      const RevenueWithdrawalStatePending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  RevenueWithdrawalStatePending copyWith() =>
      const RevenueWithdrawalStatePending();

  /// TDLib object type
  static const String defaultObjectId = 'revenueWithdrawalStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RevenueWithdrawalStateSucceeded** *(revenueWithdrawalStateSucceeded)* - child of RevenueWithdrawalState
///
/// Withdrawal succeeded.
///
/// * [date]: Point in time (Unix timestamp) when the withdrawal was completed.
/// * [url]: The URL where the withdrawal transaction can be viewed.
final class RevenueWithdrawalStateSucceeded extends RevenueWithdrawalState {
  /// **RevenueWithdrawalStateSucceeded** *(revenueWithdrawalStateSucceeded)* - child of RevenueWithdrawalState
  ///
  /// Withdrawal succeeded.
  ///
  /// * [date]: Point in time (Unix timestamp) when the withdrawal was completed.
  /// * [url]: The URL where the withdrawal transaction can be viewed.
  const RevenueWithdrawalStateSucceeded({
    required this.date,
    required this.url,
  });

  /// Point in time (Unix timestamp) when the withdrawal was completed
  final int date;

  /// The URL where the withdrawal transaction can be viewed
  final String url;

  /// Parse from a json
  factory RevenueWithdrawalStateSucceeded.fromJson(Map<String, dynamic> json) =>
      RevenueWithdrawalStateSucceeded(
        date: json['date'],
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "date": date,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [date]: Point in time (Unix timestamp) when the withdrawal was completed
  /// * [url]: The URL where the withdrawal transaction can be viewed
  @override
  RevenueWithdrawalStateSucceeded copyWith({
    int? date,
    String? url,
  }) =>
      RevenueWithdrawalStateSucceeded(
        date: date ?? this.date,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'revenueWithdrawalStateSucceeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RevenueWithdrawalStateFailed** *(revenueWithdrawalStateFailed)* - child of RevenueWithdrawalState
///
/// Withdrawal failed.
final class RevenueWithdrawalStateFailed extends RevenueWithdrawalState {
  /// **RevenueWithdrawalStateFailed** *(revenueWithdrawalStateFailed)* - child of RevenueWithdrawalState
  ///
  /// Withdrawal failed.
  const RevenueWithdrawalStateFailed();

  /// Parse from a json
  factory RevenueWithdrawalStateFailed.fromJson(Map<String, dynamic> json) =>
      const RevenueWithdrawalStateFailed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  RevenueWithdrawalStateFailed copyWith() =>
      const RevenueWithdrawalStateFailed();

  /// TDLib object type
  static const String defaultObjectId = 'revenueWithdrawalStateFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
