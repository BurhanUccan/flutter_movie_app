import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/text.dart';

import '../desc.dart';

class TV extends StatelessWidget {
  final List TvList;
  const TV({super.key, required this.TvList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "Beğeneceğin Diziler",
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
            itemCount: TvList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: TvList[index]["title"],
                              description: TvList[index]["overview"],
                              bannerurl: "http://image.tmdb.org/t/p/w500" +
                                  TvList[index]["backdrop_path"],
                              posterurl: "http://image.tmdb.org/t/p/w500" +
                                  TvList[index]["poster_path"],
                              vote: TvList[index]["vote_average"].toString(),
                              lauch_on: TvList[index]["release_date"])));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 250,
                  child: Column(children: [
                    Hero(
                      tag: "http://image.tmdb.org/t/p/w500" +
                          TvList[index]["poster_path"],
                      child: Container(
                        width: 250,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500" +
                                    TvList[index]["poster_path"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: modified_text(
                        text: TvList[index]["original_name"] != null
                            ? TvList[index]["original_name"]
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
