import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewCountWidget extends StatelessWidget {
  final int count;

  const ViewCountWidget({super.key, this.count = 1481});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          CupertinoIcons.eye,
          color: theme.colorScheme.primary,
          size: 18.0,
        ),
        const SizedBox(width: 5.0),
        Text(
          '$count',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        )
      ],
    );
  }
}
