part of '../tdapi.dart';

/// **SuggestedPostState** *(suggestedPostState)* - parent
///
/// Describes state of a suggested post.
sealed class SuggestedPostState extends TdObject {
  /// **SuggestedPostState** *(suggestedPostState)* - parent
  ///
  /// Describes state of a suggested post.
  const SuggestedPostState();

  /// a SuggestedPostState return type can be :
  /// * [SuggestedPostStatePending]
  /// * [SuggestedPostStateApproved]
  /// * [SuggestedPostStateDeclined]
  factory SuggestedPostState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SuggestedPostStatePending.defaultObjectId:
        return SuggestedPostStatePending.fromJson(json);
      case SuggestedPostStateApproved.defaultObjectId:
        return SuggestedPostStateApproved.fromJson(json);
      case SuggestedPostStateDeclined.defaultObjectId:
        return SuggestedPostStateDeclined.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SuggestedPostState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SuggestedPostState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostStatePending** *(suggestedPostStatePending)* - child of SuggestedPostState
///
/// The post must be approved or declined.
final class SuggestedPostStatePending extends SuggestedPostState {
  /// **SuggestedPostStatePending** *(suggestedPostStatePending)* - child of SuggestedPostState
  ///
  /// The post must be approved or declined.
  const SuggestedPostStatePending();

  /// Parse from a json
  factory SuggestedPostStatePending.fromJson(Map<String, dynamic> json) =>
      const SuggestedPostStatePending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedPostStatePending copyWith() => const SuggestedPostStatePending();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostStateApproved** *(suggestedPostStateApproved)* - child of SuggestedPostState
///
/// The post was approved.
final class SuggestedPostStateApproved extends SuggestedPostState {
  /// **SuggestedPostStateApproved** *(suggestedPostStateApproved)* - child of SuggestedPostState
  ///
  /// The post was approved.
  const SuggestedPostStateApproved();

  /// Parse from a json
  factory SuggestedPostStateApproved.fromJson(Map<String, dynamic> json) =>
      const SuggestedPostStateApproved();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedPostStateApproved copyWith() => const SuggestedPostStateApproved();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostStateApproved';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostStateDeclined** *(suggestedPostStateDeclined)* - child of SuggestedPostState
///
/// The post was declined.
final class SuggestedPostStateDeclined extends SuggestedPostState {
  /// **SuggestedPostStateDeclined** *(suggestedPostStateDeclined)* - child of SuggestedPostState
  ///
  /// The post was declined.
  const SuggestedPostStateDeclined();

  /// Parse from a json
  factory SuggestedPostStateDeclined.fromJson(Map<String, dynamic> json) =>
      const SuggestedPostStateDeclined();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedPostStateDeclined copyWith() => const SuggestedPostStateDeclined();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostStateDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
