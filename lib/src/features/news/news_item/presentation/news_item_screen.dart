import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/news/news/data/dto/news_list_dto.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

import '../../../../widgets/custom_scaffold_with_button.dart';
import '../../../../widgets/view_count_widget.dart';

class NewsItemScreen extends StatefulWidget {
  static const route = '/news_item';
  final NewsListDto newsItem;

  const NewsItemScreen({super.key, required this.newsItem});

  @override
  State<NewsItemScreen> createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  late final NewsListDto newsItem;

  @override
  void initState() {
    newsItem = widget.newsItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      appBar: AppBar(),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              CachingImage(newsItem.imagePath),
            ],
            options: CarouselOptions(
                height: 200.0, autoPlay: true, viewportFraction: 1.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsItem.name ?? '',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  newsItem.location ?? '',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 10.0),
                // Flexible(
                //   child: Text(
                //     "${DateTimeParser.parseDate(newsItem.createdAt ?? DateTime.now(), '.')} ${DateTimeParser.parseTime(newsItem.createdAt ?? DateTime.now(), ':')}",
                //     style: theme.textTheme.bodySmall,
                //   ),
                // ),
                const Expanded(
                  child: ViewCountWidget(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(newsItem.text ?? ''),
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
