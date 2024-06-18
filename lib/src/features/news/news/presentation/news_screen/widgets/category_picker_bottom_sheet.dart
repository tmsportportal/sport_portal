import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../data/dto/news_filter_dto.dart';

class CategoryPickerBottomSheet extends StatefulWidget {
  final List<Filter> filters;
  final void Function(String) onConfirmTapped;
  final String? currentElement;
  final VoidCallback onClearTapped;

  const CategoryPickerBottomSheet(
      {super.key,
      required this.filters,
      required this.onConfirmTapped,
      required this.currentElement,
      required this.onClearTapped});

  @override
  State<CategoryPickerBottomSheet> createState() =>
      _CategoryPickerBottomSheetState();
}

class _CategoryPickerBottomSheetState extends State<CategoryPickerBottomSheet> {
  String currentElement = '';

  @override
  void initState() {
    currentElement = widget.currentElement ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.1),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  height: 5.0,
                  constraints: const BoxConstraints(maxWidth: 80.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              ...widget.filters
                  .map((element) => RadioListTile(
                        value: element.id,
                        groupValue: currentElement,
                        onChanged: (_) {
                          setState(() {
                            currentElement = element.id ?? '';
                          });
                        },
                        title: Text(
                          element.name ?? '',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                  .toList(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onConfirmTapped(currentElement);
                },
                label: Text(
                  context.loc.confirm,
                  style: const TextStyle(fontSize: 18.0),
                ),
                icon: const Icon(Icons.check),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onClearTapped();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  side: const BorderSide(color: Colors.redAccent),
                ),
                label: Text(
                  context.loc.clear,
                  style: const TextStyle(fontSize: 18.0),
                ),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
