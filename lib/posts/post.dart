class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post(this.id, this.userId, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      json['id'],
      json['userId'],
      json['title'],
      json['body'],
    );
  }
}
