import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../../../../../widgets/empty_widget.dart';
import '../../../../../../../widgets/error_widget.dart';
import '../../../../controllers/world_news/world_news_controller.dart';
import '../../../../data/dto/news_filter_dto.dart';
import '../category_picker_bottom_sheet.dart';
import '../news_list_item.dart';

class WorldNewsBar extends StatefulWidget {
  const WorldNewsBar({super.key});

  @override
  State<WorldNewsBar> createState() => _WorldNewsBarState();
}

class _WorldNewsBarState extends State<WorldNewsBar>
    with AutomaticKeepAliveClientMixin<WorldNewsBar> {
  @override
  bool get wantKeepAlive => true;

  final _controller = GetIt.instance<WorldNewsController>();

  @override
  void initState() {
    _controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        switch (_controller.news.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return CustomErrorWidget(onError: () {
              _controller.init();
            });
          case FutureStatus.fulfilled:
            final list = _controller.news.value;
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                if (_controller.filtersMap.isNotEmpty) {
                  _controller.fetchFilteredNews();
                } else {
                  _controller.fetchNews();
                }
              },
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: false,
                              builder: (context) => CategoryPickerBottomSheet(
                                filters: _controller.filters?.value?.filters ??
                                    <Filter>[],
                                onConfirmTapped: (value) {
                                  _controller.addFilter(
                                      _controller.filters?.value?.name ?? '',
                                      value);
                                  if (value.isNotEmpty) {
                                    _controller.fetchFilteredNews();
                                  }
                                },
                                currentElement: _controller.filtersMap[
                                    _controller.filters?.value?.name],
                                onClearTapped: () => _controller.clearFilters(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.filter_alt_outlined),
                          label: Text(context.loc.filter),
                        ),
                        // TextButton.icon(
                        //   onPressed: () {
                        //     Navigator.pushNamed(
                        //         context, WorldResultsScreen.route);
                        //   },
                        //   icon: const Icon(Icons.calendar_month_outlined),
                        //   label: Text(context.loc.results),
                        // ),
                      ],
                    ),
                  ),
                  if (list == null || list.isEmpty)
                    const Center(child: CustomEmptyWidget())
                  else if (list.isNotEmpty)
                    for (var element in list)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: NewsListItem(newsItem: element),
                      ),
                  const SizedBox(height: 80.0),
                ],
              ),
            );
        }
      },
    );
  }
}
