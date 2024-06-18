import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../../../widgets/custom_scaffold_with_button.dart';
import 'widgets/local_news/national_news_bar_widget.dart';
import 'widgets/video_news/video_news_bar_widget.dart';
import 'widgets/world_news/world_news_bar_widget.dart';

class NewsScreen extends StatelessWidget {
  static const route = r'/news';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScaffoldWithButton(
          appBar: AppBar(
            title: Text(context.loc.sportNews),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Center(
                    child: Text(
                      context.loc.localNews,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      context.loc.worldNews,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      context.loc.videoNews,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              NationalNewsBar(),
              WorldNewsBar(),
              VideoNewsBar(),
            ],
          )),
    );
  }
}
