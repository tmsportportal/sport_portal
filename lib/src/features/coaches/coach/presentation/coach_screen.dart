import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/globals/globals.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';

import '../../../../widgets/caching_image.dart';
import '../../../../widgets/club_logo_widget.dart';
import '../../../../widgets/comment_widget.dart';
import '../../../../widgets/rating_bar.dart';
import '../../../../widgets/styled_expansion_list.dart';
import '../../../../widgets/view_count_widget.dart';
import '../../coaches/data/dto/federation_coaches.dart';
import 'widgets/coach_info_widget.dart';

class CoachScreen extends StatefulWidget {
  static const route = '/coach';
  final CoachDto coach;

  const CoachScreen({super.key, required this.coach});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final expandInfo = <CoachInfoExpansionTileModel>[
    CoachInfoExpansionTileModel(title: 'workHistory'),
    CoachInfoExpansionTileModel(title: 'awards'),
  ];

  late final CoachDto coach;

  @override
  void initState() {
    coach = widget.coach;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      title: context.loc.coach,
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: CachingImage(
                    coach.imagePath ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coach.name?.toUpperCase() ?? '',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    if (coach.job != null)
                      ClubLogoWidget(club: coach.job ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RatingBar(
                              rating: coach.rating ?? 0.0,
                              size: 20.0,
                            ),
                          ),
                          const ViewCountWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.primary),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    // direction: Axis.horizontal,
                    // spacing: 15.0,
                    // runSpacing: 15.0,
                    // alignment: WrapAlignment.spaceEvenly,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CoachInfoWidget(
                          title: context.loc.age,
                          info: coach.age.toString(),
                        ),
                      ),
                      Expanded(
                        child: CoachInfoWidget(
                          title: context.loc.birthPlace,
                          info: coach.birthPlace ?? '',
                        ),
                      ),
                      Expanded(
                        child: CoachInfoWidget(
                          title: context.loc.workingExperience,
                          info: coach.experience.toString(),
                        ),
                      ),
                    ],
                  ),
                  if (coach.sportLevel != null) ...[
                    Divider(
                      color: theme.colorScheme.primary,
                    ),
                    CoachInfoWidget(
                      title: context.loc.sportLevel,
                      info: coach.sportLevel ?? '',
                    ),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StyledExpansionTile(
              borderRadius: 0.0,
              itemColor: theme.scaffoldBackgroundColor,
              itemPadding: 5.0,
              borderColor: theme.colorScheme.primary,
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  expandInfo[panelIndex].isExpanded =
                      !expandInfo[panelIndex].isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expandInfo[0].isExpanded,
                  headerBuilder: (context, isExpanded) {
                    return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            context.loc
                                .informationTiles(expandInfo[0].title)
                                .toUpperCase(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ));
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        if (coach.workedAt != null ||
                            (coach.workedAt?.isNotEmpty ?? false))
                          for (final place in coach.workedAt ?? <String>[]) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              child: Text(place),
                            ),
                            if (place != coach.workedAt?.last)
                              Divider(
                                color: theme.colorScheme.primary,
                                thickness: 0.5,
                              ),
                          ],
                      ],
                    ),
                  ),
                ),
                if (coach.badges != null && (coach.badges?.isNotEmpty ?? false))
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: expandInfo[1].isExpanded,
                    headerBuilder: (context, isExpanded) {
                      return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              context.loc
                                  .informationTiles(expandInfo[1].title)
                                  .toUpperCase(),
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          if (coach.badges != null &&
                              (coach.badges?.isNotEmpty ?? false))
                            for (final award in coach.badges!) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 5.0,
                                ),
                                child: Text(award),
                              ),
                              if (award != coach.badges?.last)
                                Divider(color: theme.colorScheme.primary),
                            ],
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              context.loc.comments,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          for (final comment in comments) CommentWidget(comment: comment),
          const SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
