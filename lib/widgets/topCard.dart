import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TopCard extends StatelessWidget {
  TopCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.continent,
    required this.died,
    required this.population,
  }) : super(key: key);
  String imgUrl;
  String title;
  String continent;
  String population;
  String died;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: new Card(
        child: new Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 26,
                    letterSpacing: 9,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "${continent.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 9,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "$population People Live in $title",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 3,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "$died",
                  style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 2,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "  People Died in $title during COVID-19",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ],
          ),
          // Text("country.cases.toString()"),

          decoration: new BoxDecoration(
            color: Colors.white60,
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.dstATop,
              ),
              image: new NetworkImage(
                imgUrl,
                scale: 0.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
