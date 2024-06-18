import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/athletes/athletes/data/dto/federation_athletes_dto.dart';

import '../../../../globals/globals.dart';
import '../../../../widgets/caching_image.dart';
import '../../../../widgets/club_logo_widget.dart';
import '../../../../widgets/comment_widget.dart';
import '../../../../widgets/custom_scaffold_with_button.dart';
import '../../../../widgets/rating_bar.dart';
import '../../../../widgets/styled_expansion_list.dart';
import '../../../../widgets/view_count_widget.dart';
import 'widgets/athlete_info_widget.dart';

class AthleteScreen extends StatefulWidget {
  static const route = '/athlete';
  final AthleteDto athlete;

  const AthleteScreen({super.key, required this.athlete});

  @override
  State<AthleteScreen> createState() => _AthleteScreenState();
}

class _AthleteScreenState extends State<AthleteScreen> {
  final expandInfo = <AthleteInfoExpansionTileModel>[
    AthleteInfoExpansionTileModel(title: 'workHistory'),
    AthleteInfoExpansionTileModel(title: 'awards'),
  ];

  late final AthleteDto athlete;

  @override
  void initState() {
    athlete = widget.athlete;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      title: context.loc.athlete,
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
                    athlete.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      athlete.name?.toUpperCase() ?? '',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    if (athlete.club != null)
                      ClubLogoWidget(
                        // logo: athlete.clubLogo,
                        club: athlete.club ?? '',
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RatingBar(
                              rating: athlete.rating ?? 0.0,
                              size: 20.0,
                            ),
                          ),
                          ViewCountWidget(
                            count: athlete.views ?? 0,
                          ),
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
                        child: AthleteInfoWidget(
                          title: context.loc.age,
                          info: athlete.age.toString(),
                        ),
                      ),
                      Expanded(
                        child: AthleteInfoWidget(
                          title: context.loc.birthPlace,
                          info: athlete.birthPlace ?? '',
                        ),
                      ),
                      Expanded(
                        child: AthleteInfoWidget(
                          title: context.loc.workingExperience,
                          info: athlete.experience.toString(),
                        ),
                      ),
                    ],
                  ),
                  if (athlete.sportLevel != null) ...[
                    Divider(
                      color: theme.colorScheme.primary,
                    ),
                    AthleteInfoWidget(
                      title: context.loc.sportLevel,
                      info: athlete.sportLevel ?? '',
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
                        if (athlete.workedAt != null &&
                            (athlete.workedAt?.isNotEmpty ?? false))
                          for (final place in athlete.workedAt!) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              child: Text(place),
                            ),
                            if (place != athlete.workedAt!.last)
                              Divider(
                                color: theme.colorScheme.primary,
                                thickness: 0.5,
                              ),
                          ],
                      ],
                    ),
                  ),
                ),
                if (athlete.badges != null &&
                    (athlete.badges?.isNotEmpty ?? false))
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
                          if (athlete.badges != null &&
                              (athlete.badges?.isNotEmpty ?? false))
                            for (final award in athlete.badges!) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 5.0,
                                ),
                                child: Text(award),
                              ),
                              if (award != athlete.badges?.last)
                                Divider(
                                  color: theme.colorScheme.primary,
                                  thickness: 0.5,
                                ),
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
