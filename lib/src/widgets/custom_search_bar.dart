import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focus;
  final VoidCallback onSearchTapped;
  final VoidCallback onClearTapped;
  final String title;

  const CustomSearchBar(
      {super.key,
      required this.textEditingController,
      required this.focus,
      required this.onSearchTapped,
      required this.onClearTapped,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40.0,
            child: TextField(
              controller: textEditingController,
              focusNode: focus,
              onTapOutside: (_) {
                focus.unfocus();
              },
              decoration: InputDecoration(
                labelText: title,
                isDense: true,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    onClearTapped();
                  },
                  splashRadius: 2,
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  icon: const Icon(Icons.delete_forever_outlined),
                ),
                contentPadding: const EdgeInsets.all(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        SizedBox(
          height: 40.0,
          child: ElevatedButton.icon(
            onPressed: () {
              onSearchTapped();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12.0),
            ),
            icon: const Icon(Icons.search),
            label: Text(context.loc.search),
          ),
        ),
      ],
    );
  }
}
