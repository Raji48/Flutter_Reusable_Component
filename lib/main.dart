import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
//import 'package:twitter_login_example/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                child: Text('login'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 48)),
                ),
                onPressed: () async {
                  await login();
                 // await signInWithTwitter();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future login() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: 'eA71Q6zMCA923p3TCueR3yij5',

      /// Consumer API Secret keys
      apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'https://twitterlogin-73c8f.firebaseapp.com/__/auth/handler',
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
      // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
      // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
      // error
        print('====== Login error ======');
        break;
    }
  }
}











// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:reusable_components/components/Button.dart';
// import 'package:reusable_components/components/Snackbar.dart';
// import 'package:reusable_components/components/Snackbar.dart';
// import 'package:reusable_components/components/dialogbox.dart';
// import 'package:reusable_components/components/dropdown.dart';
// import 'package:reusable_components/components/textfield.dart';
// import 'package:reusable_components/components/textfield_validation.dart';
//
// final navigatorKey = GlobalKey<NavigatorState>();
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//  // MyHomePage({Key? key, ) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   bool _userNameErrorValid = false;
//   bool _userNameValid=false;
//   FocusNode emailField = FocusNode();
//   String userName = '';
//   FocusNode usernameField = FocusNode();
//   FocusNode passwordField = FocusNode();
//   FocusNode confirmPasswordField = FocusNode();
//   FocusNode phoneField = FocusNode();
//   FocusNode dateField = FocusNode();
//   var emailcontroller= TextEditingController();
//   var namecontroller= TextEditingController();
//   var passwordcontroller= TextEditingController();
//   var phonecontroller= TextEditingController();
//   var datecontroller= TextEditingController();
//   var _confirmpassword = TextEditingController();
//   FocusNode cpasswordfield = FocusNode();
//   bool showPassword1 = true;
//
//   List<String> listitem = [
//     '4 seats', '5 seats', '6 seats', '7 seats', '8 seats'
//   ];
//   String seatschoose='';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: formkey,
//           child: Column(
//               children: [
//                 SizedBox(height: 180,),
//                 // FloatingTextField
//                 //  CustomTextfield("label name", "",false, Colors.orange, Colors.green),
//                 SizedBox(height: 20,),
//
//                // FloatingTextField with validator
//                //  MyTextFormField(emailcontroller,"email","input Text",emailField,usernameField,null,false,null,true,false, "EmailRequired", "Email not valid",null,false, RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")),
//                //  SizedBox(height: 20,),
//                //  MyTextFormField(namecontroller,"name","",usernameField,phoneField,[WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false,validatename,false,false,"NameRequired", "",null,false,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*")),
//                //  SizedBox(height: 20,),
//                // MyTextFormField(phonecontroller,"phone","",phoneField,passwordField,[FilteringTextInputFormatter.digitsOnly],false,null,false,true,"phoneRequired", "Phone number not valid",null,false,RegExp(r"^\d{10}$")),
//                //  SizedBox(height: 20,),
//           //     MyTextFormField(passwordcontroller,"password","",passwordField,cpasswordfield,null,true,null,false,false,"PasswordRequired","Password Not Valid" ,null,false,RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')),
//              //   SizedBox(height: 20,),
//                // MyTextFormField("password","",confirmPasswordField,null,null,true,false,false,validateConPassword,"Reenter Password","Password Not Match" ,),
//              //   SizedBox(height: 20,),
//                // MyTextFormField(datecontroller,"DOB","",dateField,null,null,false,null,false,false,"dateRequired", "",(){pickDate();},true,RegExp(r"^[ A-Za-z0-9_@./#&+-]*$")),
//
//                 // TextfieldValidation("email", "email", false, Colors.orangeAccent, Colors.black,formkey ),
//               //  SizedBox(height: 20,),
//                  //  TextfieldValidation("name", "", false, Colors.orangeAccent, Colors.black,formkey ),
//                 // check alermessage dialog box
//             /*    TextFormField(
//                   focusNode: cpasswordfield,
//                   controller: _confirmpassword,
//                   keyboardType: TextInputType.text,
//                   obscureText: showPassword1,
//                   decoration: InputDecoration(
//                     suffixIcon:
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           showPassword1 =
//                           !showPassword1;
//                         });
//                       },
//                       icon:showPassword1 ? Icon(Icons.visibility_off,color:Colors.black26,):Icon(Icons.visibility,color: Colors.grey,),
//
//                     ),
//                     enabledBorder: enableborder,
//                     focusedBorder: focusborder,
//                     border: enableborder,
//                     labelText: "conpassword",
//                     labelStyle: TextStyle(color:Colors.grey,fontFamily: 'ProximaNova-Regular',fontSize: 15),
//
//                   ),
//                   textInputAction: TextInputAction.done,
//                   onChanged: (value) {
//                     formkey.currentState!.validate();
//
//                   },
//                   onFieldSubmitted: (value) {
//                     formkey.currentState!.validate();
//                     if (validatepass(value) == null) {
//                       FocusScope.of(context).unfocus();
//                     } else {
//                       FocusScope.of(context).requestFocus(
//                           cpasswordfield);
//                     }
//                   },
//                 //  onSaved: (input) => cpassword = input,
//                   validator: ( value) {
//                     if (value!.isEmpty) {
//                       return "reenterpassword";
//                     }
//                     if (passwordcontroller.text != _confirmpassword.text) {
//                       return "passwordnotmatch";
//                     }
//                     return null;
//                   },
//                 ),*/
//                 Text("show Snackbar"),
//
//              Center(child:FlatButton(
//                child: Text("SUBMIT"),
//                onPressed: (){
//
//                  ScaffoldMessenger.of(context).showSnackBar(Showbar.displaySnackBar("snackbar", "retry",  (){},context));
//
//                 // if (formkey.currentState!.validate()) {
//                 //   print("submit");
//                 // }
//                 // _loginPressed();
//                },
//              ),),
//
//               /* Center(
//                  child: MaterialButton(
//                    color: Colors.blueGrey,
//                    onPressed: () {
//                     // print(emailcontroller.text);
//                     // print(namecontroller.text);
//                     // print(passwordcontroller.text);
//                     //     print(phonecontroller.text);
//                     // print(datecontroller.text);
//                     Future.delayed(const Duration(milliseconds: 10), () {
//                       BaseAlertDialog.dialogbox(
//                           Icons.logout, "Logout", "Are you sure want to logout",
//                           context, () => check());
//                     });
//                   },
//                     child: Text("alertbox"),
//                   ),
//                ),*/
//
//      // DropdownWidget(listitem),
//              //   CustomButtom(false,"button..", 100, 50, (){}),
//
//               ]
//           ),
//         ));
//   }
//
//   check() {
//     Navigator.of(context).pop(false);
//     print("its work");
//   }
//
//   Future<void> pickDate() async {
//     var datevalidity = await  showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1990, 1),
//       lastDate: DateTime(2030,12),
//     );
//     datecontroller.text=datevalidity.toString().substring(0,10);
//   }
//
//   }
