import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tech_club/posts/post.dart';

class PostsDetailsPage extends StatefulWidget {
  PostsDetailsPage(this.item);

  final Post item;

  @override
  _PostsDetailsPageState createState() => _PostsDetailsPageState();
}

class _PostsDetailsPageState extends State<PostsDetailsPage> {
  Random _random = Random();
  Color _color = Colors.blueGrey;

  void _changeColor() {
    setState(() {
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.id.toString()),
        ),
        body: AnimatedContainer(
          color: _color,
          duration: Duration(milliseconds: 500),
          child: Column(
            children: <Widget>[
              Text(widget.item.title),
              Text(widget.item.body),
              MaterialButton(
                child: Text('Change color'),
                onPressed: _changeColor,
              ),
            ],
          ),
        ));
  }
}
