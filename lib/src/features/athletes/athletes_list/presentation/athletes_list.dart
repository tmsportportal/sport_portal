import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../../widgets/custom_scaffold_with_button.dart';
import '../../../../widgets/state_control_widget.dart';
import '../../../kinds_of_sport/models/kinds_of_sport_list_model.dart';

class AthletesListScreen extends StatefulWidget {
  final int id;
  static const route = '/athletes_list';

  const AthletesListScreen({super.key, required this.id});

  @override
  State<AthletesListScreen> createState() => _AthletesListScreenState();
}

class _AthletesListScreenState extends State<AthletesListScreen> {
  late KindsOfSportListModel sportListModel;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      body: StateControlWidget(
        isLoading: false,
        isError: false,
        title: context.loc.athletes,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset(
                          "assets/images/sport_category/${sportListModel.image}",
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          context.loc
                              .sportCategory(sportListModel.title)
                              .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Theme.of(context).dividerColor),
                // for (var athlete in athletesList)
                //   AthleteListTile(athlete: athlete),
              ],
            ),
          )
        ],
      ),
    );
  }
}
