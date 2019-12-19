
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:my_app/data/movies/movies.dart';

import '../../constants.dart';

class MoviesRepository {
  Dio dio = Dio();
  Alice alice;
  Future<Movies> getPopularMovies() async {
    alice = Alice(showNotification: true, showInspectorOnShake: true, darkTheme: true);
    try {
      final response = await dio.get("${baseUrl}movie/popular?api_key=${apiKey}");
      return Movies.fromJson(response.data);
    } catch (e) {
      return e;
    }
  }
}