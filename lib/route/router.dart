
import 'package:flutter/material.dart';
import 'package:my_app/route/routing_const.dart';

import '../main.dart';
import '../movies_detail.dart';
import '../movies_list.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AuthMovies:
        return MaterialPageRoute(builder: (_) => MyApp());
      case ListMovies:
        return MaterialPageRoute(builder: (_) => SecondApp());
      case DetailMovies:
        var data = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => MoviesDetail(result: data,));
      default:
        return MaterialPageRoute(builder: (_) => MyApp());
    }
  }
}

