
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:wait4me/screens/ForgetPassword.dart';
import 'package:wait4me/screens/Location.dart';
import 'package:wait4me/screens/Login.dart';
import 'package:wait4me/screens/Register.dart';
import 'package:wait4me/screens/SplashScreen.dart';
=======
import 'package:wait4me/screens/register.dart';
import 'package:wait4me/screens/roleselect.dart';
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return MaterialPageRoute(builder: (context) => Register());
<<<<<<< HEAD
      case '/splashscreen':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());
      case '/forgetpassword':
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case '/location':
        return MaterialPageRoute(builder: (context) => Location());
=======
      case '/roleselect':
        return MaterialPageRoute(builder: (context) => RoleSelect());
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => Register());
    }
    }
    }