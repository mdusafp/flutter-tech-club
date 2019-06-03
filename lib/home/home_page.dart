import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tech_club/posts/post.dart';
import 'package:tech_club/posts/posts_page.dart';
import 'package:tech_club/routes.dart';
import 'package:tech_club/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: BaseTheme.theme,
      routes: Router.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  List<Post> _posts;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 3);
    _posts = [];
    getData().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<List<Post>> getData() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts', headers: {
      'Accept': 'application/json',
    });

    final body = json.decode(response.body);
    return List.generate(body.length, (index) {
      return Post.fromJson(body[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          PostsPage(_posts),
          Container(child: Text('Wallet')),
          Container(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.account_balance_wallet),
          ),
          Tab(
            icon: Icon(Icons.people),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
