part of '../tdapi.dart';

/// **DraftMessageContent** *(draftMessageContent)* - parent
///
/// Content of the message draft.
sealed class DraftMessageContent extends TdObject {
  /// **DraftMessageContent** *(draftMessageContent)* - parent
  ///
  /// Content of the message draft.
  const DraftMessageContent();

  /// a DraftMessageContent return type can be :
  /// * [DraftMessageContentText]
  /// * [DraftMessageContentRichMessage]
  /// * [DraftMessageContentInputRichMessage]
  /// * [DraftMessageContentVideoNote]
  /// * [DraftMessageContentVoiceNote]
  factory DraftMessageContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case DraftMessageContentText.defaultObjectId:
        return DraftMessageContentText.fromJson(json);
      case DraftMessageContentRichMessage.defaultObjectId:
        return DraftMessageContentRichMessage.fromJson(json);
      case DraftMessageContentInputRichMessage.defaultObjectId:
        return DraftMessageContentInputRichMessage.fromJson(json);
      case DraftMessageContentVideoNote.defaultObjectId:
        return DraftMessageContentVideoNote.fromJson(json);
      case DraftMessageContentVoiceNote.defaultObjectId:
        return DraftMessageContentVoiceNote.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of DraftMessageContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  DraftMessageContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DraftMessageContentText** *(draftMessageContentText)* - child of DraftMessageContent
///
/// A text message draft.
///
/// * [text]: Formatted text to be saved as a draft; 0-getOption("message_text_length_max") characters.
/// * [linkPreviewOptions]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options *(optional)*.
final class DraftMessageContentText extends DraftMessageContent {
  /// **DraftMessageContentText** *(draftMessageContentText)* - child of DraftMessageContent
  ///
  /// A text message draft.
  ///
  /// * [text]: Formatted text to be saved as a draft; 0-getOption("message_text_length_max") characters.
  /// * [linkPreviewOptions]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options *(optional)*.
  const DraftMessageContentText({
    required this.text,
    this.linkPreviewOptions,
  });

  /// Formatted text to be saved as a draft; 0-getOption("message_text_length_max") characters
  final FormattedText text;

  /// Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
  final LinkPreviewOptions? linkPreviewOptions;

