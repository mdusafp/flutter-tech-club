import 'package:flutter/material.dart';
import 'package:tech_club/posts/post.dart';
import 'package:tech_club/posts/post_lists.dart';

class PostsPage extends StatefulWidget {
  PostsPage(this.items);

  final List<Post> items;

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return PostList(widget.items);
  }
}
