part of '../tdapi.dart';

/// **BankCardInfo** *(bankCardInfo)* - basic class
///
/// Information about a bank card.
///
/// * [title]: Title of the bank card description.
/// * [actions]: Actions that can be done with the bank card number.
final class BankCardInfo extends TdObject {
  /// **BankCardInfo** *(bankCardInfo)* - basic class
  ///
  /// Information about a bank card.
  ///
  /// * [title]: Title of the bank card description.
  /// * [actions]: Actions that can be done with the bank card number.
  const BankCardInfo({
    required this.title,
    required this.actions,
    this.extra,
    this.clientId,
  });

  /// Title of the bank card description
  final String title;

  /// Actions that can be done with the bank card number
  final List<BankCardActionOpenUrl> actions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BankCardInfo.fromJson(Map<String, dynamic> json) => BankCardInfo(
        title: json['title'],
        actions: List<BankCardActionOpenUrl>.from((json['actions'] ?? [])
            .map((item) => BankCardActionOpenUrl.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "actions": actions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the bank card description
  /// * [actions]: Actions that can be done with the bank card number
  BankCardInfo copyWith({
    String? title,
    List<BankCardActionOpenUrl>? actions,
    dynamic extra,
    int? clientId,
  }) =>
      BankCardInfo(
        title: title ?? this.title,
        actions: actions ?? this.actions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'bankCardInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
