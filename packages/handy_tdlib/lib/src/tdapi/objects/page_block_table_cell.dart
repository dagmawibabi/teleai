part of '../tdapi.dart';

/// **PageBlockTableCell** *(pageBlockTableCell)* - basic class
///
/// Represents a cell of a table.
///
/// * [text]: Cell text; may be null. If the text is null, then the cell must be invisible *(optional)*.
/// * [isHeader]: True, if it is a header cell.
/// * [colspan]: The number of columns the cell spans.
/// * [rowspan]: The number of rows the cell spans.
/// * [align]: Horizontal cell content alignment.
/// * [valign]: Vertical cell content alignment.
final class PageBlockTableCell extends TdObject {
  /// **PageBlockTableCell** *(pageBlockTableCell)* - basic class
  ///
  /// Represents a cell of a table.
  ///
  /// * [text]: Cell text; may be null. If the text is null, then the cell must be invisible *(optional)*.
  /// * [isHeader]: True, if it is a header cell.
  /// * [colspan]: The number of columns the cell spans.
  /// * [rowspan]: The number of rows the cell spans.
  /// * [align]: Horizontal cell content alignment.
  /// * [valign]: Vertical cell content alignment.
  const PageBlockTableCell({
    this.text,
    required this.isHeader,
    required this.colspan,
    required this.rowspan,
    required this.align,
    required this.valign,
  });

  /// Cell text; may be null. If the text is null, then the cell must be invisible
  final RichText? text;

  /// True, if it is a header cell
  final bool isHeader;

  /// The number of columns the cell spans
  final int colspan;

  /// The number of rows the cell spans
  final int rowspan;

  /// Horizontal cell content alignment
  final PageBlockHorizontalAlignment align;

  /// Vertical cell content alignment
  final PageBlockVerticalAlignment valign;

  /// Parse from a json
  factory PageBlockTableCell.fromJson(Map<String, dynamic> json) =>
      PageBlockTableCell(
        text: json['text'] == null ? null : RichText.fromJson(json['text']),
        isHeader: json['is_header'],
        colspan: json['colspan'],
        rowspan: json['rowspan'],
        align: PageBlockHorizontalAlignment.fromJson(json['align']),
        valign: PageBlockVerticalAlignment.fromJson(json['valign']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text?.toJson(),
      "is_header": isHeader,
      "colspan": colspan,
      "rowspan": rowspan,
      "align": align.toJson(),
      "valign": valign.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Cell text; may be null. If the text is null, then the cell must be invisible
  /// * [is_header]: True, if it is a header cell
  /// * [colspan]: The number of columns the cell spans
  /// * [rowspan]: The number of rows the cell spans
  /// * [align]: Horizontal cell content alignment
  /// * [valign]: Vertical cell content alignment
  PageBlockTableCell copyWith({
    RichText? text,
    bool? isHeader,
    int? colspan,
    int? rowspan,
    PageBlockHorizontalAlignment? align,
    PageBlockVerticalAlignment? valign,
  }) =>
      PageBlockTableCell(
        text: text ?? this.text,
        isHeader: isHeader ?? this.isHeader,
        colspan: colspan ?? this.colspan,
        rowspan: rowspan ?? this.rowspan,
        align: align ?? this.align,
        valign: valign ?? this.valign,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pageBlockTableCell';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
