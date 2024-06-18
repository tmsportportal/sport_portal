import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isFav;
  final VoidCallback onPressed;

  const LikeButton({super.key, required this.isFav, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.redAccent,
      isSelected: isFav,
      icon: const Icon(Icons.favorite_border_rounded),
      selectedIcon: const Icon(Icons.favorite_rounded),
    );
  }
}
