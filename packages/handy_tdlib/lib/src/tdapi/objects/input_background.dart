part of '../tdapi.dart';

/// **InputBackground** *(inputBackground)* - parent
///
/// Contains information about background to set.
sealed class InputBackground extends TdObject {
  /// **InputBackground** *(inputBackground)* - parent
  ///
  /// Contains information about background to set.
  const InputBackground();

  /// a InputBackground return type can be :
  /// * [InputBackgroundLocal]
  /// * [InputBackgroundRemote]
  /// * [InputBackgroundPrevious]
  factory InputBackground.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputBackgroundLocal.defaultObjectId:
        return InputBackgroundLocal.fromJson(json);
      case InputBackgroundRemote.defaultObjectId:
        return InputBackgroundRemote.fromJson(json);
      case InputBackgroundPrevious.defaultObjectId:
        return InputBackgroundPrevious.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputBackground)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputBackground copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputBackgroundLocal** *(inputBackgroundLocal)* - child of InputBackground
///
/// A background from a local file.
///
/// * [background]: Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns.
final class InputBackgroundLocal extends InputBackground {
  /// **InputBackgroundLocal** *(inputBackgroundLocal)* - child of InputBackground
  ///
  /// A background from a local file.
  ///
  /// * [background]: Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns.
  const InputBackgroundLocal({
    required this.background,
  });

  /// Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
  final InputFile background;

  /// Parse from a json
  factory InputBackgroundLocal.fromJson(Map<String, dynamic> json) =>
      InputBackgroundLocal(
        background: InputFile.fromJson(json['background']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background": background.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background]: Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
  @override
  InputBackgroundLocal copyWith({
    InputFile? background,
  }) =>
      InputBackgroundLocal(
        background: background ?? this.background,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputBackgroundLocal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputBackgroundRemote** *(inputBackgroundRemote)* - child of InputBackground
///
/// A background from the server.
///
/// * [backgroundId]: The background identifier.
final class InputBackgroundRemote extends InputBackground {
  /// **InputBackgroundRemote** *(inputBackgroundRemote)* - child of InputBackground
  ///
  /// A background from the server.
  ///
  /// * [backgroundId]: The background identifier.
  const InputBackgroundRemote({
    required this.backgroundId,
  });

  /// The background identifier
  final int backgroundId;

  /// Parse from a json
  factory InputBackgroundRemote.fromJson(Map<String, dynamic> json) =>
      InputBackgroundRemote(
        backgroundId: json['background_id'] is int
            ? json['background_id']
            : int.parse(json['background_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background_id": backgroundId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background_id]: The background identifier
  @override
  InputBackgroundRemote copyWith({
    int? backgroundId,
  }) =>
      InputBackgroundRemote(
        backgroundId: backgroundId ?? this.backgroundId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputBackgroundRemote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputBackgroundPrevious** *(inputBackgroundPrevious)* - child of InputBackground
///
/// A background previously set in the chat; for chat backgrounds only.
///
/// * [messageId]: Identifier of the message with the background.
final class InputBackgroundPrevious extends InputBackground {
  /// **InputBackgroundPrevious** *(inputBackgroundPrevious)* - child of InputBackground
  ///
  /// A background previously set in the chat; for chat backgrounds only.
  ///
  /// * [messageId]: Identifier of the message with the background.
  const InputBackgroundPrevious({
    required this.messageId,
  });

  /// Identifier of the message with the background
  final int messageId;

  /// Parse from a json
  factory InputBackgroundPrevious.fromJson(Map<String, dynamic> json) =>
      InputBackgroundPrevious(
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Identifier of the message with the background
  @override
  InputBackgroundPrevious copyWith({
    int? messageId,
  }) =>
      InputBackgroundPrevious(
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputBackgroundPrevious';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
