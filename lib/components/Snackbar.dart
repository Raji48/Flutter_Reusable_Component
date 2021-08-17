import 'package:flutter/material.dart';

class Showbar{
  static  displaySnackBar(String message, String actionMessage,VoidCallback onClick,BuildContext context) {
    return SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        action: (actionMessage != null)
            ? SnackBarAction(
          textColor: Colors.white,
          label: actionMessage,
          onPressed: () {
            return onClick();
          },
        )
            : null,
        duration: Duration(seconds: 2),
        backgroundColor:Colors.blue
    );
  }
}