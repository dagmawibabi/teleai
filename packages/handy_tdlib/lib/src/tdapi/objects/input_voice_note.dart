part of '../tdapi.dart';

/// **InputVoiceNote** *(inputVoiceNote)* - basic class
///
/// A voice note to be sent.
///
/// * [voiceNote]: Voice note file to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio.
/// * [duration]: Duration of the voice note, in seconds.
/// * [waveform]: Waveform representation of the voice note in 5-bit format.
final class InputVoiceNote extends TdObject {
  /// **InputVoiceNote** *(inputVoiceNote)* - basic class
  ///
  /// A voice note to be sent.
  ///
  /// * [voiceNote]: Voice note file to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio.
  /// * [duration]: Duration of the voice note, in seconds.
  /// * [waveform]: Waveform representation of the voice note in 5-bit format.
  const InputVoiceNote({
    required this.voiceNote,
    required this.duration,
    required this.waveform,
  });

  /// Voice note file to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio
  final InputFile voiceNote;

  /// Duration of the voice note, in seconds
  final int duration;

  /// Waveform representation of the voice note in 5-bit format
  final String waveform;

  /// Parse from a json
  factory InputVoiceNote.fromJson(Map<String, dynamic> json) => InputVoiceNote(
        voiceNote: InputFile.fromJson(json['voice_note']),
        duration: json['duration'],
        waveform: json['waveform'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote.toJson(),
      "duration": duration,
      "waveform": waveform,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: Voice note file to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio
  /// * [duration]: Duration of the voice note, in seconds
  /// * [waveform]: Waveform representation of the voice note in 5-bit format
  InputVoiceNote copyWith({
    InputFile? voiceNote,
    int? duration,
    String? waveform,
  }) =>
      InputVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        duration: duration ?? this.duration,
        waveform: waveform ?? this.waveform,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
