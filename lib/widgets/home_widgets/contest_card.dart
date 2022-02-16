import 'package:flutter/material.dart';
import 'package:search_prototype/widgets/home_widgets/post_card.dart';

import '../../models/post.dart';

class ContestCard extends StatelessWidget {
  final Post post;
  const ContestCard({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Leading(post: post),
            Trailing(post: post),
          ],
        ),
        const SizedBox(height: 8),
        PostDetails(post: post),
      ],
    );
  }
}
