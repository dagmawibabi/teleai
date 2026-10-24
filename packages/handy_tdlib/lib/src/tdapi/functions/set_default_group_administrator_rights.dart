part of '../tdapi.dart';

/// **SetDefaultGroupAdministratorRights** *(setDefaultGroupAdministratorRights)* - TDLib function
///
/// Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only.
///
/// * [defaultGroupAdministratorRights]: Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights *(optional)*.
///
/// [Ok] is returned on completion.
final class SetDefaultGroupAdministratorRights extends TdFunction {
  /// **SetDefaultGroupAdministratorRights** *(setDefaultGroupAdministratorRights)* - TDLib function
  ///
  /// Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only.
  ///
  /// * [defaultGroupAdministratorRights]: Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetDefaultGroupAdministratorRights({
    this.defaultGroupAdministratorRights,
  });

  /// Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights
  final ChatAdministratorRights? defaultGroupAdministratorRights;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "default_group_administrator_rights":
          defaultGroupAdministratorRights?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [default_group_administrator_rights]: Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights
  SetDefaultGroupAdministratorRights copyWith({
    ChatAdministratorRights? defaultGroupAdministratorRights,
  }) =>
      SetDefaultGroupAdministratorRights(
        defaultGroupAdministratorRights: defaultGroupAdministratorRights ??
            this.defaultGroupAdministratorRights,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDefaultGroupAdministratorRights';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
