
import 'package:flutter/material.dart';

import '../../data/dto/gyms_dto.dart';

class GymMarkerInfoDialog extends StatelessWidget {
  final GymDto marker;

  const GymMarkerInfoDialog({super.key, required this.marker});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(marker.name ?? ''),
      titleTextStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        )
      ],
      actionsPadding: const EdgeInsets.all(5.0),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.location_on_outlined),
                ),
                Expanded(child: Text(marker.location ?? '')),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.phone_outlined),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final phone in marker.tel ?? []) Text(phone)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
