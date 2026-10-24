part of '../tdapi.dart';

/// **VoiceNote** *(voiceNote)* - basic class
///
/// Describes a voice note.
///
/// * [duration]: Duration of the voice note, in seconds; as defined by the sender.
/// * [waveform]: A waveform representation of the voice note in 5-bit format.
/// * [mimeType]: MIME type of the file; as defined by the sender. Usually, one of "audio/ogg" for Opus in an OGG container, "audio/mpeg" for an MP3 audio, or "audio/mp4" for an M4A audio.
/// * [speechRecognitionResult]: Result of speech recognition in the voice note; may be null *(optional)*.
/// * [voice]: File containing the voice note.
final class VoiceNote extends TdObject {
  /// **VoiceNote** *(voiceNote)* - basic class
  ///
  /// Describes a voice note.
  ///
  /// * [duration]: Duration of the voice note, in seconds; as defined by the sender.
  /// * [waveform]: A waveform representation of the voice note in 5-bit format.
  /// * [mimeType]: MIME type of the file; as defined by the sender. Usually, one of "audio/ogg" for Opus in an OGG container, "audio/mpeg" for an MP3 audio, or "audio/mp4" for an M4A audio.
  /// * [speechRecognitionResult]: Result of speech recognition in the voice note; may be null *(optional)*.
  /// * [voice]: File containing the voice note.
  const VoiceNote({
    required this.duration,
    required this.waveform,
    required this.mimeType,
    this.speechRecognitionResult,
    required this.voice,
  });

  /// Duration of the voice note, in seconds; as defined by the sender
  final int duration;

  /// A waveform representation of the voice note in 5-bit format
  final String waveform;

  /// MIME type of the file; as defined by the sender. Usually, one of "audio/ogg" for Opus in an OGG container, "audio/mpeg" for an MP3 audio, or "audio/mp4" for an M4A audio
  final String mimeType;

  /// Result of speech recognition in the voice note; may be null
  final SpeechRecognitionResult? speechRecognitionResult;

  /// File containing the voice note
  final File voice;

  /// Parse from a json
  factory VoiceNote.fromJson(Map<String, dynamic> json) => VoiceNote(
        duration: json['duration'],
        waveform: json['waveform'],
        mimeType: json['mime_type'],
        speechRecognitionResult: json['speech_recognition_result'] == null
            ? null
            : SpeechRecognitionResult.fromJson(
                json['speech_recognition_result']),
        voice: File.fromJson(json['voice']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "duration": duration,
      "waveform": waveform,
      "mime_type": mimeType,
      "speech_recognition_result": speechRecognitionResult?.toJson(),
      "voice": voice.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [duration]: Duration of the voice note, in seconds; as defined by the sender
  /// * [waveform]: A waveform representation of the voice note in 5-bit format
  /// * [mime_type]: MIME type of the file; as defined by the sender. Usually, one of "audio/ogg" for Opus in an OGG container, "audio/mpeg" for an MP3 audio, or "audio/mp4" for an M4A audio
  /// * [speech_recognition_result]: Result of speech recognition in the voice note; may be null
  /// * [voice]: File containing the voice note
  VoiceNote copyWith({
    int? duration,
    String? waveform,
    String? mimeType,
    SpeechRecognitionResult? speechRecognitionResult,
    File? voice,
  }) =>
      VoiceNote(
        duration: duration ?? this.duration,
        waveform: waveform ?? this.waveform,
        mimeType: mimeType ?? this.mimeType,
        speechRecognitionResult:
            speechRecognitionResult ?? this.speechRecognitionResult,
        voice: voice ?? this.voice,
      );

  /// TDLib object type
  static const String defaultObjectId = 'voiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
