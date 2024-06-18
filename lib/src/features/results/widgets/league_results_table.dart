import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../widgets/caching_image.dart';
import '../models/club_result_model.dart';
import 'cell_item.dart';
import 'header_cell_item.dart';

class LeagueResultsTable extends StatelessWidget {
  final List<TableRow> list;

  const LeagueResultsTable({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            color: theme.scaffoldBackgroundColor,
            width: 3.0,
          ),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(5),
          6: FlexColumnWidth(2),
        },
        children: [_header(context), ...list],
      ),
    );
  }

  TableRow _header(BuildContext context) {
    return TableRow(
      children: [
        const HeaderCellItem('#'),
        HeaderCellItem(context.loc.team),
        HeaderCellItem(context.loc.games[0]),
        HeaderCellItem(context.loc.wins[0]),
        HeaderCellItem(context.loc.draws[0]),
        HeaderCellItem(context.loc.loses[0]),
        const HeaderCellItem('+/-'),
        HeaderCellItem(context.loc.points[0]),
      ],
    );
  }
}

@immutable
class LeagueRowItem {
  static List<Widget> getItems(int i, Color color, ClubResultModel model) => [
        Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              child: SizedBox(
                height: 30.0,
                width: 3.0,
                child: ColoredBox(
                  color: color,
                ),
              ),
            ),
            Expanded(
              child: CellItem('$i'),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 20.0,
              width: 20.0,
              child: CachingImage(
                model.clubLogo.isNotEmpty
                    ? model.clubLogo
                    : 'https://upload.wikimedia.org/wikipedia/hif/b/bd/Liverpool_FC.png',
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: CellItem(
                model.club,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        CellItem(model.games.toString()),
        CellItem(model.wins.toString()),
        CellItem(model.draws.toString()),
        CellItem(model.loses.toString()),
        CellItem("${model.scored}-${model.conceded}"),
        CellItem(model.points.toString()),
      ];
}
