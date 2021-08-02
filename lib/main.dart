import 'package:flutter/material.dart';
import 'package:uvs_app/home_page/home_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UvsApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePageWidget(),
    );
  }
}
