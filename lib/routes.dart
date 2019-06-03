import 'package:flutter/material.dart';
import 'package:tech_club/home/home_page.dart';

class Router {
  static Map<String, WidgetBuilder> _routes = {
    '/': (BuildContext context) => MyHomePage(title: 'Title'),
    '/balance': (BuildContext context) => Container(child: Text('Balance')),
    '/profile': (BuildContext context) => Container(child: Text('Profile')),
  };

  static get routes => _routes;
}
