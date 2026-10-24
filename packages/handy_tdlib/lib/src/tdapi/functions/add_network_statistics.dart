part of '../tdapi.dart';

/// **AddNetworkStatistics** *(addNetworkStatistics)* - TDLib function
///
/// Adds the specified data to data usage statistics. Can be called before authorization.
///
/// * [entry]: The network statistics entry with the data to be added to statistics.
///
/// [Ok] is returned on completion.
final class AddNetworkStatistics extends TdFunction {
  /// **AddNetworkStatistics** *(addNetworkStatistics)* - TDLib function
  ///
  /// Adds the specified data to data usage statistics. Can be called before authorization.
  ///
  /// * [entry]: The network statistics entry with the data to be added to statistics.
  ///
  /// [Ok] is returned on completion.
  const AddNetworkStatistics({
    required this.entry,
  });

  /// The network statistics entry with the data to be added to statistics
  final NetworkStatisticsEntry entry;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "entry": entry.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [entry]: The network statistics entry with the data to be added to statistics
  AddNetworkStatistics copyWith({
    NetworkStatisticsEntry? entry,
  }) =>
      AddNetworkStatistics(
        entry: entry ?? this.entry,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addNetworkStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
