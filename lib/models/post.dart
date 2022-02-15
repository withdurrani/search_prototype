class Post {
  final String id;

  Post({
    required this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
    );
  }
}
