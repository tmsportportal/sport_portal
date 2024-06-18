import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/like_button.dart';
import 'package:sport_portal/src/widgets/rating_bar.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

import '../../../widgets/list_product_widget.dart';

class ProductScreen extends StatelessWidget {
  static const route = '/product';
  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      body: StateControlWidget(
        isError: false,
        isLoading: false,
        actions: [
          LikeButton(isFav: false, onPressed: () {}),
        ],
        slivers: [
          SliverToBoxAdapter(
            child: CarouselSlider(
              items: [
                for (int i = 1; i < 10; i++)
                  const CachingImage(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjDKB9TSM4nJXJLzh3ncsj0ZI5Nsi0hBiGlCa97blQEV93Ji45ZmaNlrnOP9S0c9fScluV4766_Nk8KAhnl_7VBHdmHtDQvkZ56qx2YY3a8j1ft9LujmaRIq0guuGfHAj-V3CeWmpESJcBR4XCPYg_QJen63nOGJ8uuNi12EskBsB9LaAL0duTiCRVV/s1600/liverpool-23-24-home-kit%20%281%29.jpg',
                  ),
              ],
              options: CarouselOptions(height: 300.0, autoPlay: true),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Liverpool Home Kit 2023/24',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Nike',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              const RatingBar(
                rating: 5,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AddToCartButton(isCart: false),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    r"Cubilia tellus ridiculus quidam tantas pretium. Causae molestie eleifend tellus massa. Ponderum deserunt pharetra donec mei cras sit labores senectus persecuti. Ridiculus quaestio mutat fuisset dignissim interesset luptatum dignissim maecenas. Regione venenatis atqui utroque hac id posse error affert expetendis."),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
