import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:video_player/video_player.dart';

class TvChannelWatchScreen extends StatefulWidget {
  final String? url;
  final String? logo;
  final String? name;
  const TvChannelWatchScreen({super.key, this.url, this.logo, this.name});

  @override
  State<TvChannelWatchScreen> createState() => _TvChannelWatchScreenState();
}

class _TvChannelWatchScreenState extends State<TvChannelWatchScreen> {
  late VideoPlayerController _controller;

  ChewieController? chewieController;
  Widget video = const SizedBox();

  String? errorText;

  Widget _loadingWidget() {
    return Container(
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image(
              image: NetworkImage(widget.logo ?? ''),
            ),
          ),
          ColoredBox(
            color: Colors.black.withOpacity(.2),
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _initControllers() {
    errorText = null;
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url ?? ''))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          looping: true,
          isLive: true,
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
        errorText = error.toString();
        setState(() {});
      });
  }

  @override
  void initState() {
    log(widget.url ?? '');
    log(widget.logo ?? '');
    _initControllers();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        if (errorText != null) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(errorText ?? ''),
            ),
          );
        }
        return ListView(
          children: [
            Center(
              child: _controller.value.isInitialized ? video : _loadingWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 90.0,
                child: Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: 90.0,
                      color: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: NetworkImage(widget.logo ?? ''),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      widget.name ?? '',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
