import 'package:flutter/material.dart';

class AthleteInfoWidget extends StatelessWidget {
  final String title;
  final String info;
  const AthleteInfoWidget({super.key, required this.title, required this.info});

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

class AthleteInfoExpansionTileModel {
  final String title;
  bool isExpanded = true;

  AthleteInfoExpansionTileModel({required this.title, this.isExpanded = true});
}
