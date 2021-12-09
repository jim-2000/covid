import 'package:covid/models/countryModel.dart';
import 'package:covid/screens/mapScreen.dart';
import 'package:covid/style/AppTheme.dart';
import 'package:covid/widgets/topCard.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Countries country;
  Details({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.country),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade400,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MapsScreen(
                l: country.countryInfo.lat,
                w: country.countryInfo.long,
                title: country.country,
              ),
            ),
          );
        },
        child: Icon(
          Icons.map,
        ),
      ),
      // backgroundColor: Colors.teal.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopCard(
              imgUrl: country.countryInfo.flag.toString(),
              title: country.country,
              continent: country.continent,
              died: country.deaths.toString(),
              population: country.population.toString(),
            ),
            Card(
              child: ListTile(
                title: Text("Total COVID-19 Cases "),
                leading: Icon(
                  Icons.coronavirus,
                  color: Colors.red,
                ),
                subtitle: Text(
                    "${country.cases.toString()} people faced this Problem"),
                trailing: Text(
                  country.cases.toString(),
                  style: APPtheme.darkTextTheme.bodyText1,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Todays Cases"),
                leading: Icon(
                  Icons.sick_outlined,
                  color: Colors.red,
                ),
                subtitle: country.todayCases == 0
                    ? Text(
                        "They Don't Update Today",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      )
                    : Text("This is Latest Updated Data"),
                trailing: Text(
                  country.todayCases.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Total Active COVID-19 Patients "),
                leading: Icon(
                  Icons.people,
                  color: Colors.red,
                ),
                subtitle: Text("They need to more Protective "),
                trailing: Text(
                  country.active.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Critical Cases"),
                leading: Icon(
                  Icons.personal_injury,
                  color: Colors.red,
                ),
                subtitle: Text(
                    "${country.critical.toString()} people are now on critical situation"),
                trailing: Text(
                  country.critical.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Total deaths in COVID-19 ",
                  style: TextStyle(fontSize: 18, color: Colors.red.shade400),
                ),
                leading: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                subtitle: Text(
                  "${country.deaths.toString()} People died still now",
                  style: TextStyle(color: Colors.red.shade300),
                ),
                trailing: Text(
                  country.deaths.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "TodayDeaths in COVID-19 ",
                  style: TextStyle(color: Colors.red.shade400),
                ),
                leading: Icon(
                  Icons.dangerous,
                  color: Colors.red,
                ),
                subtitle: country.todayDeaths != 0
                    ? Text(
                        "${country.todayDeaths.toString()} people faced this Problem",
                        style: TextStyle(
                            color: country.todayDeaths == 0
                                ? Colors.green
                                : Colors.red),
                      )
                    : Text(
                        "There is No one Died Today",
                        style: TextStyle(color: Colors.green),
                      ),
                trailing: Text(
                  country.todayDeaths.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    color: country.todayDeaths == 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Total recovered in COVID-19 ",
                  style:
                      TextStyle(fontSize: 18, color: Colors.lightBlue.shade400),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                subtitle: Text(
                  "${country.recovered.toString()} People People are recovered",
                  style: TextStyle(color: Colors.green.shade300),
                ),
                trailing: Text(
                  country.recovered.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Today recovered in COVID-19 ",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                leading: Icon(
                  Icons.pin,
                  color: Colors.green,
                ),
                subtitle: Text(
                  "${country.todayRecovered.toString()} People are now Well today",
                  style: TextStyle(color: Colors.green.shade300),
                ),
                trailing: Text(
                  country.todayRecovered.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Total Test",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                leading: Icon(
                  Icons.cabin,
                  color: Colors.green,
                ),
                subtitle: Text(
                  "${country.tests.toString()} People are Test COVID-19",
                  style: TextStyle(color: Colors.green.shade300),
                ),
                trailing: Text(
                  country.tests.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
