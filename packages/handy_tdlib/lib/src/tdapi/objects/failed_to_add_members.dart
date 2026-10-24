part of '../tdapi.dart';

/// **FailedToAddMembers** *(failedToAddMembers)* - basic class
///
/// Represents a list of users that has failed to be added to a chat.
///
/// * [failedToAddMembers]: Information about users that weren't added to the chat.
final class FailedToAddMembers extends TdObject {
  /// **FailedToAddMembers** *(failedToAddMembers)* - basic class
  ///
  /// Represents a list of users that has failed to be added to a chat.
  ///
  /// * [failedToAddMembers]: Information about users that weren't added to the chat.
  const FailedToAddMembers({
    required this.failedToAddMembers,
    this.extra,
    this.clientId,
  });

  /// Information about users that weren't added to the chat
  final List<FailedToAddMember> failedToAddMembers;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FailedToAddMembers.fromJson(Map<String, dynamic> json) =>
      FailedToAddMembers(
        failedToAddMembers: List<FailedToAddMember>.from(
            (json['failed_to_add_members'] ?? [])
                .map((item) => FailedToAddMember.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "failed_to_add_members":
          failedToAddMembers.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [failed_to_add_members]: Information about users that weren't added to the chat
  FailedToAddMembers copyWith({
    List<FailedToAddMember>? failedToAddMembers,
    dynamic extra,
    int? clientId,
  }) =>
      FailedToAddMembers(
        failedToAddMembers: failedToAddMembers ?? this.failedToAddMembers,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'failedToAddMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
