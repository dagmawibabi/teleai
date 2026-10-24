part of '../tdapi.dart';

/// **CreateInvoiceLink** *(createInvoiceLink)* - TDLib function
///
/// Creates a link for the given invoice; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request.
/// * [invoice]: Information about the invoice of the type inputMessageInvoice.
///
/// [HttpUrl] is returned on completion.
final class CreateInvoiceLink extends TdFunction {
  /// **CreateInvoiceLink** *(createInvoiceLink)* - TDLib function
  ///
  /// Creates a link for the given invoice; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request.
  /// * [invoice]: Information about the invoice of the type inputMessageInvoice.
  ///
  /// [HttpUrl] is returned on completion.
  const CreateInvoiceLink({
    required this.businessConnectionId,
    required this.invoice,
  });

  /// Unique identifier of business connection on behalf of which to send the request
  final String businessConnectionId;

  /// Information about the invoice of the type inputMessageInvoice
  final InputMessageContent invoice;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "invoice": invoice.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request
  /// * [invoice]: Information about the invoice of the type inputMessageInvoice
  CreateInvoiceLink copyWith({
    String? businessConnectionId,
    InputMessageContent? invoice,
  }) =>
      CreateInvoiceLink(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        invoice: invoice ?? this.invoice,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createInvoiceLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
