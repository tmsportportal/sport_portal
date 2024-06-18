import 'package:flutter/material.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

class CustomExpansionListTile extends StatelessWidget {
  final String title;
  final String? image;
  final String? netImage;
  final List<Widget> children;

  const CustomExpansionListTile(
      {super.key,
      required this.children,
      required this.title,
      this.image,
      this.netImage});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(10.0),
      childrenPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      leading: netImage == null && image == null
          ? null
          : SizedBox(
              width: 60.0,
              height: 80.0,
              child: netImage != null
                  ? CachingImage(netImage)
                  : Image.asset(
                      "assets/images/sport_category/$image",
                    ),
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
      children: children,
    );
  }
}
