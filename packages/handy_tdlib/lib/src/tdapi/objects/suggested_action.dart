part of '../tdapi.dart';

/// **SuggestedAction** *(suggestedAction)* - parent
///
/// Describes an action suggested to the current user.
sealed class SuggestedAction extends TdObject {
  /// **SuggestedAction** *(suggestedAction)* - parent
  ///
  /// Describes an action suggested to the current user.
  const SuggestedAction();

  /// a SuggestedAction return type can be :
  /// * [SuggestedActionEnableArchiveAndMuteNewChats]
  /// * [SuggestedActionCheckPassword]
  /// * [SuggestedActionCheckPhoneNumber]
  /// * [SuggestedActionViewChecksHint]
  /// * [SuggestedActionViewFirstTonWalletTransferHint]
  /// * [SuggestedActionConvertToBroadcastGroup]
  /// * [SuggestedActionSetPassword]
  /// * [SuggestedActionUpgradePremium]
  /// * [SuggestedActionRestorePremium]
  /// * [SuggestedActionSubscribeToAnnualPremium]
  /// * [SuggestedActionGiftPremiumForChristmas]
  /// * [SuggestedActionSetBirthdate]
  /// * [SuggestedActionSetProfilePhoto]
  /// * [SuggestedActionExtendPremium]
  /// * [SuggestedActionExtendStarSubscriptions]
  /// * [SuggestedActionCustom]
  /// * [SuggestedActionSetLoginEmailAddress]
  /// * [SuggestedActionAddLoginPasskey]
  factory SuggestedAction.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SuggestedActionEnableArchiveAndMuteNewChats.defaultObjectId:
        return SuggestedActionEnableArchiveAndMuteNewChats.fromJson(json);
      case SuggestedActionCheckPassword.defaultObjectId:
        return SuggestedActionCheckPassword.fromJson(json);
      case SuggestedActionCheckPhoneNumber.defaultObjectId:
        return SuggestedActionCheckPhoneNumber.fromJson(json);
      case SuggestedActionViewChecksHint.defaultObjectId:
        return SuggestedActionViewChecksHint.fromJson(json);
      case SuggestedActionViewFirstTonWalletTransferHint.defaultObjectId:
        return SuggestedActionViewFirstTonWalletTransferHint.fromJson(json);
      case SuggestedActionConvertToBroadcastGroup.defaultObjectId:
        return SuggestedActionConvertToBroadcastGroup.fromJson(json);
      case SuggestedActionSetPassword.defaultObjectId:
        return SuggestedActionSetPassword.fromJson(json);
      case SuggestedActionUpgradePremium.defaultObjectId:
        return SuggestedActionUpgradePremium.fromJson(json);
      case SuggestedActionRestorePremium.defaultObjectId:
        return SuggestedActionRestorePremium.fromJson(json);
      case SuggestedActionSubscribeToAnnualPremium.defaultObjectId:
        return SuggestedActionSubscribeToAnnualPremium.fromJson(json);
      case SuggestedActionGiftPremiumForChristmas.defaultObjectId:
        return SuggestedActionGiftPremiumForChristmas.fromJson(json);
      case SuggestedActionSetBirthdate.defaultObjectId:
        return SuggestedActionSetBirthdate.fromJson(json);
      case SuggestedActionSetProfilePhoto.defaultObjectId:
        return SuggestedActionSetProfilePhoto.fromJson(json);
      case SuggestedActionExtendPremium.defaultObjectId:
        return SuggestedActionExtendPremium.fromJson(json);
      case SuggestedActionExtendStarSubscriptions.defaultObjectId:
        return SuggestedActionExtendStarSubscriptions.fromJson(json);
      case SuggestedActionCustom.defaultObjectId:
        return SuggestedActionCustom.fromJson(json);
      case SuggestedActionSetLoginEmailAddress.defaultObjectId:
        return SuggestedActionSetLoginEmailAddress.fromJson(json);
      case SuggestedActionAddLoginPasskey.defaultObjectId:
        return SuggestedActionAddLoginPasskey.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SuggestedAction)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SuggestedAction copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionEnableArchiveAndMuteNewChats** *(suggestedActionEnableArchiveAndMuteNewChats)* - child of SuggestedAction
