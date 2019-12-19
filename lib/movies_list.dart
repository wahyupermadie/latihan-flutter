import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/movies_event.dart';
import 'package:my_app/bloc/movies_state.dart';
import 'package:my_app/route/routing_const.dart';
import 'bloc/movies_bloc.dart';
import 'data/domain/movies_domain.dart';
import 'data/movies/movies.dart';
import 'data/repository/movies_repository.dart';

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
                return Center(
                  child: CircularProgressIndicator(),
                );
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
      onTap: () => Navigator.pushNamed(context, DetailMovies, arguments: movies.results[index])
                  ,
      title: new Text(movies.results[index].originalTitle.toString()),
      subtitle: new Text(movies.results[index].overview.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        softWrap: true,),
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