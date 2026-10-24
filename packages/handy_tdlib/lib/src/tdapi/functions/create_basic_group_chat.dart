part of '../tdapi.dart';

/// **CreateBasicGroupChat** *(createBasicGroupChat)* - TDLib function
///
/// Returns an existing chat corresponding to a known basic group.
///
/// * [basicGroupId]: Basic group identifier.
/// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
///
/// [Chat] is returned on completion.
final class CreateBasicGroupChat extends TdFunction {
  /// **CreateBasicGroupChat** *(createBasicGroupChat)* - TDLib function
  ///
  /// Returns an existing chat corresponding to a known basic group.
  ///
  /// * [basicGroupId]: Basic group identifier.
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
  ///
  /// [Chat] is returned on completion.
  const CreateBasicGroupChat({
    required this.basicGroupId,
    required this.force,
  });

  /// Basic group identifier
  final int basicGroupId;

  /// Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  final bool force;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "basic_group_id": basicGroupId,
      "force": force,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [basic_group_id]: Basic group identifier
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  CreateBasicGroupChat copyWith({
    int? basicGroupId,
    bool? force,
  }) =>
      CreateBasicGroupChat(
        basicGroupId: basicGroupId ?? this.basicGroupId,
        force: force ?? this.force,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createBasicGroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
