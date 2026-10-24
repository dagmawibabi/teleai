part of '../tdapi.dart';

/// **PaymentOption** *(paymentOption)* - basic class
///
/// Describes an additional payment option.
///
/// * [title]: Title for the payment option.
/// * [url]: Payment form URL to be opened in a web view.
final class PaymentOption extends TdObject {
  /// **PaymentOption** *(paymentOption)* - basic class
  ///
  /// Describes an additional payment option.
  ///
  /// * [title]: Title for the payment option.
  /// * [url]: Payment form URL to be opened in a web view.
  const PaymentOption({
    required this.title,
    required this.url,
  });

  /// Title for the payment option
  final String title;

  /// Payment form URL to be opened in a web view
  final String url;

  /// Parse from a json
  factory PaymentOption.fromJson(Map<String, dynamic> json) => PaymentOption(
        title: json['title'],
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title for the payment option
  /// * [url]: Payment form URL to be opened in a web view
  PaymentOption copyWith({
    String? title,
    String? url,
  }) =>
      PaymentOption(
        title: title ?? this.title,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
