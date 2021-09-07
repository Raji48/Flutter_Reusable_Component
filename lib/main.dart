
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
           // Text("ios module"),
           /*GoogleAuthButton(
              onPressed: () {},
              darkMode: false,
              style: AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ),
            const Divider(),
            FacebookAuthButton(
              onPressed: () {},
              darkMode: false,
             // isLoading: isLoading,
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ),*/
            const Divider(),
        Container(
          child: twitterlog?Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
               Text("Username: "+twitterusername),
               // Text("Usermail: "+googleUsermail),
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

  /*Future login() async {
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


 Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();  //await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
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


  Future twitterlogin() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: 'eA71Q6zMCA923p3TCueR3yij5',

      /// Consumer API Secret keys
      apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'soucialauthapp://',//'https://soucialauthapp.firebaseapp.com/__/auth/handler',
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

  // Future<Resource?> signInWithFaceboo() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     switch (result.status) {
  //       case LoginStatus.success:
  //         print('====== Login success ======');
  //         final AuthCredential facebookCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.token);
  //         final userCredential =await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //         //   await _auth.signInWithCredential(facebookCredential);
  //         return Resource(status: Status.Success);
  //       case LoginStatus.cancelled:
  //         print('====== Login cancel ======');
  //         return Resource(status: Status.Cancelled);
  //       case LoginStatus.failed:
  //         print('====== Login fail ======');
  //         return Resource(status: Status.Error);
  //       default:
  //         return null;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw e;
  //   }
  // }
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

