import 'package:flutter/material.dart';
import 'package:my_app/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/movies_bloc.dart';
import 'package:my_app/bloc/movies_state.dart';
import 'package:my_app/bloc/movies_event.dart';
import 'package:my_app/data/domain/movies_domain.dart';
import 'package:my_app/data/repository/movies_repository.dart';

import 'data/movies/movies.dart';

void main(){
  runApp(
    new MaterialApp(
      home: SecondApp(),
    )
  );
}

class SecondApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<SecondApp> {
  MoviesBloc _moviesBloc;
  MoviesDomain _moviesDomain;
  @override
  void initState() {
    super.initState();
    _moviesDomain = new MoviesDomain(MoviesRepository());
    _moviesBloc = new MoviesBloc(moviesDomain: _moviesDomain);
  }

    @override
  void dispose() {
    _moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _moviesBloc.add(MoviesFetching());
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Movies List"),
      ),
      body: BlocProvider(
        create: (BuildContext context){
          return _moviesBloc;
        },
        child: BlocListener<MoviesBloc, MoviesState>(
          bloc: _moviesBloc,
          listener: (context, state){
            if (state is MoviesFetchError) {
              print(state.error.toString());
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: new BlocBuilder<MoviesBloc, MoviesState>(
            bloc: _moviesBloc,
            builder: (BuildContext context, MoviesState state){
              if (state is MoviesFetchSuccess) {
                return _MoviesList(movies: state.movies,);
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _MoviesList extends StatelessWidget {
  final Movies movies;

  _MoviesList({this.movies});
  
  ListTile _listTile(BuildContext context, int index) {
    return ListTile(
      title: new Text(movies.results[index].originalTitle.toString()),
      subtitle: new Text(movies.results[index].overview.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: movies.results.length,
      itemBuilder: _listTile,
    );
  }
}