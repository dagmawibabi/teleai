part of '../tdapi.dart';

/// **InputSuggestedPostInfo** *(inputSuggestedPostInfo)* - basic class
///
/// Contains information about a post to suggest.
///
/// * [price]: Price of the suggested post; pass null to suggest a post without payment. If the current user isn't an administrator of the channel direct messages chat. and doesn't have enough funds to pay for the post, then the error "BALANCE_TOO_LOW" will be returned immediately *(optional)*.
/// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date isn't restricted. If specified,. then the date must be getOption("suggested_post_send_delay_min")-getOption("suggested_post_send_delay_max") seconds in the future.
final class InputSuggestedPostInfo extends TdObject {
  /// **InputSuggestedPostInfo** *(inputSuggestedPostInfo)* - basic class
  ///
  /// Contains information about a post to suggest.
  ///
  /// * [price]: Price of the suggested post; pass null to suggest a post without payment. If the current user isn't an administrator of the channel direct messages chat. and doesn't have enough funds to pay for the post, then the error "BALANCE_TOO_LOW" will be returned immediately *(optional)*.
  /// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date isn't restricted. If specified,. then the date must be getOption("suggested_post_send_delay_min")-getOption("suggested_post_send_delay_max") seconds in the future.
  const InputSuggestedPostInfo({
    this.price,
    required this.sendDate,
  });

  /// Price of the suggested post; pass null to suggest a post without payment. If the current user isn't an administrator of the channel direct messages chat. and doesn't have enough funds to pay for the post, then the error "BALANCE_TOO_LOW" will be returned immediately
  final SuggestedPostPrice? price;

  /// Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date isn't restricted. If specified,. then the date must be getOption("suggested_post_send_delay_min")-getOption("suggested_post_send_delay_max") seconds in the future
  final int sendDate;

  /// Parse from a json
  factory InputSuggestedPostInfo.fromJson(Map<String, dynamic> json) =>
      InputSuggestedPostInfo(
        price: json['price'] == null
            ? null
            : SuggestedPostPrice.fromJson(json['price']),
        sendDate: json['send_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price?.toJson(),
      "send_date": sendDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: Price of the suggested post; pass null to suggest a post without payment. If the current user isn't an administrator of the channel direct messages chat. and doesn't have enough funds to pay for the post, then the error "BALANCE_TOO_LOW" will be returned immediately
  /// * [send_date]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date isn't restricted. If specified,. then the date must be getOption("suggested_post_send_delay_min")-getOption("suggested_post_send_delay_max") seconds in the future
  InputSuggestedPostInfo copyWith({
    SuggestedPostPrice? price,
    int? sendDate,
  }) =>
      InputSuggestedPostInfo(
        price: price ?? this.price,
        sendDate: sendDate ?? this.sendDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputSuggestedPostInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
