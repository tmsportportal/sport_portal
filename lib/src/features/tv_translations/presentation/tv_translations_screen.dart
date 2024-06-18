import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/features/tv_channel_watch/view/tv_channel_watch_screen.dart';
import 'package:sport_portal/src/features/tv_translations/controller/tv_translations_controller.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

class TvTranslationsScreen extends StatefulWidget {
  static const route = '/tvTranslations';
  const TvTranslationsScreen({super.key});

  @override
  State<TvTranslationsScreen> createState() => _TvTranslationsScreenState();
}

class _TvTranslationsScreenState extends State<TvTranslationsScreen> {
  final controller = GetIt.instance<TvTranslationsController>();

  @override
  void initState() {
    controller.fetchChannels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return StateControlWidget(
          isLoading: controller.isLoading,
          isError: controller.isError,
          title: 'TV',
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                final channel = controller.channelsWithUrls[index];
                return ListTile(
                  dense: true,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: channel.urls
                                      .map(
                                        (e) => ListTile(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TvChannelWatchScreen(
                                                  url: e,
                                                  name: channel.name,
                                                  logo: channel.logo,
                                                ),
                                              ),
                                            );
                                          },
                                          title: Text(e ?? ''),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ));
                  },
                  leading: Container(
                    height: 100.0,
                    width: 60.0,
                    color: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image(
                      image: NetworkImage(channel.logo ?? ''),
                    ),
                  ),
                  trailing: const Icon(Icons.live_tv_rounded),
                  title: Text(channel.name ?? ''),
                  subtitle: Text('${channel.city ?? ''} ${channel.country} '),
                );
              },
              childCount: controller.channelsWithUrls.length,
            ))
          ],
        );
      }),
    );
  }
}
