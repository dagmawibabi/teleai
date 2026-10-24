part of '../tdapi.dart';

/// **PremiumSource** *(premiumSource)* - parent
///
/// Describes a source from which the Premium features screen is opened.
sealed class PremiumSource extends TdObject {
  /// **PremiumSource** *(premiumSource)* - parent
  ///
  /// Describes a source from which the Premium features screen is opened.
  const PremiumSource();

  /// a PremiumSource return type can be :
  /// * [PremiumSourceLimitExceeded]
  /// * [PremiumSourceFeature]
  /// * [PremiumSourceBusinessFeature]
  /// * [PremiumSourceStoryFeature]
  /// * [PremiumSourceLink]
  /// * [PremiumSourceSettings]
  factory PremiumSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PremiumSourceLimitExceeded.defaultObjectId:
        return PremiumSourceLimitExceeded.fromJson(json);
      case PremiumSourceFeature.defaultObjectId:
        return PremiumSourceFeature.fromJson(json);
      case PremiumSourceBusinessFeature.defaultObjectId:
        return PremiumSourceBusinessFeature.fromJson(json);
      case PremiumSourceStoryFeature.defaultObjectId:
        return PremiumSourceStoryFeature.fromJson(json);
      case PremiumSourceLink.defaultObjectId:
        return PremiumSourceLink.fromJson(json);
      case PremiumSourceSettings.defaultObjectId:
        return PremiumSourceSettings.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PremiumSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PremiumSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'premiumSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceLimitExceeded** *(premiumSourceLimitExceeded)* - child of PremiumSource
///
/// A limit was exceeded.
///
/// * [limitType]: Type of the exceeded limit.
final class PremiumSourceLimitExceeded extends PremiumSource {
  /// **PremiumSourceLimitExceeded** *(premiumSourceLimitExceeded)* - child of PremiumSource
  ///
  /// A limit was exceeded.
  ///
  /// * [limitType]: Type of the exceeded limit.
  const PremiumSourceLimitExceeded({
    required this.limitType,
  });

  /// Type of the exceeded limit
  final PremiumLimitType limitType;

  /// Parse from a json
  factory PremiumSourceLimitExceeded.fromJson(Map<String, dynamic> json) =>
      PremiumSourceLimitExceeded(
        limitType: PremiumLimitType.fromJson(json['limit_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "limit_type": limitType.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [limit_type]: Type of the exceeded limit
  @override
  PremiumSourceLimitExceeded copyWith({
    PremiumLimitType? limitType,
  }) =>
      PremiumSourceLimitExceeded(
        limitType: limitType ?? this.limitType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceLimitExceeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceFeature** *(premiumSourceFeature)* - child of PremiumSource
///
/// A user tried to use a Premium feature.
///
/// * [feature]: The used feature.
final class PremiumSourceFeature extends PremiumSource {
  /// **PremiumSourceFeature** *(premiumSourceFeature)* - child of PremiumSource
  ///
  /// A user tried to use a Premium feature.
  ///
  /// * [feature]: The used feature.
  const PremiumSourceFeature({
    required this.feature,
  });

  /// The used feature
  final PremiumFeature feature;

  /// Parse from a json
  factory PremiumSourceFeature.fromJson(Map<String, dynamic> json) =>
      PremiumSourceFeature(
        feature: PremiumFeature.fromJson(json['feature']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "feature": feature.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [feature]: The used feature
  @override
  PremiumSourceFeature copyWith({
    PremiumFeature? feature,
  }) =>
      PremiumSourceFeature(
        feature: feature ?? this.feature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceFeature';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceBusinessFeature** *(premiumSourceBusinessFeature)* - child of PremiumSource
///
/// A user tried to use a Business feature.
///
/// * [feature]: The used feature; pass null if no specific feature was used *(optional)*.
final class PremiumSourceBusinessFeature extends PremiumSource {
  /// **PremiumSourceBusinessFeature** *(premiumSourceBusinessFeature)* - child of PremiumSource
  ///
  /// A user tried to use a Business feature.
  ///
  /// * [feature]: The used feature; pass null if no specific feature was used *(optional)*.
  const PremiumSourceBusinessFeature({
    this.feature,
  });

  /// The used feature; pass null if no specific feature was used
  final BusinessFeature? feature;

  /// Parse from a json
  factory PremiumSourceBusinessFeature.fromJson(Map<String, dynamic> json) =>
      PremiumSourceBusinessFeature(
        feature: json['feature'] == null
            ? null
            : BusinessFeature.fromJson(json['feature']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "feature": feature?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [feature]: The used feature; pass null if no specific feature was used
  @override
  PremiumSourceBusinessFeature copyWith({
    BusinessFeature? feature,
  }) =>
      PremiumSourceBusinessFeature(
        feature: feature ?? this.feature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceBusinessFeature';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceStoryFeature** *(premiumSourceStoryFeature)* - child of PremiumSource
///
/// A user tried to use a Premium story feature.
///
/// * [feature]: The used feature.
final class PremiumSourceStoryFeature extends PremiumSource {
  /// **PremiumSourceStoryFeature** *(premiumSourceStoryFeature)* - child of PremiumSource
  ///
  /// A user tried to use a Premium story feature.
  ///
  /// * [feature]: The used feature.
  const PremiumSourceStoryFeature({
    required this.feature,
  });

  /// The used feature
  final PremiumStoryFeature feature;

  /// Parse from a json
  factory PremiumSourceStoryFeature.fromJson(Map<String, dynamic> json) =>
      PremiumSourceStoryFeature(
        feature: PremiumStoryFeature.fromJson(json['feature']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "feature": feature.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [feature]: The used feature
  @override
  PremiumSourceStoryFeature copyWith({
    PremiumStoryFeature? feature,
  }) =>
      PremiumSourceStoryFeature(
        feature: feature ?? this.feature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceStoryFeature';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceLink** *(premiumSourceLink)* - child of PremiumSource
///
/// A user opened an internal link of the type internalLinkTypePremiumFeaturesPage.
///
/// * [referrer]: The referrer from the link.
final class PremiumSourceLink extends PremiumSource {
  /// **PremiumSourceLink** *(premiumSourceLink)* - child of PremiumSource
  ///
  /// A user opened an internal link of the type internalLinkTypePremiumFeaturesPage.
  ///
  /// * [referrer]: The referrer from the link.
  const PremiumSourceLink({
    required this.referrer,
  });

  /// The referrer from the link
  final String referrer;

  /// Parse from a json
  factory PremiumSourceLink.fromJson(Map<String, dynamic> json) =>
      PremiumSourceLink(
        referrer: json['referrer'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "referrer": referrer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [referrer]: The referrer from the link
  @override
  PremiumSourceLink copyWith({
    String? referrer,
  }) =>
      PremiumSourceLink(
        referrer: referrer ?? this.referrer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PremiumSourceSettings** *(premiumSourceSettings)* - child of PremiumSource
///
/// A user opened the Premium features screen from settings.
final class PremiumSourceSettings extends PremiumSource {
  /// **PremiumSourceSettings** *(premiumSourceSettings)* - child of PremiumSource
  ///
  /// A user opened the Premium features screen from settings.
  const PremiumSourceSettings();

  /// Parse from a json
  factory PremiumSourceSettings.fromJson(Map<String, dynamic> json) =>
      const PremiumSourceSettings();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PremiumSourceSettings copyWith() => const PremiumSourceSettings();

  /// TDLib object type
  static const String defaultObjectId = 'premiumSourceSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
