import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/results/models/club_result_model.dart';

import '../../../../globals/globals.dart';
import '../../../../widgets/custom_expansion_list_tile.dart';
import '../../widgets/league_results_table.dart';
import '../../widgets/table_information_widget.dart';

class WorldResultsScreen extends StatefulWidget {
  static const route = '/world_results';

  const WorldResultsScreen({super.key});

  @override
  State<WorldResultsScreen> createState() => _WorldResultsScreenState();
}

class _WorldResultsScreenState extends State<WorldResultsScreen> {
  @override
  void initState() {
    clubResults.sort((b, a) => a.points - b.points);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.results),
      ),
      body: ListView(
        children: [
          for (final element in leagues)
            CustomExpansionListTile(
              title: element.title,
              netImage: element.image,
              children: [
                LeagueResultsTable(
                    list: clubResults
                        .map((element) => _data(
                            clubResults.indexOf(element) + 1,
                            element,
                            clubResults.indexOf(element) >=
                                clubResults.length - 3,
                            theme))
                        .toList()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TableInformationWidget(
                    top: 'UEFA Champions League',
                    qualification: 'UEFA Europe League',
                    outsider: context.loc.relegationZone,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 80.0)
        ],
      ),
    );
  }

  TableRow _data(
      int i, ClubResultModel model, bool isOutsider, ThemeData theme) {
    Color color = theme.colorScheme.background;
    final isTop4 = i < 5;
    if (isTop4) {
      color = const Color(0xFF24722B);
    } else if (i == 5) {
      color = const Color(0xFF0088FF);
    } else if (isOutsider) {
      color = const Color(0xFFB3261E);
    }
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        color: theme.colorScheme.background,
      ),
      children: LeagueRowItem.getItems(i, color, model),
    );
  }
}
