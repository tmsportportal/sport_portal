import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/competitions/competitions/controller/competitions_controller.dart';
import 'package:sport_portal/src/features/competitions/competitions/presentation/widgets/competitions_search_drawe.dart';
import 'package:sport_portal/src/utils/date_time_parser.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/empty_widget.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../../widgets/custom_search_bar.dart';
import '../../../../widgets/error_widget.dart';
import '../../../localization/controller/localization_controller.dart';
import '../../competition/presentation/competition_screen.dart';

class CompetitionsScreen extends StatefulWidget {
  static const route = '/competitions';

  const CompetitionsScreen({super.key});

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> {
  final LocalizationsController _localizationsController = GetIt.instance();
  final _controller = GetIt.instance<CompetitionsController>();

  @override
  void initState() {
    _controller.fetchData();
    _controller.fetchFilters();
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScaffoldWithButton(
        endDrawer: CompetitionsSearchDrawer(controller: _controller),
        body: StateControlWidget(
          isLoading: false,
          isError: false,
          title: context.loc.categoryName('competitions'),
          actions: [
            IconButton(
              onPressed: () async {
                DateTimeRange? pickedDate = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2023, 9),
                  lastDate: DateTime(DateTime.now().year + 2),
                  initialDateRange: _controller.date,
                );
                _controller.updatePickerDate(pickedDate);
              },
              icon: const Icon(Icons.calendar_month_outlined),
            ),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.menu_rounded),
              );
            }),
          ],
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: CustomSearchBar(
                  textEditingController: _controller.textEditingController,
                  focus: _controller.focus,
                  title: context.loc.searchText,
                  onSearchTapped: _controller.onSearchTapped,
                  onClearTapped: _controller.onClearTapped,
                ),
              ),
            ),

            Observer(builder: (context) {
              if (_controller.competitions == null) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      context.loc.startSearching,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
              switch (_controller.competitions!.status) {
                case FutureStatus.pending:
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case FutureStatus.rejected:
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CustomErrorWidget(
                        onError: () {
                          if (_controller
                              .textEditingController.text.isNotEmpty) {
                            _controller.fetchData();
                          } else {
                            _controller.fetchFilteredData();
                          }
                        },
                      ),
                    ),
                  );
                case FutureStatus.fulfilled:
                  if (_controller.competitions?.value == null ||
                      (_controller.competitions?.value?.isEmpty ?? true)) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: CustomEmptyWidget(
                        size: 150.0,
                        text: context.loc.competitionsIsNotFound,
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final competition =
                              _controller.competitions?.value![index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CompetitionScreen.route,
                                  arguments: {
                                    'competition': competition,
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Column(
                                    children: [
                                      ColoredBox(
                                        color: theme
                                            .colorScheme.secondaryContainer,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                _getIcon(competition
                                                        ?.competitionType?.id ??
                                                    0),
                                                height: 16.0,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                competition
                                                        ?.competitionType?.name
                                                        ?.toUpperCase() ??
                                                    '',
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 180.0,
                                        child: CachingImage(
                                          competition?.imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                LocationAndDateRangeWidget(
                                  location: competition?.location ?? '',
                                  dateTimeRange: DateTimeRange(
                                      start: competition?.dateStart ??
                                          DateTime.now(),
                                      end: competition?.dateEnd ??
                                          DateTime.now()),
                                  locale: _localizationsController
                                          .locale?.languageCode ??
                                      'tk',
                                ),
                                Expanded(
                                  child: Text(
                                    competition?.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.oswald().fontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount:
                            _controller.competitions?.value?.length ?? 0,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: 350.0,
                      ),
                    ),
                  );
              }
            }),
            // if (_controller.competitions != null &&
            //     _controller.competitions?.value != null &&
            //     (_controller.competitions?.value?.isNotEmpty ?? false))
          ],
        ),
      ),
    );
  }

  String _getIcon(int id) {
    switch (id) {
      case 3:
        return 'assets/icons/training.svg';
      case 2:
        return 'assets/icons/event.svg';
      case 1:
        return 'assets/icons/competition.svg';
      default:
        return 'assets/icons/competition.svg';
    }
  }
}

//
// class  extends StatelessWidget {
//   const ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class LocationAndDateRangeWidget extends StatelessWidget {
  final String location;
  final DateTimeRange dateTimeRange;
  final String locale;

  const LocationAndDateRangeWidget(
      {super.key,
      required this.location,
      required this.dateTimeRange,
      required this.locale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$location - ',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 12.0,
          ),
        ),
        Flexible(
          child: Text(
            DateTimeParser.parseDateRange(
              dateTimeRange,
              locale,
            ),
            maxLines: 2,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
