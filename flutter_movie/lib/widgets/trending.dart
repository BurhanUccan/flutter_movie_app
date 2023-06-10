import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/text.dart';

import '../desc.dart';

class TrendingMovies extends StatelessWidget {
  final List trendings;
  const TrendingMovies({super.key, required this.trendings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "Trendler",
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: trendings.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: trendings[index]["title"],
                              description: trendings[index]["overview"],
                              bannerurl: "http://image.tmdb.org/t/p/w500" +
                                  trendings[index]["backdrop_path"],
                              posterurl: "http://image.tmdb.org/t/p/w500" +
                                  trendings[index]["poster_path"],
                              vote: trendings[index]["vote_average"].toString(),
                              lauch_on: trendings[index]["release_date"])));
                },
                child: Container(
                  width: 140,
                  child: Column(children: [
                    Hero(
                      tag: "http://image.tmdb.org/t/p/w500" +
                          trendings[index]["poster_path"],
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500" +
                                    trendings[index]["poster_path"]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: modified_text(
                        text: trendings[index]["title"] != null
                            ? trendings[index]["title"]
                            : "Loading",
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
