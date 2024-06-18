import 'package:flutter/material.dart';

class CoachInfoWidget extends StatelessWidget {
  final String title;
  final String info;

  const CoachInfoWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 5.0),
        Text(
          info,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class CoachInfoExpansionTileModel {
  final String title;
  bool isExpanded = false;

  CoachInfoExpansionTileModel({required this.title, this.isExpanded = false});
}
