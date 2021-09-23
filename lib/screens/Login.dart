import 'package:flutter/material.dart';
import 'package:wait4me/components/button.dart';
import 'package:wait4me/components/textfieldValidation.dart';
import 'package:wait4me/screens/ForgetPassword.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController Password = TextEditingController();

  FocusNode username = FocusNode();
  FocusNode password = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getDeviceheight(context, 1),
        width: getDevicewidth(context, 1),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: getDeviceheight(context, 0.2),
            ),
            Text(
              "WAIT4ME",
              style: TextStyle(
                  fontFamily: "Lato-Bold", fontSize: 30, color: Colors.white),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(
                    getDevicewidth(context, 0.05),
                    getDeviceheight(context, 0.05),
                    getDevicewidth(context, 0.05),
                    getDeviceheight(context, 0.05)),
                child: TextFormField(
                    focusNode: username,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: userName,
                    decoration: new InputDecoration(
                      // errorText: _userNameErrorValid ? (isEmpty(userName) ? "Email Required*" : "Email Not Valid") : null,
                      // errorStyle: TextStyle(color: Colors.red),

                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.white,
                            width: 1.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(0.0),
                        ),
                      ),
                      filled: false,
                      hintStyle: new TextStyle(
                          fontFamily: "Lato-Light",
                          fontSize: 16,
                          color: Colors.white),
                      hintText: "Email",
                      // fillColor: txtfield
                    ))),
            Container(
                padding: EdgeInsets.only(
                    left: getDevicewidth(context, 0.05),
                    right: getDevicewidth(context, 0.05),
                    bottom: getDeviceheight(context, 0.05)),
                child: TextFormField(
                    focusNode: password,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: Password,
                    decoration: new InputDecoration(
                      // errorText: _userNameErrorValid ? (isEmpty(userName) ? "Email Required*" : "Email Not Valid") : null,
                      // errorStyle: TextStyle(color: Colors.red),

                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.white,
                            width: 1.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(0.0),
                        ),
                      ),
                      filled: false,
                      hintStyle: new TextStyle(
                          fontFamily: "Lato-Light",
                          fontSize: 16,
                          color: Colors.white),
                      hintText: "Password",
                      // fillColor: txtfield
                    ))),
            Container(
                child: InkWell(
              child: Container(
                width: getDevicewidth(context, 1),
                padding: EdgeInsets.only(
                    right: getDevicewidth(context, 0.05),
                    bottom: getDeviceheight(context, 0.05)),
                child: Text(
                  "FORGET PASSWORD?",
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
                // Navigator.pushNamed(context, '/forgotpassword');
              },
            )),
            Container(
              padding: EdgeInsets.only(
                  left: getDevicewidth(context, 0.05),
                  right: getDevicewidth(context, 0.05),
                  bottom: getDeviceheight(context, 0.05)),
              child: CustomButtom("Login", getDevicewidth(context, 0.9),
                  getDeviceheight(context, 0.07), () {}),
            ),
            Container(
                child: InkWell(
              child: Container(
                width: getDevicewidth(context, 1),
                padding: EdgeInsets.only(
                    left: getDevicewidth(context, 0.05),
                    right: getDevicewidth(context, 0.05),
                    bottom: getDeviceheight(context, 0.05)),
                child: Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
//                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ForgetPassword()));
//              Navigator.pushNamed(context, '/forgotpassword');
              },
            )),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
