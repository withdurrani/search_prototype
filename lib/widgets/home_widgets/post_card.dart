import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../extensions/time_ago.dart';
import '../../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
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
      ),
    );
  }
}

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    if (post.assets != null && post.assets!.isNotEmpty) {
      imageUrl = post.assets?[0].url;
      if (post.assets![0].thumbnails != null &&
          post.assets![0].thumbnails!.isNotEmpty) {
        imageUrl = post.assets![0].thumbnails?[0].url;
      }
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Html(data: post.text!),
            imageUrl == null
                ? Container()
                : SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(imageUrl),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_up_alt_outlined)),
                      Text('${post.likesCount?.thumbUp ?? 0}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${post.postComments?.length ?? 0}'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chat_bubble_outline))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Leading extends StatelessWidget {
  final Post post;
  const Leading({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(post.userInfo?.photoUrl ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.userInfo?.displayName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                TimeAgo.getTimeAgo(post.publishAt!),
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }
}

class Trailing extends StatelessWidget {
  final Post post;

  const Trailing({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      ],
    );
  }
}
