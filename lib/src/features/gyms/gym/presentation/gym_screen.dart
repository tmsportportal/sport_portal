import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../../widgets/custom_expansion_list_tile.dart';
import '../../gyms/data/dto/gyms_dto.dart';

class GymScreen extends StatefulWidget {
  static const route = 'gym';
  final GymDto gym;

  const GymScreen({super.key, required this.gym});

  @override
  State<GymScreen> createState() => _GymScreenState();
}

class _GymScreenState extends State<GymScreen> {
  late final GymDto _gym;

  @override
  void initState() {
    _gym = widget.gym;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      key: UniqueKey(),
      body: StateControlWidget(
        isError: false,
        isLoading: false,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider(
                  items: [
                    CachingImage(_gym.imagePath1),
                    if (_gym.imagePath2 != null) CachingImage(_gym.imagePath2),
                    if (_gym.imagePath3 != null) CachingImage(_gym.imagePath3),
                    if (_gym.imagePath4 != null) CachingImage(_gym.imagePath4),
                    if (_gym.imagePath5 != null) CachingImage(_gym.imagePath5),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    // onPageChanged: (index, reason) {
                    //   setState(() {
                    //     _current = index;
                    //   });
                    // }),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     for (int i = 0; i < 5; i++)
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  //         child: SizedBox(
                  //           height: 8.0,
                  //           width: 8.0,
                  //           child: ClipOval(
                  //             child: ColoredBox(
                  //               color: _current == i ? Colors.blue : Colors.grey,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _gym.name ?? '',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Text(
                context.loc.contacts,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.location_on_outlined),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(child: Text(_gym.location ?? '')),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.phone_outlined),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (final phone in _gym.tel ?? <String>[])
                                      Text(phone),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (_gym.email != null)
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.mail_outline_rounded),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(child: Text(_gym.email ?? '')),
                              ],
                            ),
                          if (_gym.link != null)
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.language_rounded),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(child: Text(_gym.link ?? '')),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  23.toString(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  context.loc.coachCount,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  150.toString(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  context.loc.athleteCount,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomExpansionListTile(
              title: "${context.loc.kindsOfSport} (${_gym.sportsRu?.length})",
              children: _gym.sports
                      ?.map(
                        (sport) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(sport),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       context.loc.relatedGyms,
          //       style: theme.textTheme.titleLarge?.copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          // SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //   (context, index) {
          //     final gym = gymMarkerModelList[index];
          //     return GymListItem(gym: gym);
          //   },
          //   childCount: gymMarkerModelList.length,
          // )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}
