import 'package:flutter/material.dart';

class AppTableView extends StatelessWidget {
  const AppTableView({
    super.key,
    required this.headers,
    required this.data,
    this.columnWidths,
    this.headerStyle,
    this.textStyle,
  });

  final List<String> headers;
  final List<List<String>> data;
  final Map<int, TableColumnWidth>? columnWidths;
  final TextStyle? headerStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextStyle = theme.textTheme.bodyMedium;
    final defaultHeaderStyle = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final effectiveHeaderStyle = headerStyle ?? defaultHeaderStyle;
    final effectiveTextStyle = textStyle ?? defaultTextStyle;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Table(
        columnWidths: columnWidths,
        border: TableBorder(
          horizontalInside: BorderSide(
            color: theme.dividerColor,
            width: 1.0,
          ),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          // ヘッダー行
          TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2.0,
                ),
              ),
            ),
            children: headers.map((header) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(header, style: effectiveHeaderStyle),
              );
            }).toList(),
          ),
          // データ行
          ...data.map(
            (row) => TableRow(
              children: row.map((cell) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(cell, style: effectiveTextStyle),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
