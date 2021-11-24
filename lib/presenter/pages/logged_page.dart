import 'package:flutter/material.dart';

class Logged extends StatefulWidget {
  const Logged({Key? key}) : super(key: key);

  @override
  _LoggedState createState() => _LoggedState();
}

class _LoggedState extends State<Logged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Logged"),),
    );
  }
}
