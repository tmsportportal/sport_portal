import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String? text;
  final double? size;

  const CustomEmptyWidget({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/empty_data.svg',
              height: size,
              width: size,
            ),
            const SizedBox(height: 35.0),
            Text(
              text ?? context.loc.emptyData,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
