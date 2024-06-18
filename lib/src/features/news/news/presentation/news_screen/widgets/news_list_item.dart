import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/news/news/data/dto/news_list_dto.dart';

import '../../../../../../utils/date_time_parser.dart';
import '../../../../../../widgets/caching_image.dart';
import '../../../../news_item/presentation/news_item_screen.dart';

class NewsListItem extends StatelessWidget {
  final NewsListDto newsItem;

  const NewsListItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        // final arguments = NewsItemScreenArguments(element.id);
        Navigator.pushNamed(
          context,
          NewsItemScreen.route,
          arguments: {'newsItem': newsItem},
        );
      },
      leading: SizedBox(
        width: 60.0,
        child: CachingImage(
          newsItem.imagePath,
        ),
      ),
      title: Text(
        newsItem.name ?? '',
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          "${newsItem.location} - ${DateTimeParser.parseDate(newsItem.createdAt ?? DateTime.now(), '.')}",
          // newsItem.location ?? '',
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
