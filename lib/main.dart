
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
 import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

Future<void>main()async{
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
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
  String  googleUsername='';
  String googleUsermail='';

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
            ),
            const Divider(),
            TwitterAuthButton(
              onPressed: () {},
              darkMode: false,
              isLoading: false,
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ),
*/
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
                child: ElevatedButton(
                  child: Text('Sign in with Facebook',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),),
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
                child: ElevatedButton(
                  child: Text('Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),),
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

