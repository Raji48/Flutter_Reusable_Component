
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
        children: [
        GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
            child:SafeArea(
              child: SingleChildScrollView(

              ),
            )



        )
    ])
    );
  }
}
