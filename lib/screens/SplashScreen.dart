
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child:Text("WAIT4ME",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
