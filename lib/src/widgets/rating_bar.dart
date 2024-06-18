import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final MainAxisAlignment mainAxisAlignment;

  const RatingBar(
      {super.key,
      required this.rating,
      this.size = 15.0,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        for (int i = 1; i < 6; i++)
          Flexible(
            child: Icon(
              rating >= i ? CupertinoIcons.star_fill : CupertinoIcons.star,
              color: rating >= i ? Colors.amber : Colors.grey,
              size: size,
            ),
          ),
      ],
    );
  }
}
