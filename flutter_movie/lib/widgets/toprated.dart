import 'package:flutter/material.dart';
import 'package:flutter_movie/desc.dart';
import 'package:flutter_movie/utils/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "En Beğenilenler",
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
            itemCount: topRated.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: topRated[index]["title"],
                              description: topRated[index]["overview"],
                              bannerurl: "http://image.tmdb.org/t/p/w500" +
                                  topRated[index]["backdrop_path"],
                              posterurl: "http://image.tmdb.org/t/p/w500" +
                                  topRated[index]["poster_path"],
                              vote: topRated[index]["vote_average"].toString(),
                              lauch_on: topRated[index]["release_date"])));
                },
                child: Container(
                  width: 140,
                  child: Column(children: [
                    Hero(
                      tag: "http://image.tmdb.org/t/p/w500" +
                          topRated[index]["poster_path"],
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500" +
                                    topRated[index]["poster_path"]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: modified_text(
                        text: topRated[index]["title"] != null
                            ? topRated[index]["title"]
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
