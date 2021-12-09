import 'dart:convert';

import 'package:covid/models/countryModel.dart';
import 'package:covid/screens/details.dart';
import 'package:covid/screens/developer.dart';
import 'package:covid/screens/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3));
    loadData();
    // TODO: implement initState
    super.initState();
  }

  loadData() async {
    final file =
        await get(Uri.parse("https://disease.sh/v3/covid-19/countries/"));
    var decoded = jsonDecode(file.body);
    Country.country = List.from(decoded)
        .map<Countries>((country) => Countries.fromJson(country))
        .toList();
    //     List.from(decoded).map<Item>((item) => Item.fromJson(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/transparent.png"), context);

    /*
    
    
    */
    return Scaffold(
      // backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        elevation: 0.2,
        // backgroundColor: Colors.teal.shade600,
        // leading: Icon(
        //   Icons.coronavirus,
        //   color: Colors.red,
        // ),
        leading: Image(image: AssetImage("assets/images/transparent.png")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => News()));
            },
            icon: Icon(
              Icons.article,
              color: Colors.orange,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Developer()));
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
          )
        ],
        centerTitle: true,
        title: Text("COVID-TRACKER"),
        // title: Text("Coronavirus diseaseBangladesh"),
      ),
      body: Container(
        child: Country.country.length != null && Country.country.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, indext) {
                  final cunt = Country.country[indext];
                  final percent = cunt.active * 0.01;
                  return Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Details(country: cunt)));
                      },
                      child: Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(cunt.countryInfo.flag.toString()),
                          ),
                          title: Text(cunt.country),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.masks_rounded,
                                color: Colors.grey,
                              ),
                              Text("Total Cases:" +
                                  "${cunt.updated.toString()}"),
                            ],
                          ),
                          trailing: Icon(Icons.drag_indicator_rounded),
                        ),
                      ),
                    );
                  });
                },
                itemCount: Country.country.length,
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              ),
      ),
    );
  }
}
