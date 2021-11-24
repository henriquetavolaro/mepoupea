
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'di/injection_module.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  AppWidget(),
    );
  }
}
