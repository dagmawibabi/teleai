part of '../tdapi.dart';

/// **CreateSupergroupChat** *(createSupergroupChat)* - TDLib function
///
/// Returns an existing chat corresponding to a known supergroup or channel.
///
/// * [supergroupId]: Supergroup or channel identifier.
/// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
///
/// [Chat] is returned on completion.
final class CreateSupergroupChat extends TdFunction {
  /// **CreateSupergroupChat** *(createSupergroupChat)* - TDLib function
  ///
  /// Returns an existing chat corresponding to a known supergroup or channel.
  ///
  /// * [supergroupId]: Supergroup or channel identifier.
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
  ///
  /// [Chat] is returned on completion.
  const CreateSupergroupChat({
    required this.supergroupId,
    required this.force,
  });

  /// Supergroup or channel identifier
  final int supergroupId;

  /// Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  final bool force;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "force": force,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Supergroup or channel identifier
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  CreateSupergroupChat copyWith({
    int? supergroupId,
    bool? force,
  }) =>
      CreateSupergroupChat(
        supergroupId: supergroupId ?? this.supergroupId,
        force: force ?? this.force,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createSupergroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
