import 'package:flutter/material.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

import '../../../../../widgets/rating_bar.dart';
import '../../../athlete/presentation/athlete_screen.dart';
import '../../data/dto/federation_athletes_dto.dart';

class AthleteListTile extends StatelessWidget {
  final AthleteDto athlete;

  const AthleteListTile({super.key, required this.athlete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AthleteScreen.route, arguments: {
          'athlete': athlete,
        });
      },
      leading: SizedBox(width: 60.0, child: CachingImage(athlete.imagePath)),
      title: Text(
        athlete.name ?? '',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${athlete.position}",
          ),
          if (athlete.made != null)
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Text(
                  athlete.made!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.green, fontSize: 12.0),
                ),
              ),
            ),
          RatingBar(rating: athlete.rating ?? 0.0),
        ],
      ),
      // trailing: SizedBox(
      //   width: MediaQuery.of(context).size.width / 7,
      //   child: CachingImage(athlete.club),
      // ),
    );
  }
}
