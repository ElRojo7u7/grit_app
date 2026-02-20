import 'package:flutter/material.dart';

class CenteredGrid extends StatelessWidget {
  final List<Widget> children;
  final double itemWidth;
  final double spacing;
  final double runSpacing;
  final int maxItemsPerRow;

  const CenteredGrid({
    super.key,
    required this.children,
    this.itemWidth = 160,
    this.spacing = 16,
    this.runSpacing = 16,
    this.maxItemsPerRow = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;

      int itemsPerRow =
          (maxWidth / (itemWidth + spacing)).floor().clamp(1, maxItemsPerRow);

      final rows = <Widget>[];
      for (int i = 0; i < children.length; i += itemsPerRow) {
        final rowChildren = children.skip(i).take(itemsPerRow).toList();

        rows.add(
          Padding(
            padding: EdgeInsets.only(bottom: runSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _withSpacing(rowChildren),
            ),
          ),
        );
      }

      return Column(children: rows);
    });
  }

  List<Widget> _withSpacing(List<Widget> items) {
    final result = <Widget>[];

    for (int i = 0; i < items.length; i++) {
      result.add(SizedBox(width: itemWidth, child: items[i]));
      if (i != items.length - 1) {
        result.add(SizedBox(width: spacing));
      }
    }

    return result;
  }
}
