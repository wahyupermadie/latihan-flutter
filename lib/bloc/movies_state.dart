import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/movies/movies.dart';

abstract class MoviesState extends Equatable{
  const MoviesState();

  
}

class MoviesFetchLoading extends MoviesState {
  @override
  List<Object> get props => [];
  
}

class MoviesFetchSuccess extends MoviesState {
  final Movies movies;

  const MoviesFetchSuccess({this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesFetchError extends MoviesState {
  final String error;

  const MoviesFetchError({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}