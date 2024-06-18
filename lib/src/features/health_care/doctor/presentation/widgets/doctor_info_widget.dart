import 'package:flutter/material.dart';

class DoctorInfoWidget extends StatelessWidget {
  final String title;
  final String info;

  const DoctorInfoWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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

class DoctorInfoExpansionTileModel {
  final String title;
  bool isExpanded = false;

  DoctorInfoExpansionTileModel({required this.title, this.isExpanded = false});
}
