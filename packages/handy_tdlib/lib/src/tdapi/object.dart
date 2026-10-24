part of 'tdapi.dart';

/// Base object in this plugin. Use convertMapToObject() or
/// convertJsonToObject() to get an object from TDLib JSON.
sealed class TdObject {
  /// A sign from TDLib update
  dynamic get extra => null;

  /// Client ID, from which this object was received
  int? get clientId => null;

  /// TDLib object type for current class instance
  String get currentObjectId => "object";

  /// Unused constructor
  const TdObject();

  /// Construct model from TDLib JSON
  TdObject.fromJson(Map<String, dynamic> json);

  /// Convert model to TDLib JSON format
  Map<String, dynamic> toJson();
}
