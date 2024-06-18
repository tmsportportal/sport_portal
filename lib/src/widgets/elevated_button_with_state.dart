import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

class ElevatedButtonWithState extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final Widget child;
  final VoidCallback onPressed;

  const ElevatedButtonWithState(
      {Key? key,
      required this.isLoading,
      required this.isError,
      required this.child,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              isError ? Theme.of(context).colorScheme.error : null),
      child: _getState(context),
    );
  }

  Widget _getState(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
    if (isError) {
      return Text(context.loc.error);
    }
    return child;
  }
}