///
/// Suggests the user to enable archive_and_mute_new_chats_from_unknown_users setting in archiveChatListSettings.
final class SuggestedActionEnableArchiveAndMuteNewChats
    extends SuggestedAction {
  /// **SuggestedActionEnableArchiveAndMuteNewChats** *(suggestedActionEnableArchiveAndMuteNewChats)* - child of SuggestedAction
  ///
  /// Suggests the user to enable archive_and_mute_new_chats_from_unknown_users setting in archiveChatListSettings.
  const SuggestedActionEnableArchiveAndMuteNewChats();

  /// Parse from a json
  factory SuggestedActionEnableArchiveAndMuteNewChats.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedActionEnableArchiveAndMuteNewChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionEnableArchiveAndMuteNewChats copyWith() =>
      const SuggestedActionEnableArchiveAndMuteNewChats();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionEnableArchiveAndMuteNewChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionCheckPassword** *(suggestedActionCheckPassword)* - child of SuggestedAction
///
/// Suggests the user to check whether they still remember their 2-step verification password.
final class SuggestedActionCheckPassword extends SuggestedAction {
  /// **SuggestedActionCheckPassword** *(suggestedActionCheckPassword)* - child of SuggestedAction
  ///
  /// Suggests the user to check whether they still remember their 2-step verification password.
  const SuggestedActionCheckPassword();

  /// Parse from a json
  factory SuggestedActionCheckPassword.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionCheckPassword();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionCheckPassword copyWith() =>
      const SuggestedActionCheckPassword();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionCheckPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionCheckPhoneNumber** *(suggestedActionCheckPhoneNumber)* - child of SuggestedAction
///
/// Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible.
final class SuggestedActionCheckPhoneNumber extends SuggestedAction {
  /// **SuggestedActionCheckPhoneNumber** *(suggestedActionCheckPhoneNumber)* - child of SuggestedAction
  ///
  /// Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible.
  const SuggestedActionCheckPhoneNumber();

  /// Parse from a json
  factory SuggestedActionCheckPhoneNumber.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionCheckPhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionCheckPhoneNumber copyWith() =>
      const SuggestedActionCheckPhoneNumber();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionCheckPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionViewChecksHint** *(suggestedActionViewChecksHint)* - child of SuggestedAction
///
/// Suggests the user to view a hint about the meaning of one and two check marks on sent messages.
final class SuggestedActionViewChecksHint extends SuggestedAction {
  /// **SuggestedActionViewChecksHint** *(suggestedActionViewChecksHint)* - child of SuggestedAction
  ///
  /// Suggests the user to view a hint about the meaning of one and two check marks on sent messages.
  const SuggestedActionViewChecksHint();

  /// Parse from a json
  factory SuggestedActionViewChecksHint.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionViewChecksHint();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionViewChecksHint copyWith() =>
      const SuggestedActionViewChecksHint();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionViewChecksHint';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionViewFirstTonWalletTransferHint** *(suggestedActionViewFirstTonWalletTransferHint)* - child of SuggestedAction
///
/// Suggests the user to view a hint about receiving of the first TON wallet transfer.
final class SuggestedActionViewFirstTonWalletTransferHint
    extends SuggestedAction {
  /// **SuggestedActionViewFirstTonWalletTransferHint** *(suggestedActionViewFirstTonWalletTransferHint)* - child of SuggestedAction
  ///
  /// Suggests the user to view a hint about receiving of the first TON wallet transfer.
  const SuggestedActionViewFirstTonWalletTransferHint();

  /// Parse from a json
  factory SuggestedActionViewFirstTonWalletTransferHint.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedActionViewFirstTonWalletTransferHint();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionViewFirstTonWalletTransferHint copyWith() =>
      const SuggestedActionViewFirstTonWalletTransferHint();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionViewFirstTonWalletTransferHint';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionConvertToBroadcastGroup** *(suggestedActionConvertToBroadcastGroup)* - child of SuggestedAction
///
/// Suggests the user to convert specified supergroup to a broadcast group.
///
/// * [supergroupId]: Supergroup identifier.
final class SuggestedActionConvertToBroadcastGroup extends SuggestedAction {
  /// **SuggestedActionConvertToBroadcastGroup** *(suggestedActionConvertToBroadcastGroup)* - child of SuggestedAction
  ///
  /// Suggests the user to convert specified supergroup to a broadcast group.
  ///
  /// * [supergroupId]: Supergroup identifier.
  const SuggestedActionConvertToBroadcastGroup({
    required this.supergroupId,
  });

  /// Supergroup identifier
  final int supergroupId;

  /// Parse from a json
  factory SuggestedActionConvertToBroadcastGroup.fromJson(
          Map<String, dynamic> json) =>
      SuggestedActionConvertToBroadcastGroup(
        supergroupId: json['supergroup_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Supergroup identifier
  @override
  SuggestedActionConvertToBroadcastGroup copyWith({
    int? supergroupId,
  }) =>
      SuggestedActionConvertToBroadcastGroup(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionConvertToBroadcastGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionSetPassword** *(suggestedActionSetPassword)* - child of SuggestedAction
///
/// Suggests the user to set a 2-step verification password to be able to log in again.
///
/// * [authorizationDelay]: The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons.
final class SuggestedActionSetPassword extends SuggestedAction {
  /// **SuggestedActionSetPassword** *(suggestedActionSetPassword)* - child of SuggestedAction
  ///
  /// Suggests the user to set a 2-step verification password to be able to log in again.
  ///
  /// * [authorizationDelay]: The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons.
  const SuggestedActionSetPassword({
    required this.authorizationDelay,
  });

  /// The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons
  final int authorizationDelay;

  /// Parse from a json
  factory SuggestedActionSetPassword.fromJson(Map<String, dynamic> json) =>
      SuggestedActionSetPassword(
        authorizationDelay: json['authorization_delay'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "authorization_delay": authorizationDelay,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [authorization_delay]: The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons
  @override
  SuggestedActionSetPassword copyWith({
    int? authorizationDelay,
  }) =>
      SuggestedActionSetPassword(
        authorizationDelay: authorizationDelay ?? this.authorizationDelay,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionSetPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionUpgradePremium** *(suggestedActionUpgradePremium)* - child of SuggestedAction
///
/// Suggests the user to upgrade the Premium subscription from monthly payments to annual payments.
final class SuggestedActionUpgradePremium extends SuggestedAction {
  /// **SuggestedActionUpgradePremium** *(suggestedActionUpgradePremium)* - child of SuggestedAction
  ///
  /// Suggests the user to upgrade the Premium subscription from monthly payments to annual payments.
  const SuggestedActionUpgradePremium();

  /// Parse from a json
  factory SuggestedActionUpgradePremium.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionUpgradePremium();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionUpgradePremium copyWith() =>
      const SuggestedActionUpgradePremium();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionUpgradePremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionRestorePremium** *(suggestedActionRestorePremium)* - child of SuggestedAction
///
/// Suggests the user to restore a recently expired Premium subscription.
final class SuggestedActionRestorePremium extends SuggestedAction {
  /// **SuggestedActionRestorePremium** *(suggestedActionRestorePremium)* - child of SuggestedAction
  ///
  /// Suggests the user to restore a recently expired Premium subscription.
  const SuggestedActionRestorePremium();

  /// Parse from a json
  factory SuggestedActionRestorePremium.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionRestorePremium();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionRestorePremium copyWith() =>
      const SuggestedActionRestorePremium();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionRestorePremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionSubscribeToAnnualPremium** *(suggestedActionSubscribeToAnnualPremium)* - child of SuggestedAction
///
/// Suggests the user to subscribe to the Premium subscription with annual payments.
final class SuggestedActionSubscribeToAnnualPremium extends SuggestedAction {
  /// **SuggestedActionSubscribeToAnnualPremium** *(suggestedActionSubscribeToAnnualPremium)* - child of SuggestedAction
  ///
  /// Suggests the user to subscribe to the Premium subscription with annual payments.
  const SuggestedActionSubscribeToAnnualPremium();

  /// Parse from a json
  factory SuggestedActionSubscribeToAnnualPremium.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedActionSubscribeToAnnualPremium();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionSubscribeToAnnualPremium copyWith() =>
      const SuggestedActionSubscribeToAnnualPremium();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionSubscribeToAnnualPremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionGiftPremiumForChristmas** *(suggestedActionGiftPremiumForChristmas)* - child of SuggestedAction
///
/// Suggests the user to gift Telegram Premium to friends for Christmas.
final class SuggestedActionGiftPremiumForChristmas extends SuggestedAction {
  /// **SuggestedActionGiftPremiumForChristmas** *(suggestedActionGiftPremiumForChristmas)* - child of SuggestedAction
  ///
  /// Suggests the user to gift Telegram Premium to friends for Christmas.
  const SuggestedActionGiftPremiumForChristmas();

  /// Parse from a json
  factory SuggestedActionGiftPremiumForChristmas.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedActionGiftPremiumForChristmas();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionGiftPremiumForChristmas copyWith() =>
      const SuggestedActionGiftPremiumForChristmas();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionGiftPremiumForChristmas';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionSetBirthdate** *(suggestedActionSetBirthdate)* - child of SuggestedAction
///
/// Suggests the user to set birthdate.
final class SuggestedActionSetBirthdate extends SuggestedAction {
  /// **SuggestedActionSetBirthdate** *(suggestedActionSetBirthdate)* - child of SuggestedAction
  ///
  /// Suggests the user to set birthdate.
  const SuggestedActionSetBirthdate();

  /// Parse from a json
  factory SuggestedActionSetBirthdate.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionSetBirthdate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionSetBirthdate copyWith() => const SuggestedActionSetBirthdate();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionSetBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionSetProfilePhoto** *(suggestedActionSetProfilePhoto)* - child of SuggestedAction
///
/// Suggests the user to set profile photo.
final class SuggestedActionSetProfilePhoto extends SuggestedAction {
  /// **SuggestedActionSetProfilePhoto** *(suggestedActionSetProfilePhoto)* - child of SuggestedAction
  ///
  /// Suggests the user to set profile photo.
  const SuggestedActionSetProfilePhoto();

  /// Parse from a json
  factory SuggestedActionSetProfilePhoto.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionSetProfilePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionSetProfilePhoto copyWith() =>
      const SuggestedActionSetProfilePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionSetProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionExtendPremium** *(suggestedActionExtendPremium)* - child of SuggestedAction
///
/// Suggests the user to extend their expiring Telegram Premium subscription.
///
/// * [managePremiumSubscriptionUrl]: A URL for managing Telegram Premium subscription.
final class SuggestedActionExtendPremium extends SuggestedAction {
  /// **SuggestedActionExtendPremium** *(suggestedActionExtendPremium)* - child of SuggestedAction
  ///
  /// Suggests the user to extend their expiring Telegram Premium subscription.
  ///
  /// * [managePremiumSubscriptionUrl]: A URL for managing Telegram Premium subscription.
  const SuggestedActionExtendPremium({
    required this.managePremiumSubscriptionUrl,
  });

  /// A URL for managing Telegram Premium subscription
  final String managePremiumSubscriptionUrl;

  /// Parse from a json
  factory SuggestedActionExtendPremium.fromJson(Map<String, dynamic> json) =>
      SuggestedActionExtendPremium(
        managePremiumSubscriptionUrl: json['manage_premium_subscription_url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "manage_premium_subscription_url": managePremiumSubscriptionUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [manage_premium_subscription_url]: A URL for managing Telegram Premium subscription
  @override
  SuggestedActionExtendPremium copyWith({
    String? managePremiumSubscriptionUrl,
  }) =>
      SuggestedActionExtendPremium(
        managePremiumSubscriptionUrl:
            managePremiumSubscriptionUrl ?? this.managePremiumSubscriptionUrl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionExtendPremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionExtendStarSubscriptions** *(suggestedActionExtendStarSubscriptions)* - child of SuggestedAction
///
/// Suggests the user to extend their expiring Telegram Star subscriptions. Call getStarSubscriptions with only_expiring == true. to get the number of expiring subscriptions and the number of required to buy Telegram Stars.
final class SuggestedActionExtendStarSubscriptions extends SuggestedAction {
  /// **SuggestedActionExtendStarSubscriptions** *(suggestedActionExtendStarSubscriptions)* - child of SuggestedAction
  ///
  /// Suggests the user to extend their expiring Telegram Star subscriptions. Call getStarSubscriptions with only_expiring == true. to get the number of expiring subscriptions and the number of required to buy Telegram Stars.
  const SuggestedActionExtendStarSubscriptions();

  /// Parse from a json
  factory SuggestedActionExtendStarSubscriptions.fromJson(
          Map<String, dynamic> json) =>
      const SuggestedActionExtendStarSubscriptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionExtendStarSubscriptions copyWith() =>
      const SuggestedActionExtendStarSubscriptions();

  /// TDLib object type
  static const String defaultObjectId =
      'suggestedActionExtendStarSubscriptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionCustom** *(suggestedActionCustom)* - child of SuggestedAction
///
/// A custom suggestion to be shown at the top of the chat list.
///
/// * [name]: Unique name of the suggestion.
/// * [title]: Title of the suggestion.
/// * [description]: Description of the suggestion.
/// * [url]: The link to open when the suggestion is clicked.
final class SuggestedActionCustom extends SuggestedAction {
  /// **SuggestedActionCustom** *(suggestedActionCustom)* - child of SuggestedAction
  ///
  /// A custom suggestion to be shown at the top of the chat list.
  ///
  /// * [name]: Unique name of the suggestion.
  /// * [title]: Title of the suggestion.
  /// * [description]: Description of the suggestion.
  /// * [url]: The link to open when the suggestion is clicked.
  const SuggestedActionCustom({
    required this.name,
    required this.title,
    required this.description,
    required this.url,
  });

  /// Unique name of the suggestion
  final String name;

  /// Title of the suggestion
  final FormattedText title;

  /// Description of the suggestion
  final FormattedText description;

  /// The link to open when the suggestion is clicked
  final String url;

  /// Parse from a json
  factory SuggestedActionCustom.fromJson(Map<String, dynamic> json) =>
      SuggestedActionCustom(
        name: json['name'],
        title: FormattedText.fromJson(json['title']),
        description: FormattedText.fromJson(json['description']),
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "title": title.toJson(),
      "description": description.toJson(),
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Unique name of the suggestion
  /// * [title]: Title of the suggestion
  /// * [description]: Description of the suggestion
  /// * [url]: The link to open when the suggestion is clicked
  @override
  SuggestedActionCustom copyWith({
    String? name,
    FormattedText? title,
    FormattedText? description,
    String? url,
  }) =>
      SuggestedActionCustom(
        name: name ?? this.name,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionCustom';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionSetLoginEmailAddress** *(suggestedActionSetLoginEmailAddress)* - child of SuggestedAction
///
/// Suggests the user to add login email address. Call isLoginEmailAddressRequired, and then setLoginEmailAddress or checkLoginEmailAddressCode to change the login email address.
///
/// * [canBeHidden]: True, if the suggested action can be hidden using hideSuggestedAction. Otherwise, the user must not be able to use the application without setting up the email address.
final class SuggestedActionSetLoginEmailAddress extends SuggestedAction {
  /// **SuggestedActionSetLoginEmailAddress** *(suggestedActionSetLoginEmailAddress)* - child of SuggestedAction
  ///
  /// Suggests the user to add login email address. Call isLoginEmailAddressRequired, and then setLoginEmailAddress or checkLoginEmailAddressCode to change the login email address.
  ///
  /// * [canBeHidden]: True, if the suggested action can be hidden using hideSuggestedAction. Otherwise, the user must not be able to use the application without setting up the email address.
  const SuggestedActionSetLoginEmailAddress({
    required this.canBeHidden,
  });

  /// True, if the suggested action can be hidden using hideSuggestedAction. Otherwise, the user must not be able to use the application without setting up the email address
  final bool canBeHidden;

  /// Parse from a json
  factory SuggestedActionSetLoginEmailAddress.fromJson(
          Map<String, dynamic> json) =>
      SuggestedActionSetLoginEmailAddress(
        canBeHidden: json['can_be_hidden'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_be_hidden": canBeHidden,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_be_hidden]: True, if the suggested action can be hidden using hideSuggestedAction. Otherwise, the user must not be able to use the application without setting up the email address
  @override
  SuggestedActionSetLoginEmailAddress copyWith({
    bool? canBeHidden,
  }) =>
      SuggestedActionSetLoginEmailAddress(
        canBeHidden: canBeHidden ?? this.canBeHidden,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionSetLoginEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedActionAddLoginPasskey** *(suggestedActionAddLoginPasskey)* - child of SuggestedAction
///
/// Suggests the user to add a passkey for login using addLoginPasskey.
final class SuggestedActionAddLoginPasskey extends SuggestedAction {
  /// **SuggestedActionAddLoginPasskey** *(suggestedActionAddLoginPasskey)* - child of SuggestedAction
  ///
  /// Suggests the user to add a passkey for login using addLoginPasskey.
  const SuggestedActionAddLoginPasskey();

  /// Parse from a json
  factory SuggestedActionAddLoginPasskey.fromJson(Map<String, dynamic> json) =>
      const SuggestedActionAddLoginPasskey();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SuggestedActionAddLoginPasskey copyWith() =>
      const SuggestedActionAddLoginPasskey();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedActionAddLoginPasskey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
