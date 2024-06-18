import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../../gyms/gyms/data/dto/filter_dto.dart';
import '../../../../gyms/gyms/presentation/widgets/styled_dropdown_menu.dart';
import '../../controller/competitions_controller.dart';

class CompetitionsSearchDrawer extends StatefulWidget {
  final CompetitionsController controller;

  const CompetitionsSearchDrawer({super.key, required this.controller});

  @override
  State<CompetitionsSearchDrawer> createState() =>
      _CompetitionsSearchDrawerState();
}

class _CompetitionsSearchDrawerState extends State<CompetitionsSearchDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                context.loc.filterTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            if (widget.controller.filters != null)
              for (final filter
                  in widget.controller.filters?.value ?? <FilterDto>[])
                Observer(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: StyledDropdownMenu<String>(
                      onChanged: (String? value) {
                        widget.controller.addFilter(
                          filter.name ?? '',
                          value ?? '',
                        );
                      },
                      labelText: context.loc.filterName(filter.name ?? ''),
                      value: widget.controller.filtersMap[filter.name ?? ''],
                      entries: filter.filters
                              ?.map(
                                (element) => DropdownMenuItem<String>(
                                  value: element,
                                  child: Text(element),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  );
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.controller.fetchFilteredData();
              },
              child: Text(context.loc.search),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.controller.clearFilters();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                side: const BorderSide(
                  color: Colors.redAccent,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text(context.loc.clear),
            ),
          ],
        ),
      ),
    );
  }
}
