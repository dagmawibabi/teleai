part of '../tdapi.dart';

/// **SuggestedPostInfo** *(suggestedPostInfo)* - basic class
///
/// Contains information about a suggested post. If the post can be approved or declined, then changes to the post can be also suggested. Use sendMessage with reply to the message. and suggested post information to suggest message changes. Use addOffer to suggest price or time changes.
///
/// * [price]: Price of the suggested post; may be null if the post is non-paid *(optional)*.
/// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; 0 if the specific date isn't set yet.
/// * [state]: State of the post.
/// * [canBeApproved]: True, if the suggested post can be approved by the current user using approveSuggestedPost; updates aren't sent when value of this field changes.
/// * [canBeDeclined]: True, if the suggested post can be declined by the current user using declineSuggestedPost; updates aren't sent when value of this field changes.
final class SuggestedPostInfo extends TdObject {
  /// **SuggestedPostInfo** *(suggestedPostInfo)* - basic class
  ///
  /// Contains information about a suggested post. If the post can be approved or declined, then changes to the post can be also suggested. Use sendMessage with reply to the message. and suggested post information to suggest message changes. Use addOffer to suggest price or time changes.
  ///
  /// * [price]: Price of the suggested post; may be null if the post is non-paid *(optional)*.
  /// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; 0 if the specific date isn't set yet.
  /// * [state]: State of the post.
  /// * [canBeApproved]: True, if the suggested post can be approved by the current user using approveSuggestedPost; updates aren't sent when value of this field changes.
  /// * [canBeDeclined]: True, if the suggested post can be declined by the current user using declineSuggestedPost; updates aren't sent when value of this field changes.
  const SuggestedPostInfo({
    this.price,
    required this.sendDate,
    required this.state,
    required this.canBeApproved,
    required this.canBeDeclined,
  });

  /// Price of the suggested post; may be null if the post is non-paid
  final SuggestedPostPrice? price;

  /// Point in time (Unix timestamp) when the post is expected to be published; 0 if the specific date isn't set yet
  final int sendDate;

  /// State of the post
  final SuggestedPostState state;

  /// True, if the suggested post can be approved by the current user using approveSuggestedPost; updates aren't sent when value of this field changes
  final bool canBeApproved;

  /// True, if the suggested post can be declined by the current user using declineSuggestedPost; updates aren't sent when value of this field changes
  final bool canBeDeclined;

  /// Parse from a json
  factory SuggestedPostInfo.fromJson(Map<String, dynamic> json) =>
      SuggestedPostInfo(
        price: json['price'] == null
            ? null
            : SuggestedPostPrice.fromJson(json['price']),
        sendDate: json['send_date'],
        state: SuggestedPostState.fromJson(json['state']),
        canBeApproved: json['can_be_approved'],
        canBeDeclined: json['can_be_declined'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price?.toJson(),
      "send_date": sendDate,
      "state": state.toJson(),
      "can_be_approved": canBeApproved,
      "can_be_declined": canBeDeclined,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: Price of the suggested post; may be null if the post is non-paid
  /// * [send_date]: Point in time (Unix timestamp) when the post is expected to be published; 0 if the specific date isn't set yet
  /// * [state]: State of the post
  /// * [can_be_approved]: True, if the suggested post can be approved by the current user using approveSuggestedPost; updates aren't sent when value of this field changes
  /// * [can_be_declined]: True, if the suggested post can be declined by the current user using declineSuggestedPost; updates aren't sent when value of this field changes
  SuggestedPostInfo copyWith({
    SuggestedPostPrice? price,
    int? sendDate,
    SuggestedPostState? state,
    bool? canBeApproved,
    bool? canBeDeclined,
  }) =>
      SuggestedPostInfo(
        price: price ?? this.price,
        sendDate: sendDate ?? this.sendDate,
        state: state ?? this.state,
        canBeApproved: canBeApproved ?? this.canBeApproved,
        canBeDeclined: canBeDeclined ?? this.canBeDeclined,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
