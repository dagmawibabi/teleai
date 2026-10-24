part of '../tdapi.dart';

/// **CallProblem** *(callProblem)* - parent
///
/// Describes the exact type of problem with a call.
sealed class CallProblem extends TdObject {
  /// **CallProblem** *(callProblem)* - parent
  ///
  /// Describes the exact type of problem with a call.
  const CallProblem();

  /// a CallProblem return type can be :
  /// * [CallProblemEcho]
  /// * [CallProblemNoise]
  /// * [CallProblemInterruptions]
  /// * [CallProblemDistortedSpeech]
  /// * [CallProblemSilentLocal]
  /// * [CallProblemSilentRemote]
  /// * [CallProblemDropped]
  /// * [CallProblemDistortedVideo]
  /// * [CallProblemPixelatedVideo]
  factory CallProblem.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CallProblemEcho.defaultObjectId:
        return CallProblemEcho.fromJson(json);
      case CallProblemNoise.defaultObjectId:
        return CallProblemNoise.fromJson(json);
      case CallProblemInterruptions.defaultObjectId:
        return CallProblemInterruptions.fromJson(json);
      case CallProblemDistortedSpeech.defaultObjectId:
        return CallProblemDistortedSpeech.fromJson(json);
      case CallProblemSilentLocal.defaultObjectId:
        return CallProblemSilentLocal.fromJson(json);
      case CallProblemSilentRemote.defaultObjectId:
        return CallProblemSilentRemote.fromJson(json);
      case CallProblemDropped.defaultObjectId:
        return CallProblemDropped.fromJson(json);
      case CallProblemDistortedVideo.defaultObjectId:
        return CallProblemDistortedVideo.fromJson(json);
      case CallProblemPixelatedVideo.defaultObjectId:
        return CallProblemPixelatedVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CallProblem)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CallProblem copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'callProblem';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemEcho** *(callProblemEcho)* - child of CallProblem
///
/// The user heard their own voice.
final class CallProblemEcho extends CallProblem {
  /// **CallProblemEcho** *(callProblemEcho)* - child of CallProblem
  ///
  /// The user heard their own voice.
  const CallProblemEcho();

  /// Parse from a json
  factory CallProblemEcho.fromJson(Map<String, dynamic> json) =>
      const CallProblemEcho();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemEcho copyWith() => const CallProblemEcho();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemEcho';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemNoise** *(callProblemNoise)* - child of CallProblem
///
/// The user heard background noise.
final class CallProblemNoise extends CallProblem {
  /// **CallProblemNoise** *(callProblemNoise)* - child of CallProblem
  ///
  /// The user heard background noise.
  const CallProblemNoise();

  /// Parse from a json
  factory CallProblemNoise.fromJson(Map<String, dynamic> json) =>
      const CallProblemNoise();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemNoise copyWith() => const CallProblemNoise();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemNoise';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemInterruptions** *(callProblemInterruptions)* - child of CallProblem
///
/// The other side kept disappearing.
final class CallProblemInterruptions extends CallProblem {
  /// **CallProblemInterruptions** *(callProblemInterruptions)* - child of CallProblem
  ///
  /// The other side kept disappearing.
  const CallProblemInterruptions();

  /// Parse from a json
  factory CallProblemInterruptions.fromJson(Map<String, dynamic> json) =>
      const CallProblemInterruptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemInterruptions copyWith() => const CallProblemInterruptions();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemInterruptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemDistortedSpeech** *(callProblemDistortedSpeech)* - child of CallProblem
///
/// The speech was distorted.
final class CallProblemDistortedSpeech extends CallProblem {
  /// **CallProblemDistortedSpeech** *(callProblemDistortedSpeech)* - child of CallProblem
  ///
  /// The speech was distorted.
  const CallProblemDistortedSpeech();

  /// Parse from a json
  factory CallProblemDistortedSpeech.fromJson(Map<String, dynamic> json) =>
      const CallProblemDistortedSpeech();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemDistortedSpeech copyWith() => const CallProblemDistortedSpeech();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemDistortedSpeech';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemSilentLocal** *(callProblemSilentLocal)* - child of CallProblem
///
/// The user couldn't hear the other side.
final class CallProblemSilentLocal extends CallProblem {
  /// **CallProblemSilentLocal** *(callProblemSilentLocal)* - child of CallProblem
  ///
  /// The user couldn't hear the other side.
  const CallProblemSilentLocal();

  /// Parse from a json
  factory CallProblemSilentLocal.fromJson(Map<String, dynamic> json) =>
      const CallProblemSilentLocal();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemSilentLocal copyWith() => const CallProblemSilentLocal();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemSilentLocal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemSilentRemote** *(callProblemSilentRemote)* - child of CallProblem
///
/// The other side couldn't hear the user.
final class CallProblemSilentRemote extends CallProblem {
  /// **CallProblemSilentRemote** *(callProblemSilentRemote)* - child of CallProblem
  ///
  /// The other side couldn't hear the user.
  const CallProblemSilentRemote();

  /// Parse from a json
  factory CallProblemSilentRemote.fromJson(Map<String, dynamic> json) =>
      const CallProblemSilentRemote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemSilentRemote copyWith() => const CallProblemSilentRemote();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemSilentRemote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemDropped** *(callProblemDropped)* - child of CallProblem
///
/// The call ended unexpectedly.
final class CallProblemDropped extends CallProblem {
  /// **CallProblemDropped** *(callProblemDropped)* - child of CallProblem
  ///
  /// The call ended unexpectedly.
  const CallProblemDropped();

  /// Parse from a json
  factory CallProblemDropped.fromJson(Map<String, dynamic> json) =>
      const CallProblemDropped();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemDropped copyWith() => const CallProblemDropped();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemDropped';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemDistortedVideo** *(callProblemDistortedVideo)* - child of CallProblem
///
/// The video was distorted.
final class CallProblemDistortedVideo extends CallProblem {
  /// **CallProblemDistortedVideo** *(callProblemDistortedVideo)* - child of CallProblem
  ///
  /// The video was distorted.
  const CallProblemDistortedVideo();

  /// Parse from a json
  factory CallProblemDistortedVideo.fromJson(Map<String, dynamic> json) =>
      const CallProblemDistortedVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemDistortedVideo copyWith() => const CallProblemDistortedVideo();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemDistortedVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallProblemPixelatedVideo** *(callProblemPixelatedVideo)* - child of CallProblem
///
/// The video was pixelated.
final class CallProblemPixelatedVideo extends CallProblem {
  /// **CallProblemPixelatedVideo** *(callProblemPixelatedVideo)* - child of CallProblem
  ///
  /// The video was pixelated.
  const CallProblemPixelatedVideo();

  /// Parse from a json
  factory CallProblemPixelatedVideo.fromJson(Map<String, dynamic> json) =>
      const CallProblemPixelatedVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallProblemPixelatedVideo copyWith() => const CallProblemPixelatedVideo();

  /// TDLib object type
  static const String defaultObjectId = 'callProblemPixelatedVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
