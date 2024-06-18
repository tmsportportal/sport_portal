import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_portal/src/widgets/rating_bar.dart';

import '../features/comments/model/comment_Model.dart';
import '../utils/date_time_parser.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: ClipOval(
                      child: ColoredBox(
                        color: Color(0xFFEEEEEE),
                        child: Icon(
                          CupertinoIcons.person,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.user,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar(rating: comment.rating),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    DateTimeParser.parseDate(comment.date, '/'),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Text(comment.comment)
            ],
          ),
        ),
      ),
    );
  }
}
