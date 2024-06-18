import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

import '../../../../../../../utils/date_time_parser.dart';
import '../../../../../../../widgets/empty_widget.dart';
import '../../../../../../../widgets/error_widget.dart';
import '../../../../../video_news_item/presentation/video_news_item_screen.dart';
import '../../../../controllers/video_news/video_news_controller.dart';
import '../../../../data/dto/news_filter_dto.dart';
import '../category_picker_bottom_sheet.dart';
import 'widgets/video_news_list_item.dart';

class VideoNewsBar extends StatefulWidget {
  const VideoNewsBar({super.key});

  @override
  State<VideoNewsBar> createState() => _VideoNewsBarState();
}

class _VideoNewsBarState extends State<VideoNewsBar>
    with AutomaticKeepAliveClientMixin<VideoNewsBar> {
  @override
  bool get wantKeepAlive => true;

  final _controller = GetIt.instance<VideoNewsController>();

  @override
  void initState() {
    _controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        // TextButton.icon(
                        //   onPressed: () {},
                        //   icon: const Icon(Icons.sort_rounded),
                        //   label: Text(context.loc.sort),
                        // ),
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
                      ],
                    ),
                  ),
                  if (list == null || list.isEmpty)
                    const CustomEmptyWidget()
                  else if (list.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          // final arguments = NewsItemScreenArguments(list[0].id);
                          Navigator.pushNamed(
                              context, VideoNewsItemScreen.route,
                              arguments: {'newsItem': list[0]});
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  side: BorderSide(
                                      color: theme.colorScheme.primary),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      child: SizedBox(
                                        height: 180.0,
                                        child: CachingImage(
                                          list[0].imagePath,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.play_circle_outline_rounded,
                                      size: 53.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                list[0].name ?? '',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                // '',
                                "${DateTimeParser.parseDate(list[0].createdAt ?? DateTime.now(), '.')} ${DateTimeParser.parseTime(list[0].createdAt ?? DateTime.now(), ':')} ",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (list != null && list.isNotEmpty && list.length > 1)
                    for (var element in list.skip(1))
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: VideoNewsListItem(newsItem: element),
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
