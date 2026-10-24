part of '../tdapi.dart';

/// **SetDefaultChannelAdministratorRights** *(setDefaultChannelAdministratorRights)* - TDLib function
///
/// Sets default administrator rights for adding the bot to channel chats; for bots only.
///
/// * [defaultChannelAdministratorRights]: Default administrator rights for adding the bot to channels; pass null to remove default rights *(optional)*.
///
/// [Ok] is returned on completion.
final class SetDefaultChannelAdministratorRights extends TdFunction {
  /// **SetDefaultChannelAdministratorRights** *(setDefaultChannelAdministratorRights)* - TDLib function
  ///
  /// Sets default administrator rights for adding the bot to channel chats; for bots only.
  ///
  /// * [defaultChannelAdministratorRights]: Default administrator rights for adding the bot to channels; pass null to remove default rights *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetDefaultChannelAdministratorRights({
    this.defaultChannelAdministratorRights,
  });

  /// Default administrator rights for adding the bot to channels; pass null to remove default rights
  final ChatAdministratorRights? defaultChannelAdministratorRights;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "default_channel_administrator_rights":
          defaultChannelAdministratorRights?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [default_channel_administrator_rights]: Default administrator rights for adding the bot to channels; pass null to remove default rights
  SetDefaultChannelAdministratorRights copyWith({
    ChatAdministratorRights? defaultChannelAdministratorRights,
  }) =>
      SetDefaultChannelAdministratorRights(
        defaultChannelAdministratorRights: defaultChannelAdministratorRights ??
            this.defaultChannelAdministratorRights,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDefaultChannelAdministratorRights';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
