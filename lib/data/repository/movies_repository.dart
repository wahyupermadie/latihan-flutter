
import 'dart:convert';
import 'package:alice/alice.dart';
import 'package:my_app/data/movies/movies.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';

class MoviesRepository {
  Alice alice;
  Future<Movies> getPopularMovies() async {
    alice = Alice(showNotification: true, showInspectorOnShake: true, darkTheme: true);
    try {
      final response = await http.get("${baseUrl}movie/popular?api_key=${apiKey}");
      alice.onHttpResponse(response);
      return Movies.fromJson(json.decode(response.body));
    } catch (e) {
      return e;
    }
  }
}