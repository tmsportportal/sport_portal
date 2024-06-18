import 'package:flutter/material.dart';

class StyledDropdownMenu<T> extends StatelessWidget {
  final void Function(T?) onChanged;
  final String labelText;
  final List<DropdownMenuItem<T>> entries;
  final T? value;

  const StyledDropdownMenu(
      {super.key,
      required this.onChanged,
      required this.labelText,
      required this.entries,
      this.value});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: DropdownButton<T>(
          isExpanded: true,
          value: value,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          hint: Text(labelText),
          underline: const SizedBox(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 12.0,
              ),
          items: entries,
          onChanged: (value) {
            onChanged(value);
          }),
    );
  }
}
