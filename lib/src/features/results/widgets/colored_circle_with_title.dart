import 'package:flutter/material.dart';

class ColoredCircleWithTitle extends StatelessWidget {
  final Color color;
  final String title;

  const ColoredCircleWithTitle(
      {super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 8.0,
          width: 8.0,
          child: ClipOval(
            child: ColoredBox(
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          title,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
