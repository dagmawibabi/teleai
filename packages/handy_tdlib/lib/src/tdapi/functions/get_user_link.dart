part of '../tdapi.dart';

/// **GetUserLink** *(getUserLink)* - TDLib function
///
/// Returns an HTTPS link, which can be used to get information about the current user.
///
/// * [removeMessagesFee]: Pass true to get a link, which allows other users to send unpaid messages to the current user. By default, a temporary link is returned in this case.
/// * [returnPermanentLink]: Pass true to get a permanent link; ignored if remove_messages_fee is false. Can be used only if can_get_permanent_link is true in a previously received userLink.
/// * [revokePreviousLinks]: Pass true to revoke previously created links, which allow other users to send unpaid messages to the current user;. ignored if remove_messages_fee is false. If return_permanent_link is true, then the permanent link is revoked too; otherwise, only temporary links are revoked.
///
/// [UserLink] is returned on completion.
final class GetUserLink extends TdFunction {
  /// **GetUserLink** *(getUserLink)* - TDLib function
  ///
  /// Returns an HTTPS link, which can be used to get information about the current user.
  ///
  /// * [removeMessagesFee]: Pass true to get a link, which allows other users to send unpaid messages to the current user. By default, a temporary link is returned in this case.
  /// * [returnPermanentLink]: Pass true to get a permanent link; ignored if remove_messages_fee is false. Can be used only if can_get_permanent_link is true in a previously received userLink.
  /// * [revokePreviousLinks]: Pass true to revoke previously created links, which allow other users to send unpaid messages to the current user;. ignored if remove_messages_fee is false. If return_permanent_link is true, then the permanent link is revoked too; otherwise, only temporary links are revoked.
  ///
  /// [UserLink] is returned on completion.
  const GetUserLink({
    required this.removeMessagesFee,
    required this.returnPermanentLink,
    required this.revokePreviousLinks,
  });

  /// Pass true to get a link, which allows other users to send unpaid messages to the current user. By default, a temporary link is returned in this case
  final bool removeMessagesFee;

  /// Pass true to get a permanent link; ignored if remove_messages_fee is false. Can be used only if can_get_permanent_link is true in a previously received userLink
  final bool returnPermanentLink;

  /// Pass true to revoke previously created links, which allow other users to send unpaid messages to the current user;. ignored if remove_messages_fee is false. If return_permanent_link is true, then the permanent link is revoked too; otherwise, only temporary links are revoked
  final bool revokePreviousLinks;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "remove_messages_fee": removeMessagesFee,
      "return_permanent_link": returnPermanentLink,
      "revoke_previous_links": revokePreviousLinks,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [remove_messages_fee]: Pass true to get a link, which allows other users to send unpaid messages to the current user. By default, a temporary link is returned in this case
  /// * [return_permanent_link]: Pass true to get a permanent link; ignored if remove_messages_fee is false. Can be used only if can_get_permanent_link is true in a previously received userLink
  /// * [revoke_previous_links]: Pass true to revoke previously created links, which allow other users to send unpaid messages to the current user;. ignored if remove_messages_fee is false. If return_permanent_link is true, then the permanent link is revoked too; otherwise, only temporary links are revoked
  GetUserLink copyWith({
    bool? removeMessagesFee,
    bool? returnPermanentLink,
    bool? revokePreviousLinks,
  }) =>
      GetUserLink(
        removeMessagesFee: removeMessagesFee ?? this.removeMessagesFee,
        returnPermanentLink: returnPermanentLink ?? this.returnPermanentLink,
        revokePreviousLinks: revokePreviousLinks ?? this.revokePreviousLinks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
