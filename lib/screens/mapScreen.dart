import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

//
class MapsScreen extends StatefulWidget {
  double l;
  double w;
  String title;
  MapsScreen({Key? key, required this.l, required this.w, required this.title})
      : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  //

  //f
  // final double l = 30;
  // final double w = 66;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(widget.l, widget.w),
                    zoom: 5.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    //
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 10.0,
                          height: 80.0,
                          point: LatLng(widget.l, widget.w),
                          builder: (ctx) => Container(
                            child:
                                Icon(Icons.place, color: Colors.red, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
