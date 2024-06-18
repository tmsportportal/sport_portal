import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/athletes/athletes/data/dto/federation_athletes_dto.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';

import '../../../../widgets/custom_expansion_list_tile.dart';
import '../../../../widgets/empty_widget.dart';
import '../../../../widgets/error_widget.dart';
import '../controller/athlete_controller.dart';
import 'local_widgets/athlete_list_tile.dart';

class AthletesScreen extends StatefulWidget {
  static const route = '/athletes';

  const AthletesScreen({super.key});

  @override
  State<AthletesScreen> createState() => _AthletesScreenState();
}

class _AthletesScreenState extends State<AthletesScreen> {
  final _controller = GetIt.instance<AthletesController>();

  @override
  void initState() {
    _controller.fetchAthletes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      title: context.loc.athletes,
      body: Observer(builder: (context) {
        if (_controller.athletesList == null) {
          return const SizedBox();
        }
        switch (_controller.athletesList!.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return CustomErrorWidget(onError: () {
              _controller.fetchAthletes();
            });
          case FutureStatus.fulfilled:
            if (_controller.athletesList!.value == null ||
                (_controller.athletesList!.value?.isEmpty ?? true)) {
              return const CustomEmptyWidget();
            }
            return ListView(
              children: [
                ..._controller.athletesList!.value?.map((sportCategory) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: CustomExpansionListTile(
                          title: sportCategory.name?.toUpperCase() ?? '',
                          // image: sportCategory.image,
                          netImage: sportCategory.imagePath,
                          children: [
                            if (sportCategory.fathlete == null ||
                                (sportCategory.fathlete?.isEmpty ?? true))
                              Text(context.loc.noAthletes)
                            else
                              for (var athlete
                                  in sportCategory.fathlete ?? <AthleteDto>[])
                                AthleteListTile(
                                  athlete: athlete,
                                ),
                            // if (sportCategory?.fathlete != null &&
                            //     (sportCategory?.fathlete?.isNotEmpty ?? false))
                            //   TextButton(
                            //     onPressed: () {
                            //       Navigator.pushNamed(context, AthletesListScreen.route,
                            //           arguments: {'category_id': sportCategory?.id});
                            //     },
                            //     child: Text(context.loc.seeAll),
                            //   ),
                          ],
                        ),
                      );
                    }).toList() ??
                    [],
                const SizedBox(height: 80.0),
              ],
            );
        }
      }),
    );
  }
}
