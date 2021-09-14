
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:socialauthapp/component/textfield.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:dio/dio.dart';

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

  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();
   var emailcontroller= TextEditingController();
   var passwordcontroller= TextEditingController();

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
        // appBar: AppBar(
        //   title: const Text('Social Auth'),
        // ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Center(
                child:Container(
                  child: Text("Social Login",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),),
              ),
              SizedBox(height: 10,),
              MyTextFormField(emailcontroller,"email","input Text",emailField,passwordField,null,false,null,true,false, "EmailRequired", "Email not valid",null,false, RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")),
              SizedBox(height: 20,),
              MyTextFormField(passwordcontroller,"password","",passwordField,null,null,true,null,false,false,"PasswordRequired","Password Not Valid" ,null,false,RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')),
              SizedBox(height: 20,),
              MaterialButton(
                color:Colors.white,
                  onPressed: () {},
                  child:
                  Text("SIGNIN"),
              ),
              SizedBox(height: 20,),
              Center(child:Text('or')),
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
                    onPressed: () async {
                 //  await  signInWithFacebook();
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

              Visibility(
                visible: _userData.isNotEmpty,
                child: Text(
                  _userData.toString(), // TODO pass values string here
                  textAlign: TextAlign.center,
                ),
                //replacement:
               // Text("Click the button below to get Instagram Login."),
              ),
              FlatButton.icon(
                icon: Icon(Icons.input),
                label: Text("Signin with Instagram",),
                onPressed: _loginAndGetData,
                color: Colors.pink.shade400,
              ),
              //if (_errorMsg != null) Text("Error occured: $_errorMsg"),
            ],
          ),
        ),
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

Future signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        print('====== Login success ======');
        final AuthCredential facebookCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =await FirebaseAuth.instance.signInWithCredential(facebookCredential);
        //   await _auth.signInWithCredential(facebookCredential);
      //   return Resource(status: Status.Success);
      // case LoginStatus.cancelled:
      //   print('====== Login cancel ======');
      //   return Resource(status: Status.Cancelled);
      // case LoginStatus.failed:
      //   print('====== Login fail ======');
      //   return Resource(status: Status.Error);
      // default:
        return null;
    }
  } on FirebaseAuthException catch (e) {
    throw e;
  }
}




  Future twitterlogin() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'eA71Q6zMCA923p3TCueR3yij5',
      apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',
      redirectURI: 'https://soucialauthapp.firebaseapp.com/__/auth/handler', //'soucialauthapp://',//ios
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

