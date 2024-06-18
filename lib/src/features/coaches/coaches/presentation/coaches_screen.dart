import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/coaches/coaches/controller/coaches_controller.dart';
import 'package:sport_portal/src/features/coaches/coaches/data/dto/federation_coaches.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/empty_widget.dart';
import 'package:sport_portal/src/widgets/error_widget.dart';

import '../../../../widgets/custom_expansion_list_tile.dart';
import 'local_widgets/coach_list_tile.dart';

class CoachesScreen extends StatefulWidget {
  static const route = r'/coaches';

  const CoachesScreen({super.key});

  @override
  State<CoachesScreen> createState() => _CoachesScreenState();
}

class _CoachesScreenState extends State<CoachesScreen> {
  final _controller = GetIt.instance<CoachesController>();

  @override
  void initState() {
    _controller.fetchCoaches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      title: context.loc.coaches,
      body: Observer(builder: (context) {
        if (_controller.coachesList == null) {
          return const SizedBox();
        }
        switch (_controller.coachesList!.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return CustomErrorWidget(onError: () {
              _controller.fetchCoaches();
            });
          case FutureStatus.fulfilled:
            if (_controller.coachesList!.value == null ||
                (_controller.coachesList!.value?.isEmpty ?? true)) {
              return const CustomEmptyWidget();
            }
            return ListView(
              children: [
                ..._controller.coachesList!.value?.map((sportCategory) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: CustomExpansionListTile(
                          // sportCategory: sportCategory,
                          title: sportCategory.name ?? '',
                          image: sportCategory.imagePath,
                          netImage: sportCategory.imagePath,
                          children: [
                            if (sportCategory.ftrainers?.isEmpty ?? true)
                              Center(
                                child: Text(context.loc.noTrainers),
                              )
                            else
                              for (var coach
                                  in sportCategory.ftrainers ?? <CoachDto>[])
                                CoachListTile(
                                  coach: coach,
                                ),
                            // if (sportCategory?.ftrainers?.isNotEmpty ?? false)
                            //   TextButton(
                            //     onPressed: () {
                            //       Navigator.pushNamed(context, CoachesListScreen.route,
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
