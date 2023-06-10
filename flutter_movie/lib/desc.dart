import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, lauch_on;
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.lauch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.width * .8,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          bannerurl,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.1),
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                )),
                Positioned(
                  bottom: 10,
                  left: 5,
                  child: modified_text(
                    text: "Average Rating - " + vote,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: modified_text(
              text: name != null ? name : "Yüklenemedi",
              size: 24,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text(
              text: "Çıkış Tarihi - " + lauch_on,
              size: 12,
              color: Colors.white.withOpacity(.6),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Hero(
                  tag: posterurl,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl),
                  ),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: modified_text(
                    text: description,
                    size: 16,
                    color: Colors.white.withOpacity(.6),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
