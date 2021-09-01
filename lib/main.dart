// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// // import 'package:instagram_basic_display_api_flutter/constants.dart';
// import 'package:simple_auth/simple_auth.dart' as simpleAuth;
// import 'package:simple_auth_flutter/simple_auth_flutter.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'IG Flutter',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   // HomePage({Key key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   static const igClientId = "959584987944765";
//   static const igClientSecret = "387b6528566b8619fcfd4cddaee79b1f";
//   static const igRedirectURL = "https://twitterlogin-73c8f.firebaseapp.com/";
//   String _errorMsg="";
//   Map _userData={};
//
//   @override
//   void initState() {
//     super.initState();
//     SimpleAuthFlutter.init(context);
//   }
//
//   final simpleAuth.InstagramApi _igApi = simpleAuth.InstagramApi(
//     "instagram",
//     igClientId,
//     igClientSecret,
//     igRedirectURL,
//     scopes: [
//       'user_profile', // For getting username, account type, etc.
//       'user_media', // For accessing media count & data like posts, videos etc.
//     ],
//   );
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Instagram Basic Display API Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//           Visibility(
//           visible: _userData.isNotEmpty,
//             child: Text(_userData.toString(), // TODO pass values string here
//             textAlign: TextAlign.center),
//
//           replacement:
//           Text("Click the button below to get Instagram Login."),
//         ),
//         FlatButton.icon(
//           icon: Icon(Icons.input),
//           label: Text(
//             "Get Profile Data",
//           ),
//           onPressed: _loginAndGetData,
//           color: Colors.pink.shade400,
//         ),
//         if (_errorMsg != null) Text("Error occured: $_errorMsg"),
//     ],
//     ),
//     ),
//     );
//   }
//
//   Future<void> _loginAndGetData() async {
//     _igApi.authenticate().then(
//           (simpleAuth.Account? _user) async {
//         simpleAuth.OAuthAccount? user = _user as simpleAuth.OAuthAccount?;
//
//         var igUserResponse =
//         await Dio(BaseOptions(baseUrl: 'https://graph.instagram.com')).get(
//           '/me',
//           queryParameters: {
//             // Get the fields you need.
//             // https://developers.facebook.com/docs/instagram-basic-display-api/reference/user
//             "fields": "username,id,account_type,media_count",
//             "access_token": user!.token,
//           },
//         );
//         print(igUserResponse.data);
//         setState(() {
//           _userData = igUserResponse.data;
//           _errorMsg = "";
//         });
//       },
//     ).catchError(
//           (Object e) {
//         setState(() => _errorMsg = e.toString());
//       },
//     );
//   }
// }








import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:dio/dio.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

//import 'package:twitter_login_example/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const igClientId = "959584987944765";
  static const igClientSecret = "387b6528566b8619fcfd4cddaee79b1f";
  static const igRedirectURL = "https://twitterlogin-73c8f.firebaseapp.com/";

  String _errorMsg = "";
  Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    SimpleAuthFlutter.init(context);
  }

  final simpleAuth.InstagramApi _igApi = simpleAuth.InstagramApi(
    "instagram",
    igClientId,
    igClientSecret,
    igRedirectURL,
    scopes: [
      'user_profile', // For getting username, account type, etc.
      'user_media', // For accessing media count & data like posts, videos etc.
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Instagram Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                child: Text('Twitter Login'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 48)),
                ),
                onPressed: () async {
                  await login();
                  // await signInWithTwitter();
                },
              ),
            ),
            Visibility(
              visible: _userData.isNotEmpty,
              child: Text(
                _userData.toString(), // TODO pass values string here
                textAlign: TextAlign.center,
              ),
              replacement:
                  Text("Click the button below to get Instagram Login."),
            ),
            FlatButton.icon(
              icon: Icon(Icons.input),
              label: Text(
                "Get Profile Data",
              ),
              onPressed: _loginAndGetData,
              color: Colors.pink.shade400,
            ),
            if (_errorMsg != null) Text("Error occured: $_errorMsg"),
          ],
        ),
      ),
    );
  }

  Future<void> _loginAndGetData() async {
    _igApi.authenticate().then(
      (simpleAuth.Account? _user) async {
        simpleAuth.OAuthAccount? user = _user as simpleAuth.OAuthAccount?;

        var igUserResponse =
            await Dio(BaseOptions(baseUrl: 'https://graph.instagram.com')).get(
          '/me',
          queryParameters: {
            // Get the fields you need.
            // https://developers.facebook.com/docs/instagram-basic-display-api/reference/user
            "fields": "username,id,account_type,media_count",
            "access_token": _user!.token,
          },
        );
        print("hi access token is here" + _user.token.toString());

        setState(() {
          _userData = igUserResponse.data;
          _errorMsg = "";
        });
      },
    ).catchError(
      (Object e) {
        setState(() => _errorMsg = e.toString());
        print(_errorMsg);
      },
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
        print(authResult.user!.name.toString());
        print(authResult.user!.email.toString());
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












// class LoginPresenter {
//   LoginViewContract _view;
//   LoginPresenter(this._view);
//
//   void perform_login() {
//     assert(_view != null);
//     insta.getToken(<APP_ID>,
//     <APP_SECRET>).then((token)
//     {
//       if (token != null) {
//         _view.onLoginScuccess(token.access);
//       }
//       else {
//         _view.onLoginError('Error');
//       }
//     });
//   }
//   Future<Token> getToken(String appId, String appSecret) async {
//     Stream<String> onCode = await _server();
//     String url =
//         "https://api.instagram.com/oauth/authorize?client_id=$appId&redirect_uri=http://localhost:8585&response_type=code";
//     final flutterWebviewPlugin = new FlutterWebviewPlugin();
//     flutterWebviewPlugin.launch(url);
//     final String code = await onCode.first;
//     final http.Response response = await http.post(
//         "https://api.instagram.com/oauth/access_token",
//         body: {"client_id": appId, "redirect_uri": "http://localhost:8585", "client_secret": appSecret,
//           "code": code, "grant_type": "authorization_code"});
//     flutterWebviewPlugin.close();
//     return new Token.fromMap(JSON.decode(response.body));
//   }
//
//   Future<Stream<String>> _server() async {
//     final StreamController<String> onCode = new StreamController();
//     HttpServer server =
//     await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8585);
//     server.listen((HttpRequest request) async {
//       final String code = request.uri.queryParameters["code"];
//       request.response
//         ..statusCode = 200
//         ..headers.set("Content-Type", ContentType.HTML.mimeType)
//         ..write("<html><h1>You can now close this window</h1></html>");
//       await request.response.close();
//       await server.close(force: true);
//       onCode.add(code);
//       await onCode.close();
//     });
//     return onCode.stream;
//   }
//
//   class Token {
//   String access;
//   String id;
//   String username;
//   String full_name;
//   String profile_picture;
//
//   Token.fromMap(Map json){
//   access = json['access_token'];
//   id = json['user']['id'];
//   username = json['user']['username'];
//   full_name = json['user']['full_name'];
//   profile_picture = json['user']['profile_picture'];
//   }
//   }
// }

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
