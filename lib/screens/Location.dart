
import 'package:flutter/material.dart';
import 'package:wait4me/screens/drawer.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(6, 109, 214, 1), Color.fromRGBO(173, 221, 225, 1)],begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(
          "FORGET PASSWORD",
          style: TextStyle(
            fontFamily: 'Lato-Bold',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: DrawerSlide(),
    );
  }
}
