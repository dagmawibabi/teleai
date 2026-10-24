part of '../tdapi.dart';

/// **OnRampPaymentMethod** *(onRampPaymentMethod)* - basic class
///
/// Describes a payment method of an on-ramp provider.
///
/// * [name]: Name of the method.
/// * [isAvailable]: True, if the method is available to the user.
final class OnRampPaymentMethod extends TdObject {
  /// **OnRampPaymentMethod** *(onRampPaymentMethod)* - basic class
  ///
  /// Describes a payment method of an on-ramp provider.
  ///
  /// * [name]: Name of the method.
  /// * [isAvailable]: True, if the method is available to the user.
  const OnRampPaymentMethod({
    required this.name,
    required this.isAvailable,
  });

  /// Name of the method
  final String name;

  /// True, if the method is available to the user
  final bool isAvailable;

  /// Parse from a json
  factory OnRampPaymentMethod.fromJson(Map<String, dynamic> json) =>
      OnRampPaymentMethod(
        name: json['name'],
        isAvailable: json['is_available'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "is_available": isAvailable,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the method
  /// * [is_available]: True, if the method is available to the user
  OnRampPaymentMethod copyWith({
    String? name,
    bool? isAvailable,
  }) =>
      OnRampPaymentMethod(
        name: name ?? this.name,
        isAvailable: isAvailable ?? this.isAvailable,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampPaymentMethod';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
