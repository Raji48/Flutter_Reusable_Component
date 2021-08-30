

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:twitter_login/twitter_login.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// void main(){
//   runApp(MyApp());
//
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn=false;
  Map _userObj={};

//Map userData  =
//{
// "email" = "dsmr.apps@gmail.com",
// "id" = 3003332493073668,
// "name" = "Darwin Morocho",
// "picture" = {
// "data" = {
// "height" = 50,
// "is_silhouette" = 0,
// "url" = "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668",
// "width" = 50,
// },
// }
//};


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
            Container(
              child: _isLoggedIn?Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    //  Image.network("src"),
                  if(_userObj["email"]!=null)Text("user email id:"+_userObj["email"]),//:Text("email not link"),
                    Text("user name :"+_userObj["name"]),

                    TextButton(onPressed: (){
                      setState(() {
                        _isLoggedIn=false;
                        _userObj={};
                      });
                    }, child:Text("Logout"))
                  ]
              ):
              Center(
                child: ElevatedButton(
                  child: Text("Facebook Login"),
                  onPressed: (){
                    //signInWithFacebook();
                    FacebookAuth.instance.login(
                      //  permissions: ["email"]
                    ).then((value){
                      FacebookAuth.instance.getUserData().then((userData){
                        setState(() {
                          print("isloggedtrue");
                          _isLoggedIn=true;
                          _userObj=userData;
                        });
                      });
                    });
                  },
                ),
              ),
            ),
         /*   TextButton(
                child: Text('login with facebook'),
                onPressed: () async {
                  /*  Future<UserCredential> signInWithFacebook() async {
                  final LoginResult loginResult = await FacebookAuth.instance.login();

                  // Create a credential from the access token
                  final OAuthCredential facebookAuthCredential = FacebookAuthProvider
                      .credential(loginResult.accessToken.token);

                  // Once signed in, return the UserCredential
                  return FirebaseAuth.instance.signInWithCredential(
                      facebookAuthCredential);*/

                  await    signInWithFacebook();

                }
            ),*/
          /*  Center(
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
            ),*/
          ],
        ),
      ),
    );
  }

 /* Future login() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'eA71Q6zMCA923p3TCueR3yij5',
      apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',
      redirectURI: 'https://twitterlogin-73c8f.firebaseapp.com/__/auth/handler',
    );
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print(authResult.user!.name.toString());
        print(authResult.user!.email.toString());
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
*/

  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          print('====== Login success ======');
          final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =await FirebaseAuth.instance.signInWithCredential(facebookCredential);
       //   await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          print('====== Login cancel ======');
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          print('====== Login fail ======');
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
  Future<UserCredential> signInWithFaceboo() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // if(loginResult.status==LoginStatus.success){
    //   AccessToken? mytoken=loginResult.accessToken;
    //   print("token"+mytoken!.token);
    // }

    //     permissions : ['email', 'public_profile'],
    //     loginBehavior : LoginBehavior.dialogOnly
    // );
    // permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link']);
    // ).then((value){
    //   FacebookAuth.instance.getUserData().then((value){
    //     setState(() {
    //       print("isloggedtrue");
    //       _isLoggedIn=true;
    //     });
    //   });
    //   return value;
    // });

/*  if (loginResult.status == LoginStatus.success) {
     userData = await FacebookAuth.i.getUserData(
      fields: "name,email,picture.width(200),birthday,friends,gender,link",
    );
     print("login success");
  }
  if(loginResult.status==LoginStatus.failed){
    print("login failed");
  }
  if(loginResult.status==LoginStatus.cancelled){
    print("login cancel");
  }*/

    print("token valuee      .......");
    //   print(loginResult.accessToken!.token);
    // print(loginResult.accessToken.token);
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

class Resource{

  final Status status;
  Resource({required this.status});
}

enum Status {
  Success,
  Error,
  Cancelled
}



