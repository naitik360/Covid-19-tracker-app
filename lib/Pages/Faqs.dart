import 'package:coronavirus_tracker_app_naitik_verma/data_source.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      backgroundColor: Colors.blue[100],
      body: ListView.builder(
          itemCount: DataSource.quesstionanswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.quesstionanswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(DataSource.quesstionanswers[index]['answer']),
                )
              ],
            );
          }),
    );
  }
}
