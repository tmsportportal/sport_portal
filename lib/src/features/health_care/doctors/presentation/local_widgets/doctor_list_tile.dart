import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/health_care/doctors/data/dto/health_care_dto.dart';
import 'package:sport_portal/src/widgets/caching_image.dart';

import '../../../../../widgets/rating_bar.dart';
import '../../../doctor/presentation/doctor_screen.dart';

class DoctorListTile extends StatelessWidget {
  final Employee doctor;

  const DoctorListTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DoctorScreen.route, arguments: {
          'doctor': doctor,
        });
      },
      leading: SizedBox(
        width: 50.0,
        child: CachingImage(
          doctor.imagePath,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        doctor.name ?? '',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (doctor.workAt != null)
            Text(
              "${doctor.workAt?.toUpperCase()}",
            ),
          RatingBar(rating: doctor.rating ?? 0.0),
        ],
      ),
      // trailing: doctor.clubLogo != null
      //     ? SizedBox(
      //         width: MediaQuery.of(context).size.width / 7,
      //         child: CachingImage(doctor.clubLogo),
      //       )
      //     : null,
    );
  }
}
