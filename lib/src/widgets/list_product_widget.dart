import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import 'like_button.dart';
import 'rating_bar.dart';

class ListProductWidget extends StatelessWidget {
  // final
  const ListProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  // TODO: change to CachingImage
                  child: Image.network(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjDKB9TSM4nJXJLzh3ncsj0ZI5Nsi0hBiGlCa97blQEV93Ji45ZmaNlrnOP9S0c9fScluV4766_Nk8KAhnl_7VBHdmHtDQvkZ56qx2YY3a8j1ft9LujmaRIq0guuGfHAj-V3CeWmpESJcBR4XCPYg_QJen63nOGJ8uuNi12EskBsB9LaAL0duTiCRVV/s1600/liverpool-23-24-home-kit%20%281%29.jpg',
                    fit: BoxFit.cover,
                    frameBuilder: (BuildContext context, Widget child,
                        int? frame, bool? wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: (context, child, _) {
                      return SizedBox.expand(
                        child: ColoredBox(
                          color: const Color(0xFFE9E9E9),
                          child: child,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: LikeButton(
                    isFav: false,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Text(
              'Liverpool Home Kit 2023/24',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const RatingBar(
            rating: 5,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (index % 2 != 0)
              //   Padding(
              //     padding: const EdgeInsets.all(4.0),
              //     child: Text(
              //       '750.00 TMT',
              //       style: theme.textTheme.bodySmall?.copyWith(
              //         decoration: TextDecoration.lineThrough,
              //       ),
              //     ),
              //   ),
              Text(
                '550.00 TMT',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const AddToCartButton(isCart: false),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final bool isCart;

  const AddToCartButton({super.key, required this.isCart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {},
      label: isCart
          ? Text(context.loc.removeFromCart)
          : Text(context.loc.addToCart),
      style: isCart
          ? ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.background,
              foregroundColor: theme.colorScheme.primary,
            )
          : null,
      icon: const Icon(Icons.shopping_bag_outlined),
    );
  }
}
