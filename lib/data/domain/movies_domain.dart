
import 'package:my_app/data/movies/movies.dart';
import 'package:my_app/data/repository/movies_repository.dart';

class MoviesDomain {
  final MoviesRepository moviesRepository;
   
  MoviesDomain(this.moviesRepository);

  Future<Movies> getMoviesPopular() {
    return moviesRepository.getPopularMovies();
  }
}