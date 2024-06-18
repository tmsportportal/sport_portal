import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback? onError;

  const CustomErrorWidget({super.key, required this.onError});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/error.svg'),
            const SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                context.loc.error,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onError,
              child: Text(context.loc.retry),
            )
          ],
        ),
      ),
    );
  }
}
