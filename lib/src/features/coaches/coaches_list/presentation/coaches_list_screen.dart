import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/kinds_of_sport/models/kinds_of_sport_list_model.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

class CoachesListScreen extends StatefulWidget {
  final int id;
  static const route = '/coaches_list';

  const CoachesListScreen({super.key, required this.id});

  @override
  State<CoachesListScreen> createState() => _CoachesListScreenState();
}

class _CoachesListScreenState extends State<CoachesListScreen> {
  late KindsOfSportListModel sportListModel;

  @override
  void initState() {
    // sportListModel =
    //     sportCategoryList.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      body: StateControlWidget(
        isLoading: false,
        isError: false,
        title: context.loc.coaches,
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
                // for (var coach in coachesList) CoachListTile(coach: coach),
              ],
            ),
          )
        ],
      ),
    );
  }
}
