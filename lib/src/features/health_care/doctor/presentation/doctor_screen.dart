import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/health_care/doctors/data/dto/health_care_dto.dart';
import 'package:sport_portal/src/globals/globals.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';

import '../../../../widgets/caching_image.dart';
import '../../../../widgets/comment_widget.dart';
import '../../../../widgets/rating_bar.dart';
import '../../../../widgets/view_count_widget.dart';
import '../../../kinds_of_sport/presentation/kinds_of_sport.dart';
import 'widgets/doctor_info_widget.dart';

class DoctorScreen extends StatefulWidget {
  static const route = '/doctor';
  final Employee doctor;

  const DoctorScreen({super.key, required this.doctor});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final expandInfo = <DoctorInfoExpansionTileModel>[
    DoctorInfoExpansionTileModel(title: 'workHistory'),
    DoctorInfoExpansionTileModel(title: 'awards'),
  ];

  late Employee doctor;

  @override
  void initState() {
    doctor = widget.doctor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      title: context.loc.doctor,
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
                    doctor.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name?.toUpperCase() ?? "",
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RatingBar(
                              rating: doctor.rating ?? 0.0,
                              size: 20.0,
                            ),
                          ),
                          ViewCountWidget(
                            count: doctor.views ?? 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ..._getTitleAndInfoWithDivider(
              title: context.loc.age, info: doctor.age.toString()),
          ..._getTitleAndInfoWithDivider(
              title: context.loc.department, info: doctor.workAt.toString()),
          ..._getTitleAndInfoWithDivider(
              title: context.loc.workingExperience,
              info: doctor.experience.toString()),
          if (doctor.job != null)
            ..._getTitleAndInfoWithDivider(
                title: context.loc.position, info: doctor.job.toString()),
          // if (doctor. != null)
          //   ..._getTitleAndInfoWithDivider(
          //       title: context.loc.position, info: doctor.position.toString()),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     DoctorInfoWidget(
          //       title: context.loc.age,
          //       info: doctor.age.toString(),
          //     ),
          //     DoctorInfoWidget(
          //       title: context.loc.department,
          //       info: doctor.department,
          //     ),
          //     DoctorInfoWidget(
          //       title: context.loc.workingExperience,
          //       info: doctor.workingExperience.toString(),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 10.0),
          //
          // if (doctor.workPlace != null)
          //   Padding(
          //     padding:
          //         const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          //     child: DoctorInfoWidget(
          //       title: context.loc.workPlace,
          //       info: doctor.workPlace ?? '',
          //     ),
          //   ),
          //
          // if (doctor.position != null)
          //   Padding(
          //     padding:
          //         const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          //     child: DoctorInfoWidget(
          //       title: context.loc.position,
          //       info: doctor.position ?? '',
          //     ),
          //   ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: StyledExpansionTile(
          //     borderRadius: 0.0,
          //     itemColor: theme.scaffoldBackgroundColor,
          //     itemPadding: 5.0,
          //     borderColor: theme.colorScheme.primary,
          //     expansionCallback: (panelIndex, isExpanded) {
          //       setState(() {
          //         expandInfo[panelIndex].isExpanded =
          //             !expandInfo[panelIndex].isExpanded;
          //       });
          //     },
          //     children: [
          //       ExpansionPanel(
          //         canTapOnHeader: true,
          //         isExpanded: expandInfo[0].isExpanded,
          //         headerBuilder: (context, isExpanded) {
          //           return Align(
          //               alignment: Alignment.centerLeft,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(10.0),
          //                 child: Text(
          //                   context.loc
          //                       .informationTiles(expandInfo[0].title)
          //                       .toUpperCase(),
          //                   style: theme.textTheme.titleMedium?.copyWith(
          //                     color: theme.colorScheme.primary,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ));
          //         },
          //         body: Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Column(
          //             children: [
          //               if (doctor.workPlaces.isNotEmpty)
          //                 for (final place in doctor.workPlaces) ...[
          //                   TitleAndInformationWidget(
          //                     title:
          //                         "${place.startYear} ${place.endYear != null ? '-' : ''} ${place.endYear ?? ''}",
          //                     info: place.club,
          //                   ),
          //                   if (place != doctor.workPlaces.last)
          //                     Divider(
          //                       color: theme.colorScheme.primary,
          //                       thickness: 0.5,
          //                     ),
          //                 ],
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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

  List<Widget> _getTitleAndInfoWithDivider(
      {required String title, required String info, bool isLast = false}) {
    return [
      TitleAndInformationWidget(title: title, info: info),
      if (!isLast) const Divider(),
    ];
  }
}
