import 'package:demoapi/screens/read_all_data.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReadAllData(),
    );
  }
}
