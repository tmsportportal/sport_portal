import 'package:flutter/material.dart';

class CellItem extends StatelessWidget {
  final String data;
  final TextAlign textAlign;
  final TextStyle? style;

  const CellItem(this.data,
      {super.key, this.textAlign = TextAlign.center, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: Text(
        data,
        maxLines: 1,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
