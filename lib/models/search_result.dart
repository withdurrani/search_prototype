import 'package:search_prototype/models/post.dart';

class SearchResult {
  final List<Post> posts;

  SearchResult({required this.posts});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final List posts = json['posts'] as List;

    return SearchResult(
      posts: posts.map<Post>((post) => Post.fromJson(post)).toList(),
    );
  }
}