  /// Parse from a json
  factory DraftMessageContentText.fromJson(Map<String, dynamic> json) =>
      DraftMessageContentText(
        text: FormattedText.fromJson(json['text']),
        linkPreviewOptions: json['link_preview_options'] == null
            ? null
            : LinkPreviewOptions.fromJson(json['link_preview_options']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "link_preview_options": linkPreviewOptions?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Formatted text to be saved as a draft; 0-getOption("message_text_length_max") characters
  /// * [link_preview_options]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
  @override
  DraftMessageContentText copyWith({
    FormattedText? text,
    LinkPreviewOptions? linkPreviewOptions,
  }) =>
      DraftMessageContentText(
        text: text ?? this.text,
        linkPreviewOptions: linkPreviewOptions ?? this.linkPreviewOptions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContentText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DraftMessageContentRichMessage** *(draftMessageContentRichMessage)* - child of DraftMessageContent
///
/// A rich message draft; not supported in setChatDraftMessage.
///
/// * [message]: The rich message.
final class DraftMessageContentRichMessage extends DraftMessageContent {
  /// **DraftMessageContentRichMessage** *(draftMessageContentRichMessage)* - child of DraftMessageContent
  ///
  /// A rich message draft; not supported in setChatDraftMessage.
  ///
  /// * [message]: The rich message.
  const DraftMessageContentRichMessage({
    required this.message,
  });

  /// The rich message
  final RichMessage message;

  /// Parse from a json
  factory DraftMessageContentRichMessage.fromJson(Map<String, dynamic> json) =>
      DraftMessageContentRichMessage(
        message: RichMessage.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The rich message
  @override
  DraftMessageContentRichMessage copyWith({
    RichMessage? message,
  }) =>
      DraftMessageContentRichMessage(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContentRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DraftMessageContentInputRichMessage** *(draftMessageContentInputRichMessage)* - child of DraftMessageContent
///
/// A rich message draft; only for setChatDraftMessage.
///
/// * [message]: The rich message.
final class DraftMessageContentInputRichMessage extends DraftMessageContent {
  /// **DraftMessageContentInputRichMessage** *(draftMessageContentInputRichMessage)* - child of DraftMessageContent
  ///
  /// A rich message draft; only for setChatDraftMessage.
  ///
  /// * [message]: The rich message.
  const DraftMessageContentInputRichMessage({
    required this.message,
  });

  /// The rich message
  final InputRichMessage message;

  /// Parse from a json
  factory DraftMessageContentInputRichMessage.fromJson(
          Map<String, dynamic> json) =>
      DraftMessageContentInputRichMessage(
        message: InputRichMessage.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The rich message
  @override
  DraftMessageContentInputRichMessage copyWith({
    InputRichMessage? message,
  }) =>
      DraftMessageContentInputRichMessage(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContentInputRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DraftMessageContentVideoNote** *(draftMessageContentVideoNote)* - child of DraftMessageContent
///
/// A video note message draft.
///
/// * [filePath]: Path to the file with the video note.
/// * [duration]: Duration of the video, in seconds; 0-60.
/// * [length]: Video width and height; must be positive and not greater than 640.
/// * [selfDestructType]: Video note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
final class DraftMessageContentVideoNote extends DraftMessageContent {
  /// **DraftMessageContentVideoNote** *(draftMessageContentVideoNote)* - child of DraftMessageContent
  ///
  /// A video note message draft.
  ///
  /// * [filePath]: Path to the file with the video note.
  /// * [duration]: Duration of the video, in seconds; 0-60.
  /// * [length]: Video width and height; must be positive and not greater than 640.
  /// * [selfDestructType]: Video note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
  const DraftMessageContentVideoNote({
    required this.filePath,
    required this.duration,
    required this.length,
    this.selfDestructType,
  });

  /// Path to the file with the video note
  final String filePath;

  /// Duration of the video, in seconds; 0-60
  final int duration;

  /// Video width and height; must be positive and not greater than 640
  final int length;

  /// Video note self-destruct type; may be null if none; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// Parse from a json
  factory DraftMessageContentVideoNote.fromJson(Map<String, dynamic> json) =>
      DraftMessageContentVideoNote(
        filePath: json['file_path'],
        duration: json['duration'],
        length: json['length'],
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_path": filePath,
      "duration": duration,
      "length": length,
      "self_destruct_type": selfDestructType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_path]: Path to the file with the video note
  /// * [duration]: Duration of the video, in seconds; 0-60
  /// * [length]: Video width and height; must be positive and not greater than 640
  /// * [self_destruct_type]: Video note self-destruct type; may be null if none; pass null if none; private chats only
  @override
  DraftMessageContentVideoNote copyWith({
    String? filePath,
    int? duration,
    int? length,
    MessageSelfDestructType? selfDestructType,
  }) =>
      DraftMessageContentVideoNote(
        filePath: filePath ?? this.filePath,
        duration: duration ?? this.duration,
        length: length ?? this.length,
        selfDestructType: selfDestructType ?? this.selfDestructType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContentVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DraftMessageContentVoiceNote** *(draftMessageContentVoiceNote)* - child of DraftMessageContent
///
/// A voice note message draft.
///
/// * [filePath]: Path to the file with the voice note.
/// * [duration]: Duration of the voice note, in seconds.
/// * [waveform]: Waveform representation of the voice note in 5-bit format.
/// * [selfDestructType]: Voice note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
final class DraftMessageContentVoiceNote extends DraftMessageContent {
  /// **DraftMessageContentVoiceNote** *(draftMessageContentVoiceNote)* - child of DraftMessageContent
  ///
  /// A voice note message draft.
  ///
  /// * [filePath]: Path to the file with the voice note.
  /// * [duration]: Duration of the voice note, in seconds.
  /// * [waveform]: Waveform representation of the voice note in 5-bit format.
  /// * [selfDestructType]: Voice note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
  const DraftMessageContentVoiceNote({
    required this.filePath,
    required this.duration,
    required this.waveform,
    this.selfDestructType,
  });

  /// Path to the file with the voice note
  final String filePath;

  /// Duration of the voice note, in seconds
  final int duration;

  /// Waveform representation of the voice note in 5-bit format
  final String waveform;

  /// Voice note self-destruct type; may be null if none; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// Parse from a json
  factory DraftMessageContentVoiceNote.fromJson(Map<String, dynamic> json) =>
      DraftMessageContentVoiceNote(
        filePath: json['file_path'],
        duration: json['duration'],
        waveform: json['waveform'],
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_path": filePath,
      "duration": duration,
      "waveform": waveform,
      "self_destruct_type": selfDestructType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_path]: Path to the file with the voice note
  /// * [duration]: Duration of the voice note, in seconds
  /// * [waveform]: Waveform representation of the voice note in 5-bit format
  /// * [self_destruct_type]: Voice note self-destruct type; may be null if none; pass null if none; private chats only
  @override
  DraftMessageContentVoiceNote copyWith({
    String? filePath,
    int? duration,
    String? waveform,
    MessageSelfDestructType? selfDestructType,
  }) =>
      DraftMessageContentVoiceNote(
        filePath: filePath ?? this.filePath,
        duration: duration ?? this.duration,
        waveform: waveform ?? this.waveform,
        selfDestructType: selfDestructType ?? this.selfDestructType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessageContentVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
