
import 'package:dio/dio.dart';
import 'package:my_app/data/movies/movies.dart';

import '../../constants.dart';

class MoviesRepository {
  Dio dio = Dio();
  Future<Movies> getPopularMovies() async {
    try {
      final response = await dio.get("${baseUrl}movie/popular?api_key=${apiKey}");
      return Movies.fromJson(response.data);
    } catch (e) {
      return e;
    }
  }
}