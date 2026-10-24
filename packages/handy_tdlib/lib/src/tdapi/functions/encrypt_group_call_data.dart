part of '../tdapi.dart';

/// **EncryptGroupCallData** *(encryptGroupCallData)* - TDLib function
///
/// Encrypts group call data before sending them over network using tgcalls.
///
/// * [groupCallId]: Group call identifier. The call must not be a video chat.
/// * [dataChannel]: Data channel for which data is encrypted.
/// * [data]: Data to encrypt.
/// * [unencryptedPrefixSize]: Size of data prefix that must be kept unencrypted.
///
/// [Data] is returned on completion.
final class EncryptGroupCallData extends TdFunction {
  /// **EncryptGroupCallData** *(encryptGroupCallData)* - TDLib function
  ///
  /// Encrypts group call data before sending them over network using tgcalls.
  ///
  /// * [groupCallId]: Group call identifier. The call must not be a video chat.
  /// * [dataChannel]: Data channel for which data is encrypted.
  /// * [data]: Data to encrypt.
  /// * [unencryptedPrefixSize]: Size of data prefix that must be kept unencrypted.
  ///
  /// [Data] is returned on completion.
  const EncryptGroupCallData({
    required this.groupCallId,
    required this.dataChannel,
    required this.data,
    required this.unencryptedPrefixSize,
  });

  /// Group call identifier. The call must not be a video chat
  final int groupCallId;

  /// Data channel for which data is encrypted
  final GroupCallDataChannel dataChannel;

  /// Data to encrypt
  final String data;

  /// Size of data prefix that must be kept unencrypted
  final int unencryptedPrefixSize;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "data_channel": dataChannel.toJson(),
      "data": data,
      "unencrypted_prefix_size": unencryptedPrefixSize,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier. The call must not be a video chat
  /// * [data_channel]: Data channel for which data is encrypted
  /// * [data]: Data to encrypt
  /// * [unencrypted_prefix_size]: Size of data prefix that must be kept unencrypted
  EncryptGroupCallData copyWith({
    int? groupCallId,
    GroupCallDataChannel? dataChannel,
    String? data,
    int? unencryptedPrefixSize,
  }) =>
      EncryptGroupCallData(
        groupCallId: groupCallId ?? this.groupCallId,
        dataChannel: dataChannel ?? this.dataChannel,
        data: data ?? this.data,
        unencryptedPrefixSize:
            unencryptedPrefixSize ?? this.unencryptedPrefixSize,
      );

  /// TDLib object type
  static const String defaultObjectId = 'encryptGroupCallData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
