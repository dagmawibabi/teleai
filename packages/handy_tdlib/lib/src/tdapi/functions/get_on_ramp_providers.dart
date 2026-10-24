part of '../tdapi.dart';

/// **GetOnRampProviders** *(getOnRampProviders)* - TDLib function
///
/// Returns available on-ramp providers.
///
/// * [cryptocurrency]: Pass a cryptocurrency to receive only providers that support it; pass an empty string to receive all providers.
///
/// [OnRampProviders] is returned on completion.
final class GetOnRampProviders extends TdFunction {
  /// **GetOnRampProviders** *(getOnRampProviders)* - TDLib function
  ///
  /// Returns available on-ramp providers.
  ///
  /// * [cryptocurrency]: Pass a cryptocurrency to receive only providers that support it; pass an empty string to receive all providers.
  ///
  /// [OnRampProviders] is returned on completion.
  const GetOnRampProviders({
    required this.cryptocurrency,
  });

  /// Pass a cryptocurrency to receive only providers that support it; pass an empty string to receive all providers
  final String cryptocurrency;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "cryptocurrency": cryptocurrency,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [cryptocurrency]: Pass a cryptocurrency to receive only providers that support it; pass an empty string to receive all providers
  GetOnRampProviders copyWith({
    String? cryptocurrency,
  }) =>
      GetOnRampProviders(
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOnRampProviders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
