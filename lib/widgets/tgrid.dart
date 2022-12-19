import 'package:flutter/cupertino.dart';

class TGrid extends StatelessWidget {
  final int itemCount;
  final int columnCount;
  final double spacing;
  final double runSpacing;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const TGrid(
      {Key? key,
      required this.itemCount,
      this.columnCount = 2,
      this.spacing = 0,
      this.runSpacing = 0,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rows = (itemCount / columnCount).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List<Widget>.generate((rows * 2) - 1, (colindex) {
        if (colindex.isOdd) {
          return SizedBox(
            height: runSpacing,
          );
        }
        return IntrinsicHeight(
            child: Row(
          children: List<Widget>.generate((columnCount * 2) - 1, (rowindex) {
            if (rowindex.isOdd) {
              return SizedBox(
                width: spacing,
              );
            }
            int index =
                ((colindex / 2).floor() * columnCount) + (rowindex / 2).floor();
            return Expanded(child: itemBuilder(context, index));
          }),
          mainAxisSize: MainAxisSize.min,
        ));
      }),
    );
  }
}
