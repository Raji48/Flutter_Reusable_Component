import 'package:flutter/material.dart';
import 'package:wait4me/components/button.dart';
import 'package:wait4me/res/colors.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 109, 214, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
      body: Container(
        width: getDevicewidth(context, 1),
        height: getDeviceheight(context, 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(6, 109, 214, 1),
                const Color.fromRGBO(173, 221, 225, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [0.0, 1.0],
              tileMode: TileMode.repeated),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: getDeviceheight(context, 0.1),
            ),
            Container(
                height: getDeviceheight(context, 0.25),
                padding: EdgeInsets.only(
                    left: getDevicewidth(context, 0.2),
                    right: getDevicewidth(context, 0.2)),
                child: Image(
                    image: AssetImage("assets/images/forgetpasswordbg.png"))),
            Container(
              padding: EdgeInsets.only(
                  left: getDevicewidth(context, 0.05),
                  top: getDeviceheight(context, 0.05),
                  right: getDevicewidth(context, 0.05),
                  bottom: getDeviceheight(context, 0.02)),
              child: Text(
                "We'll send you an email to reset your password",
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: getDevicewidth(context, 0.05),
                    right: getDevicewidth(context, 0.05),
                    bottom: getDeviceheight(context, 0.05)),
                child: TextFormField(
                    // focusNode: password,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: email,
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
                        filled: true,
                        hintStyle: new TextStyle(
                            fontFamily: "Lato-Regular",
                            fontSize: 16,
                            color: Color.fromRGBO(144, 157, 167, 1)),
                        hintText: "Enter Email Address",
                        fillColor: white))),
            Container(
              color: Colors.transparent,
              child: CustomButtom("SEND", getDevicewidth(context, 0.4),
                  getDeviceheight(context, 0.07), () {}),
            )
          ],
        ),
      ),
    );
  }
}
