part of '../tdapi.dart';

/// **CreateCall** *(createCall)* - TDLib function
///
/// Creates a new call.
///
/// * [userId]: Identifier of the user to be called.
/// * [protocol]: The call protocols supported by the application.
/// * [isVideo]: Pass true to create a video call.
///
/// [CallId] is returned on completion.
final class CreateCall extends TdFunction {
  /// **CreateCall** *(createCall)* - TDLib function
  ///
  /// Creates a new call.
  ///
  /// * [userId]: Identifier of the user to be called.
  /// * [protocol]: The call protocols supported by the application.
  /// * [isVideo]: Pass true to create a video call.
  ///
  /// [CallId] is returned on completion.
  const CreateCall({
    required this.userId,
    required this.protocol,
    required this.isVideo,
  });

  /// Identifier of the user to be called
  final int userId;

  /// The call protocols supported by the application
  final CallProtocol protocol;

  /// Pass true to create a video call
  final bool isVideo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "protocol": protocol.toJson(),
      "is_video": isVideo,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user to be called
  /// * [protocol]: The call protocols supported by the application
  /// * [is_video]: Pass true to create a video call
  CreateCall copyWith({
    int? userId,
    CallProtocol? protocol,
    bool? isVideo,
  }) =>
      CreateCall(
        userId: userId ?? this.userId,
        protocol: protocol ?? this.protocol,
        isVideo: isVideo ?? this.isVideo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
