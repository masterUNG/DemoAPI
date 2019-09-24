import 'package:demoapi/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReadAllData extends StatefulWidget {
  @override
  _ReadAllDataState createState() => _ReadAllDataState();
}

class _ReadAllDataState extends State<ReadAllData> {
  // Explicit
  String urlString = 'https://jsonplaceholder.typicode.com/photos';
  List<ImageModel> imageModels = [];

  // Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    var response = await http.get(urlString);
    // print('response = ${response.toString()}');

    var result = json.decode(response.body);
    // print('retsult = $result');

    for (var myMap in result) {
      ImageModel imageModel = ImageModel.FromJSON(myMap);
      String urlPath = imageModel.url;
      print('url = $urlPath');

      setState(() {
        imageModels.add(imageModel);
      });
    }
  }

  Widget showText(int index) {
    return Container(
      // color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'id = ${imageModels[index].id}',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          Text(imageModels[index].title),
        ],
      ),
    );
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.network(imageModels[index].url),
    );
  }

  Widget pleaseWait() {
    return Center(
      child: Text('Please Wait'),
    );
  }

  Widget showListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            showImage(index),
            showText(index),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read All Data'),
      ),
      body: imageModels.length != 0 ? showListView() : pleaseWait(),
    );
  }
}
