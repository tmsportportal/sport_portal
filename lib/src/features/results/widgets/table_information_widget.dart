import 'package:flutter/material.dart';

import 'colored_circle_with_title.dart';

class TableInformationWidget extends StatelessWidget {
  final String? top;
  final String? qualification;
  final String? outsider;

  const TableInformationWidget(
      {super.key, this.top, this.qualification, this.outsider});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        if (top != null)
          ColoredCircleWithTitle(
            color: const Color(0xFF24722B),
            title: top ?? '',
          ),
        const SizedBox(width: 15.0),
        if (qualification != null)
          ColoredCircleWithTitle(
            color: const Color(0xFF0088FF),
            title: qualification ?? '',
          ),
        const SizedBox(width: 15.0),
        if (outsider != null)
          ColoredCircleWithTitle(
            color: const Color(0xFFB3261E),
            title: outsider ?? '',
          ),
      ],
    );
  }
}
