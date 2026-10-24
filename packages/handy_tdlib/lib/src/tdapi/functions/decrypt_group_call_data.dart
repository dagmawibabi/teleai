part of '../tdapi.dart';

/// **DecryptGroupCallData** *(decryptGroupCallData)* - TDLib function
///
/// Decrypts group call data received by tgcalls.
///
/// * [groupCallId]: Group call identifier. The call must not be a video chat.
/// * [participantId]: Identifier of the group call participant, which sent the data.
/// * [dataChannel]: Data channel for which data was encrypted; pass null if unknown *(optional)*.
/// * [data]: Data to decrypt.
///
/// [Data] is returned on completion.
final class DecryptGroupCallData extends TdFunction {
  /// **DecryptGroupCallData** *(decryptGroupCallData)* - TDLib function
  ///
  /// Decrypts group call data received by tgcalls.
  ///
  /// * [groupCallId]: Group call identifier. The call must not be a video chat.
  /// * [participantId]: Identifier of the group call participant, which sent the data.
  /// * [dataChannel]: Data channel for which data was encrypted; pass null if unknown *(optional)*.
  /// * [data]: Data to decrypt.
  ///
  /// [Data] is returned on completion.
  const DecryptGroupCallData({
    required this.groupCallId,
    required this.participantId,
    this.dataChannel,
    required this.data,
  });

  /// Group call identifier. The call must not be a video chat
  final int groupCallId;

  /// Identifier of the group call participant, which sent the data
  final MessageSender participantId;

  /// Data channel for which data was encrypted; pass null if unknown
  final GroupCallDataChannel? dataChannel;

  /// Data to decrypt
  final String data;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_id": participantId.toJson(),
      "data_channel": dataChannel?.toJson(),
      "data": data,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier. The call must not be a video chat
  /// * [participant_id]: Identifier of the group call participant, which sent the data
  /// * [data_channel]: Data channel for which data was encrypted; pass null if unknown
  /// * [data]: Data to decrypt
  DecryptGroupCallData copyWith({
    int? groupCallId,
    MessageSender? participantId,
    GroupCallDataChannel? dataChannel,
    String? data,
  }) =>
      DecryptGroupCallData(
        groupCallId: groupCallId ?? this.groupCallId,
        participantId: participantId ?? this.participantId,
        dataChannel: dataChannel ?? this.dataChannel,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'decryptGroupCallData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
