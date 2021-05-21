import 'dart:convert';
import 'package:coronavirus_tracker_app_naitik_verma/Pages/countrypage.dart';
import 'package:coronavirus_tracker_app_naitik_verma/box/infobox.dart';
import 'package:coronavirus_tracker_app_naitik_verma/box/most_affected_country.dart';
import 'package:coronavirus_tracker_app_naitik_verma/box/worlswidebox.dart';
import 'package:coronavirus_tracker_app_naitik_verma/data_source.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http; // we have just named the package

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;

  fetchCountryWideData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // when first time app will be run  this will be  called which in turn will call the upper function
    fetchWorldWideData();
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Covid Tracker'),
      ),
      body: SingleChildScrollView(
        // column itself is not scroable to make it scroable  wrapped with singlchildscrollview  or also listview
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 100,
              child: Text(
                DataSource.line,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WORLD WIDE BOX',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primaryBlack,
                      ),
                      child: Text(
                        'REGIONAL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWideBox(
                    worldData: worldData,
                  ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most affected countries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            SizedBox(height: 10),
            countryData == null
                ? Container()
                : MostAffectedCountry(
                    countryData: countryData,
                  ),
            InfoBox(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'WE ARE TOGETHER IN THE FIGHT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
