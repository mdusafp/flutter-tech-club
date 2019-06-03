import 'package:flutter/material.dart';
import 'package:tech_club/posts/details/posts_details_page.dart';
import 'package:tech_club/posts/post.dart';

class PostList extends StatelessWidget {
  PostList(this.items);

  final List<Post> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: _buildItem,
      separatorBuilder: _buildSeparator,
    );
  }

  Widget _buildSeparator(context, index) {
    return Divider();
  }

  Widget _buildItem(context, index) {
    return ListTile(
      title: Text(items[index].title),
      trailing: IconButton(
        icon: Icon(Icons.open_in_new),
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) {
            return PostsDetailsPage(items[index]);
          });
          Navigator.of(context).push(route);
        },
      ),
    );
  }
}
