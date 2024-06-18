import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/news/news/data/dto/video_news_list_dto.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

import '../../../../../../video_news_item/presentation/video_news_item_screen.dart';

class VideoNewsListItem extends StatelessWidget {
  final VideoNewsListDto newsItem;

  const VideoNewsListItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          VideoNewsItemScreen.route,
          arguments: {'newsItem': newsItem},
        );
      },
      leading: SizedBox(
        width: 60.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachingImage(newsItem.imagePath),
            const Icon(
              Icons.play_circle_outline_rounded,
              size: 40.0,
              color: Colors.white,
            ),
          ],
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
          '',
          // "${newsItem.location} - ${DateTimeParser.parseDate(element.time, '.')} ${DateTimeParser.parseTime(element.time, ':')} ",
          style: theme.textTheme.bodySmall?.copyWith(
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
