import 'package:flutter/material.dart';

class HeaderCellItem extends StatelessWidget {
  final String data;

  const HeaderCellItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: Center(
          child: Text(
        data,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      )),
    );
  }
}
