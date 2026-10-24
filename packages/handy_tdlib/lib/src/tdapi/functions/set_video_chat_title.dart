part of '../tdapi.dart';

/// **SetVideoChatTitle** *(setVideoChatTitle)* - TDLib function
///
/// Sets title of a video chat; requires groupCall.can_be_managed right.
///
/// * [groupCallId]: Group call identifier.
/// * [title]: New group call title; 1-64 characters.
///
/// [Ok] is returned on completion.
final class SetVideoChatTitle extends TdFunction {
  /// **SetVideoChatTitle** *(setVideoChatTitle)* - TDLib function
  ///
  /// Sets title of a video chat; requires groupCall.can_be_managed right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [title]: New group call title; 1-64 characters.
  ///
  /// [Ok] is returned on completion.
  const SetVideoChatTitle({
    required this.groupCallId,
    required this.title,
  });

  /// Group call identifier
  final int groupCallId;

  /// New group call title; 1-64 characters
  final String title;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "title": title,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [title]: New group call title; 1-64 characters
  SetVideoChatTitle copyWith({
    int? groupCallId,
    String? title,
  }) =>
      SetVideoChatTitle(
        groupCallId: groupCallId ?? this.groupCallId,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setVideoChatTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
