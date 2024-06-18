import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/coaches/coaches/data/dto/federation_coaches.dart';

import '../../../../../widgets/caching_image.dart';
import '../../../../../widgets/rating_bar.dart';
import '../../../coach/presentation/coach_screen.dart';

class CoachListTile extends StatelessWidget {
  final CoachDto coach;

  const CoachListTile({super.key, required this.coach});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, CoachScreen.route, arguments: {
          'coach': coach,
        });
      },
      leading: SizedBox(
        width: 50.0,
        child: CachingImage(
          coach.imagePath ?? '',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        coach.name ?? '',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   coach.position != null
          //       ? "${coach.sportType.toUpperCase()} • ${coach.position}"
          //       : coach.sportType.toUpperCase(),
          // ),
          if (coach.made != null)
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
                  coach.made?.toUpperCase() ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.green, fontSize: 12.0),
                ),
              ),
            ),
          RatingBar(rating: coach.rating ?? 0.0),
        ],
      ),
      // trailing: coach.workedAt != null
      //     ? SizedBox(
      //         width: MediaQuery.of(context).size.width / 7,
      //         child: CachingImage(coach.job),
      //       )
      //     : null,
    );
  }
}
