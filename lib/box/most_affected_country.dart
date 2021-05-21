import 'package:flutter/material.dart';

class MostAffectedCountry extends StatelessWidget {
  final List countryData;

  const MostAffectedCountry({Key key, this.countryData, Map countrydata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                countryData[index]['countryInfo']['flag'],
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(countryData[index]['country'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text(
                    "Deaths : ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    countryData[index]['deaths'].toString(),
                    style: TextStyle(color: Colors.red[300]),
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: 5,
    ));
  }
}
