import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_app/bloc/movies_event.dart';
import 'package:my_app/bloc/movies_state.dart';
import 'package:my_app/data/domain/movies_domain.dart';
import 'package:my_app/data/movies/movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>{
  final MoviesDomain moviesDomain;

  MoviesBloc({
    @required this.moviesDomain
  }) : assert(moviesDomain != null);
  
  @override
  MoviesState get initialState => MoviesFetchLoading();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if(event is MoviesFetching) {
      yield MoviesFetchLoading();
      try {
        Movies movies = await moviesDomain.getMoviesPopular();
        yield MoviesFetchSuccess(movies: movies);
      } catch (e) {
        yield MoviesFetchError(error: e.toString());
      }
    }
  }
}