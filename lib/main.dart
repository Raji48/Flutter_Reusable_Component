
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
 import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn=false;
  Map _userObj={};
  dynamic _user;
  bool googlelogin=false;
  bool twitterlog=false;
  String  googleUsername='';
  String googleUsermail='';
  String twitterusername='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Social Auth'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
        Container(
          child: twitterlog?Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
               Text("Username: "+twitterusername),
                TextButton(onPressed: (){
                  setState(() {
                    twitterlog=false;
                  });
                  signOuttwitter();
                },child:
                Text("Logout"))
              ]
          ):
              Center(
              child:
            TwitterAuthButton(
              onPressed: () async {
                await twitterlogin();
              },
              darkMode: false,
              //isLoading: false,
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ))),
            const Divider(),
            Container(
              child: _isLoggedIn?Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    //  Image.network("src"),
                  if(_userObj["email"]!=null)Text("user email id:"+_userObj["email"]),//:Text("email not link"),
                    Text("user name :"+_userObj["name"]),
                    TextButton(onPressed: (){
                      signOutFromFacebook();
                      setState(() {
                        _isLoggedIn=false;
                        _userObj={};
                      });
                    }, child:Text("Logout"))
                  ]
              ):
              Center(
                child:
                FacebookAuthButton(
                  darkMode: false,
                  // isLoading: isLoading,
                  style: const AuthButtonStyle(
                    buttonType: AuthButtonType.secondary,
                    iconType: AuthIconType.outlined,
                  ),

                  onPressed: (){
                 //    signInWithFacebook();
                    FacebookAuth.instance.login().then((value){
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
            const Divider(),
            Container(
              child: googlelogin?Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text("Username: "+googleUsername),
                    Text("Usermail: "+googleUsermail),
                    TextButton(onPressed: (){
                      setState(() {
                        googlelogin=false;
                      });
                      signOutFromGoogle();
                    },child:
                    Text("Logout"))
                  ]
              ):
              Center(
                child:
                GoogleAuthButton(
                  darkMode: false,
                  style: AuthButtonStyle(
                    buttonType: AuthButtonType.secondary,
                    iconType: AuthIconType.outlined,
                  ),
                  onPressed: () async {
                    await   signInWithGoogle();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



 Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

       var result=await FirebaseAuth.instance.signInWithCredential(credential);
       _user =result.user;

        googleUsername=_user.displayName.toString();
        googleUsermail=_user.email.toString();
        print("username"+googleUsername);
        print("User Name: ${_user.displayName}");
        print("User Email ${_user.email}");

    if(_user!=null){
      setState(() {
        googlelogin=true;
      });
    }
     return _user;
  }




  Future twitterlogin() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'eA71Q6zMCA923p3TCueR3yij5',
      apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',
      redirectURI: 'soucialauthapp://',//'https://soucialauthapp.firebaseapp.com/__/auth/handler',
    );
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
      // success
        print('====== Login success ======');
        twitterusername=authResult.user!.name.toString();
        print(authResult.user!.email.toString());
        setState(() {
          twitterlog=true;
        });
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

  // signout
  Future<void> signOutFromGoogle() async{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    print("google logout true");
  }

  Future<void> signOutFromFacebook() async{
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    print(" Facebook logout true");
  }

  Future<void> signOuttwitter() async{
    await FirebaseAuth.instance.signOut();

  }


}

