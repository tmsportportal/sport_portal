import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/empty_widget.dart';
import 'package:sport_portal/src/widgets/error_widget.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../../widgets/custom_search_bar.dart';
import '../controller/gyms_controller.dart';
import '../data/dto/gyms_dto.dart';
import 'widgets/gym_list_item.dart';
import 'widgets/gym_marker_info.dart';
import 'widgets/gyms_search_drawer.dart';

class GymsScreen extends StatefulWidget {
  static const route = '/gyms';

  const GymsScreen({super.key});

  @override
  State<GymsScreen> createState() => _GymsScreenState();
}

class _GymsScreenState extends State<GymsScreen> {
  final _gymsController = GetIt.instance<GymsController>();

  @override
  void initState() {
    _gymsController.fetchData();
    _gymsController.fetchFilters();
    super.initState();
  }

  @override
  void dispose() {
    _gymsController.disposeControllers();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScaffoldWithButton(
        endDrawer: GymsSearchDrawer(
          controller: _gymsController,
        ),
        body: StateControlWidget(
          isLoading: false,
          isError: false,
          title: context.loc.gymsSearch,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: CustomSearchBar(
                  textEditingController: _gymsController.textEditingController,
                  focus: _gymsController.focus,
                  title: context.loc.searchText,
                  onSearchTapped: _gymsController.onSearchTapped,
                  onClearTapped: _gymsController.onClearTapped,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Observer(builder: (context) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: _gymsController.mapHeight,
                  child: FlutterMap(
                    options: MapOptions(
                      center: const LatLng(37.9492401, 58.2789513),
                      zoom: 9.2,
                      maxZoom: 18.0,
                    ),
                    mapController: _gymsController.mapController,
                    nonRotatedChildren: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton.filled(
                              onPressed: () {
                                _gymsController.incrementZoom();
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton.filled(
                              onPressed: () {
                                _gymsController.decrementZoom();
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                onPressed: () {
                                  _gymsController.changeMapHeight(
                                      MediaQuery.of(context).size.height - 200);
                                },
                                icon: Icon(_gymsController.mapHeight == 250.0
                                    ? Icons.fullscreen_rounded
                                    : Icons.fullscreen_exit_rounded),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      Observer(builder: (context) {
                        return MarkerLayer(
                          markers: [
                            for (final marker
                                in _gymsController.gymsList?.value ??
                                    <GymDto>[])
                              Marker(
                                point: LatLng(marker.latitude ?? 0.0,
                                    marker.longitude ?? 0.0),
                                // anchorPos: AnchorPos.align(AnchorAlign.top),
                                height: 40.0,
                                width: 40.0,
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => GymMarkerInfoDialog(
                                        marker: marker,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.location_on_rounded),
                                  color: Colors.blue,
                                ),
                              ),
                          ],
                        );
                      })
                    ],
                  ),
                );
              }),
            ),
            Observer(builder: (_) {
              if (_gymsController.gymsList == null) {
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
              switch (_gymsController.gymsList!.status) {
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
                          if (_gymsController
                                  .textEditingController.text.isEmpty &&
                              _gymsController.filtersMap.isEmpty) {
                            _gymsController.fetchData();
                          } else {
                            _gymsController.fetchFilteredData();
                          }
                        },
                      ),
                    ),
                  );
                case FutureStatus.fulfilled:
                  if (_gymsController.gymsList?.value == null ||
                      (_gymsController.gymsList?.value?.isEmpty ?? true)) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: CustomEmptyWidget(
                        size: 150.0,
                        text: context.loc.gymsIsNotFound,
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if (_gymsController.gymsList?.value != null &&
                            (_gymsController.gymsList?.value?.isNotEmpty ??
                                false))
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              context.loc.gymsFound,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        for (final gym
                            in _gymsController.gymsList?.value ?? <GymDto>[])
                          GymListItem(gym: gym),
                        const SizedBox(height: 90.0),
                      ],
                    ),
                  );
              }
            }),
          ],
        ),
      ),
    );
  }
}
