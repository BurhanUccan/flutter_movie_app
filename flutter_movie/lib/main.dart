import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/text.dart';
import 'package:flutter_movie/widgets/toprated.dart';
import 'package:flutter_movie/widgets/trending.dart';
import 'package:flutter_movie/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.green));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = "e3db0dddde69d163b43af2007864cd6d";
  final readAccesToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlM2RiMGRkZGRlNjlkMTYzYjQzYWYyMDA3ODY0Y2Q2ZCIsInN1YiI6IjY0NzZmMjEyMDA1MDhhMDEzM2VjYjQ2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oxkCwT5eTtk1vPWWlPgPnNb9JwfQDmXcdvP4VinTFkY";
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccesToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult["results"];
      topRatedMovies = topRatedResult["results"];
      tv = tvResult["results"];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(
          text: "Movie App",
          color: Colors.white,
          size: 20,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TopRated(
            topRated: topRatedMovies,
          ),
          TrendingMovies(
            trendings: trendingMovies,
          ),
          TV(TvList: tv)
        ],
      ),
    );
  }
}
