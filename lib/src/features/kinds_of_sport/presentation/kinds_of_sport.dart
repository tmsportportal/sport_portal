import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../widgets/custom_expansion_list_tile.dart';
import '../controller/kinds_of_sport_controller.dart';

class KindsOfSportScreen extends StatefulWidget {
  static const route = '/kinds_of_sport';

  const KindsOfSportScreen({super.key});

  @override
  State<KindsOfSportScreen> createState() => _KindsOfSportScreenState();
}

class _KindsOfSportScreenState extends State<KindsOfSportScreen> {
  final _controller = GetIt.instance<KindsOfSportController>();

  @override
  void initState() {
    _controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      body: Observer(builder: (_) {
        return StateControlWidget(
          isLoading: _controller.federations.status == FutureStatus.pending,
          isError: _controller.federations.status == FutureStatus.rejected,
          title: context.loc.kindsOfSport,
          onErrorTap: _controller.fetchData,
          slivers: [
            if (_controller.federations.value != null)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final sportCategory = _controller.federations.value![index];
                    return CustomExpansionListTile(
                      title: (sportCategory.name ?? '').toUpperCase(),
                      // image: '',
                      netImage: sportCategory.imagePath,
                      children: [
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.president,
                          info: sportCategory.fsports?.president ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.mainCoach,
                          info: sportCategory.fsports?.leader ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.foundYear,
                          info: sportCategory.fsports?.founded.toString() ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.location,
                          info: sportCategory.fsports?.location ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.phone,
                          info: sportCategory.fsports?.tel ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.fax,
                          info: sportCategory.fsports?.fax ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.mail,
                          info: sportCategory.fsports?.email ?? '',
                        ),
                        ..._getTitleAndInfoWithDivider(
                          title: context.loc.webSite,
                          info: sportCategory.fsports?.web ?? '',
                          isLast: true,
                        ),
                      ],
                    );
                  },
                  childCount: _controller.federations.value?.length ?? 0,
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 90.0),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> _getTitleAndInfoWithDivider(
      {required String title, required String info, bool isLast = false}) {
    return [
      TitleAndInformationWidget(title: title, info: info),
      if (!isLast) const Divider(),
    ];
  }
}

class TitleAndInformationWidget extends StatelessWidget {
  final String title;
  final String info;

  const TitleAndInformationWidget(
      {super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(flex: 2, child: Text(info)),
        ],
      ),
    );
  }
}
