
import 'package:flutter/material.dart';

import '../../../gym/presentation/gym_screen.dart';
import '../../data/dto/gyms_dto.dart';

class GymListItem extends StatelessWidget {
  final GymDto gym;

  const GymListItem({super.key, required this.gym});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, GymScreen.route, arguments: {'gym': gym});
      },
      shape: const LinearBorder(
        side: BorderSide(color: Colors.grey),
        bottom: LinearBorderEdge(),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          gym.name ?? '',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
            fontSize: 18.0,
          ),
        ),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              gym.location ?? '',
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (final phone in gym.tel ?? [])
                  Text(
                    phone,
                    style: theme.textTheme.bodySmall,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
