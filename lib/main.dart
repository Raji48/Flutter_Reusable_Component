
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/components/dialogbox.dart';
import 'package:reusable_components/components/textfield.dart';
import 'package:reusable_components/components/textfield_validation.dart';


final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 // MyHomePage({Key? key, ) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _userNameErrorValid = false;
  bool _userNameValid=false;
  FocusNode emailField = FocusNode();
  String userName = '';
  FocusNode usernameField = FocusNode();
  FocusNode passwordField = FocusNode();
  FocusNode confirmPasswordField = FocusNode();
  FocusNode phoneField = FocusNode();
  var emailcontroller= TextEditingController();
  var namecontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var phonecontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formkey,
          child: Column(
              children: [
                SizedBox(height: 80,),
                // FloatingTextField
                //  CustomTextfield("label name", "",false, Colors.orange, Colors.green),
                SizedBox(height: 20,),

               //  //FloatingTextField with validator
               //  MyTextFormField(emailcontroller,"email","input Text",emailField,usernameField,null,false,true,false,validateEmail, "EmailRequired", "Email not valid",),
               //  SizedBox(height: 20,),
               //  MyTextFormField(namecontroller,"name","",usernameField,phoneField,[WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false,false,false,validatename,"NameRequired", "",),
               //  SizedBox(height: 20,),
               // MyTextFormField(phonecontroller,"phone","",phoneField,passwordField,[FilteringTextInputFormatter.digitsOnly],false,false,true,validateNumber,"phoneRequired", "Phone number not valid",),
               //  SizedBox(height: 20,),
               // MyTextFormField(passwordcontroller,"password","",passwordField,confirmPasswordField,null,true,false,false,validatePassword,"PasswordRequired","Password Not Valid" ,),
               //  SizedBox(height: 20,),
             //   MyTextFormField("password","",confirmPasswordField,null,null,true,false,false,validateConPassword,"Reenter Password","Password Not Match" ,),

                SizedBox(height: 20,),
                // TextfieldValidation("email", "email", false, Colors.orangeAccent, Colors.black,formkey ),
                SizedBox(height: 20,),
                 //  TextfieldValidation("name", "", false, Colors.orangeAccent, Colors.black,formkey ),
                // check alermessage dialog box
               Center(
                 child: MaterialButton(
                   color: Colors.blueGrey,
                   onPressed: () {
                    // print(emailcontroller.text);
                    // print(namecontroller.text);
                    // print(passwordcontroller.text);
                    //     print(phonecontroller.text);

                    Future.delayed(const Duration(milliseconds: 10), () {
                      BaseAlertDialog.dialogbox(
                          Icons.logout, "Logout", "Are you sure want to logout",
                          context, () => check());
                    });
                  },
                    child: Text("alertbox"),
                  ),
               ),
              ]
          ),
        ));
  }

  check() {
    Navigator.of(context).pop(false);
    print("its work");
    print(emailValue);
    print(name);
  }

  }