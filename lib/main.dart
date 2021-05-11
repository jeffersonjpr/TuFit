import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tufit/widgets/checkauth.dart';
import 'config.dart';

void main() async {
  await initConfiguration();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckAuth(),
    );
  }
}
