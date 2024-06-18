import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/results/models/club_result_model.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';

import '../../../../globals/globals.dart';
import '../../widgets/league_results_table.dart';
import '../../widgets/table_information_widget.dart';

class NationalResultsScreen extends StatefulWidget {
  static const route = '/national_results';

  const NationalResultsScreen({super.key});

  @override
  State<NationalResultsScreen> createState() => _NationalResultsScreenState();
}

class _NationalResultsScreenState extends State<NationalResultsScreen> {
  @override
  void initState() {
    tkLeagueResults.sort((b, a) => a.points - b.points);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      appBar: AppBar(
        title: Text(context.loc.results),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const SizedBox(
                height: 80.0,
                width: 60.0,
                child: CachingImage(
                    'https://upload.wikimedia.org/wikipedia/ru/8/8e/%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D1%8F_%D0%A4%D1%83%D1%82%D0%B1%D0%BE%D0%BB%D0%B0_%D0%A2%D1%83%D1%80%D0%BA%D0%BC%D0%B5%D0%BD%D0%B8%D1%81%D1%82%D0%B0%D0%BD%D0%B0.jpg'),
              ),
              title: Text(
                'Türkmenistanyň Futbol Federasiýasy',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
          LeagueResultsTable(
              list: tkLeagueResults
                  .map((element) => _data(
                      tkLeagueResults.indexOf(element) + 1,
                      element,
                      tkLeagueResults.indexOf(element) >=
                          tkLeagueResults.length - 2,
                      theme))
                  .toList()),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TableInformationWidget(
              top: 'AFC Cup',
              qualification: 'AFC Cup qualification',
            ),
          ),
          const SizedBox(height: 80.0)
        ],
      ),
    );
  }

  TableRow _data(
      int i, ClubResultModel model, bool isOutsider, ThemeData theme) {
    Color color = theme.colorScheme.background;
    if (i == 1) {
      color = const Color(0xFF24722B);
    } else if (i == 2) {
      color = const Color(0xFF0088FF);
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
