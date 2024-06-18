import 'package:flutter/material.dart';

import 'caching_image.dart';

class ClubLogoWidget extends StatelessWidget {
  final String? logo;
  final String club;

  const ClubLogoWidget({super.key, this.logo, required this.club});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (logo != null) ...[
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CachingImage(
                logo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
          ],
          Flexible(
            child: Text(
              club.toUpperCase(),
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
