
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wait4me/screens/Register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return MaterialPageRoute(builder: (context) => Register());

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => Register());
    }
    }
    }