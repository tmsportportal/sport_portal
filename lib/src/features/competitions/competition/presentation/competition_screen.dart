import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../../widgets/custom_scaffold_with_button.dart';
import '../../../../widgets/view_count_widget.dart';
import '../../../localization/controller/localization_controller.dart';
import '../../competitions/data/dto/competition_list_dto.dart';
import '../../competitions/presentation/competitions_screen.dart';

class CompetitionScreen extends StatefulWidget {
  static const route = '/competition';
  final CompetitionListDto competition;

  const CompetitionScreen({super.key, required this.competition});

  @override
  State<CompetitionScreen> createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  late final CompetitionListDto competition;
  final LocalizationsController _localizationsController = GetIt.instance();

  @override
  void initState() {
    competition = widget.competition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      body: StateControlWidget(
        isLoading: false,
        isError: false,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            CarouselSlider(
              items: [CachingImage(competition.imagePath)],
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                competition.name ?? '',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: LocationAndDateRangeWidget(
                      location: competition.location ?? '',
                      dateTimeRange: DateTimeRange(
                          start: competition.dateStart ?? DateTime.now(),
                          end: competition.dateEnd ?? DateTime.now()),
                      locale:
                          _localizationsController.locale?.languageCode ?? 'en',
                    ),
                  ),
                  Expanded(
                    child: ViewCountWidget(
                      count: competition.views ?? 0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(competition.text ?? ''),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(
                context.loc.forParticipation,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('url'),
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(competition.url),
            // ),
          ]))
        ],
      ),
    );
  }
}
