import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../globals/globals.dart';
import '../../../widgets/state_control_widget.dart';
import '../../athletes/athletes/presentation/athletes_screen.dart';
import '../../coaches/coaches/presentation/coaches_screen.dart';
import '../../competitions/competitions/presentation/competitions_screen.dart';
import '../../gyms/gyms/presentation/gyms_screen.dart';
import '../../health_care/doctors/presentation/doctors_screen.dart';
import '../../kinds_of_sport/presentation/kinds_of_sport.dart';
import '../../news/news/presentation/news_screen/news_screen.dart';
import '../../tv_translations/presentation/tv_translations_screen.dart';
import '../models/home_category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StateControlWidget(
      toolbarHeight: 90.0,
      titleWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(r'assets/images/2.png'),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.loc.hello,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  context.loc.slogan,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.0,
            child: IconButton(
              iconSize: 14,
              onPressed: () {
                Navigator.pushNamed(context, TvTranslationsScreen.route);
              },
              icon: Image.asset('assets/images/tv_logo.png'),
            ),
          )
        ],
      ),
      isError: isError,
      isLoading: isLoading,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              mainAxisExtent: 280.0,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final category = homeCategoriesList[index];
              return HomeCategoryGridWidget(
                title: context.loc.categoryName(category.title),
                isEven: index % 2 == 0,
                onTap: () {
                  _onTap(context, category.type);
                },
                image: category.image,
                description: context.loc.categoryDescription(category.title),
              );
            }, childCount: homeCategoriesList.length),
          ),
        ),
      ],
    );
  }

  void _onTap(BuildContext context, CategoriesEnum type) {
    String screen = '/';
    switch (type) {
      case CategoriesEnum.athletes:
        screen = AthletesScreen.route;
        break;
      case CategoriesEnum.kindsOfSport:
        screen = KindsOfSportScreen.route;
        break;
      case CategoriesEnum.coaches:
        screen = CoachesScreen.route;
        break;
      case CategoriesEnum.sportNews:
        screen = NewsScreen.route;
        break;
      case CategoriesEnum.healthCare:
        screen = DoctorsScreen.route;
        break;
      case CategoriesEnum.gyms:
        screen = GymsScreen.route;
        break;
      case CategoriesEnum.competitions:
        screen = CompetitionsScreen.route;
        break;
      default:
        screen = '/';
        break;
    }
    Navigator.pushNamed(context, screen);
  }
}

class HomeCategoryGridWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;
  final bool isEven;

  const HomeCategoryGridWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.image,
      required this.description,
      required this.isEven});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        // border: Border.all(color: theme.colorScheme.primary),
        // border: Border(
        //   bottom: BorderSide(
        //     color: Colors.blueAccent,
        //     width: 0.3,
        //   ),
        // ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(vertical: 7.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: image.isEmpty
                        ? const Placeholder()
                        : Image(
                            fit: BoxFit.contain,
                            image: AssetImage(image),
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    color: theme.colorScheme.primary.withOpacity(0.07),
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.toUpperCase(),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          description,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withOpacity(0.7),
                            fontWeight: FontWeight.w200,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
