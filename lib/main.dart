import 'package:demoapi/screens/my_service.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyService(),
    );
  }
}
