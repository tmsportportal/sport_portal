import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/core/network/dio_helper.dart';
import 'package:sport_portal/src/globals/globals.dart';
import 'package:sport_portal/src/utils/date_time_parser.dart';
import 'package:sport_portal/src/widgets/comment_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../widgets/caching_image.dart';
import '../../../../widgets/custom_scaffold_with_button.dart';
import '../../news/data/dto/video_news_list_dto.dart';

class VideoNewsItemScreen extends StatefulWidget {
  static const route = '/video_news_item';
  final VideoNewsListDto newsItem;

  const VideoNewsItemScreen({super.key, required this.newsItem});

  @override
  State<VideoNewsItemScreen> createState() => _VideoNewsItemScreenState();
}

class _VideoNewsItemScreenState extends State<VideoNewsItemScreen> {
  late final VideoNewsListDto newsItem;
  late VideoPlayerController _controller;

  ChewieController? chewieController;
  Widget video = const SizedBox();

  void _initControllers() {
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('${Configs.baseUrl}/${newsItem.videoPath}'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: false,
          looping: true,
          optionsTranslation: OptionsTranslation(
              playbackSpeedButtonText: context.loc.playbackSpeed,
              subtitlesButtonText: context.loc.subtitles,
              cancelButtonText: context.loc.cancel),
          errorBuilder: (context, errorMessage) {
            return Text(errorMessage);
          },
        );
        if (chewieController != null) {
          video = AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Chewie(controller: chewieController!),
          );
        }
        setState(() {});
      }).onError((error, _) {
        debugPrint(error.toString());
      });
  }

  @override
  void initState() {
    super.initState();
    newsItem = widget.newsItem;
    _initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? video
                : AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachingImage(newsItem.imagePath),
                        const CircularProgressIndicator.adaptive(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  ),
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
                // Text(
                //   newsItem.location,
                //   style: theme.textTheme.bodySmall,
                // ),
                // const SizedBox(width: 10.0),
                Text(
                  "${DateTimeParser.parseDate(newsItem.createdAt ?? DateTime.now(), '.')} ${DateTimeParser.parseTime(newsItem.createdAt ?? DateTime.now(), ':')}",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Text(newsItem.te * 10),
          // ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              context.loc.comments,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          for (final comment in comments) CommentWidget(comment: comment),
        ],
      ),
    );
  }
}
