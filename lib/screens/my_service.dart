import 'package:demoapi/screens/post_data.dart';
import 'package:demoapi/screens/read_all_data.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  Widget currentWidget = ReadAllData();

  // Method

  Widget myDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.yellow),
      child: Center(
        child: Text('Welcome DemoAPI'),
      ),
    );
  }

  Widget menuGetAllData() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Get All Data'),
      subtitle: Text('This Page Show Read All Data'),
      onTap: () {
        setState(() {
          currentWidget = ReadAllData();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuPostData() {
    return ListTile(
      leading: Icon(Icons.touch_app),
      title: Text('Post Data'),
      subtitle: Text('This Page Show Result from Post Data'),
      onTap: (){
        setState(() {
          currentWidget = PostData();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myDrawerHeader(),
          menuGetAllData(),
          menuPostData(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: currentWidget,
      drawer: myDrawer(),
    );
  }
}
