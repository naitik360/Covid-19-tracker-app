import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class WorldWideBox extends StatelessWidget {
  final Map worldData;

  WorldWideBox({Key key, this.worldData}) : super(key: key);

  //final  double k = worldData['cases'];
  Map<String, double> dataMap = {
    "Flutter": 4,
    "React": 3,
    "Xamarin": 1,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2),
            children: [
              StatusBox(
                title: 'Confirmed',
                boxcolor: Colors.red[100],
                textcolor: Colors.red,
                count: worldData['cases'].toString(),
              ),
              StatusBox(
                title: 'Active',
                boxcolor: Colors.blue[100],
                textcolor: Colors.blue,
                count: worldData['active'].toString(),
              ),
              StatusBox(
                title: 'Recovered',
                boxcolor: Colors.green[100],
                textcolor: Colors.green,
                count: worldData['recovered'].toString(),
              ),
              StatusBox(
                title: 'Deaths',
                boxcolor: Colors.pink[100],
                textcolor: Colors.pink,
                count: worldData['deaths'].toString(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(15),
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 75,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            //  colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 34,
            centerText: "HYBRID",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class StatusBox extends StatelessWidget {
  final Color boxcolor;
  final Color textcolor;
  final String title;
  final String count;

  const StatusBox(
      {Key key, this.boxcolor, this.textcolor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double phWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: boxcolor, width: 3.0),
        color: boxcolor,
      ),
      width: phWidth / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
