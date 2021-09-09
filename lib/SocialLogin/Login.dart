
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Components/Button.dart';
import 'Utilis/dynamicheigthwidth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {




  @override
  Widget build(BuildContext context) {

    // ProgressBarHandler _handler;

    String userName = '';
    String passWord = '';
    String forgotPassword='';
    String Error="";

    var _firstPress = true ;
    bool _obscureText = true;
    bool _userNameValid = false;
    bool _userNameErrorValid = false;
    bool initialState = true;

    bool loader=false;

    bool _forgotpasswordValid = false;
    bool _forgotpasswordErrorValid = false;

    bool _userpasswordValid = false;
    bool _userpasswordErrorValid = false;

    FocusNode userField = FocusNode();
    FocusNode password = FocusNode();
    FocusNode forgotpassword = FocusNode();

    String appName = "";
    String packageName = "";
    String version = "";
    String buildNumber = "";


    double fixsize= getDevicewidth(context, 0.08);
    var theme=Color.fromRGBO(0, 39, 84, 1);
    var txtfield=Color.fromRGBO(243, 243, 243, 1);
    var txtbold=Color.fromRGBO(20, 23, 26, 1);
    var subtxtlite=Color.fromRGBO(0, 0, 0, 0.6);


    void _toggle() {
      FocusScope.of(context).unfocus();
      setState(() {
        _obscureText = !_obscureText;

      });
    }

    _update(text, type) {
      if (isvalidateEmail(text)) {
        setState(() {
          userName = text;
          _userNameErrorValid = false;
        });
      } else {
        setState(() {
          userName = text;
        });
      }
    }
    _update1(text, type) {
      if (isValidPassword(text)) {
        setState(() {
          passWord = text;
          _userpasswordErrorValid = false;
        });
      } else {
        setState(() {
          passWord = text;
        });
      }
    }

    return Scaffold(
        body:SafeArea(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Center(
            child:Container(
              padding: EdgeInsets.only(top: getDeviceheight(context, 0.1)),
              child: Text("Social Media Login",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),),
            ),
          Container(
            padding: EdgeInsets.only(top: getDeviceheight(context, 0.05),left: fixsize),
            child: Text("Email",
              style: TextStyle(fontFamily: 'worksans', color: txtbold, fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
          ),
          Container(
            padding: EdgeInsets.only(top: getDeviceheight(context, 0.02),left: fixsize,right: fixsize),
            child: new Theme(
                data: new ThemeData(
                  primaryColor: theme,
//                          accentColor: Colors.red,
                ),
                child:TextFormField(
                  focusNode: userField,
                  onChanged: (text){_update(text, 1);
                  // onFieldSubmitted:(text){
                  if(!isEmpty(text)){
                    if (isvalidateEmail(text)) {
                      setState(() {
                        _userNameErrorValid = false;
                      });
//                                FocusScope.of(context).unfocus();
//                         FocusScope.of(context).requestFocus(password);
                    } else {
                      setState(() {
                        _userNameValid = true;
                        _userNameErrorValid =true;
                      });
                      FocusScope.of(context).requestFocus(userField);
                    }
                  } else {
                    setState(() {
                      _userNameValid = true;
                      _userNameErrorValid = true;
                    });
                    FocusScope.of(context).requestFocus(userField);
                  }
                  } ,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,

                  decoration: new InputDecoration(
                      errorText: _userNameErrorValid ? (isEmpty(userName) ? "Email Required*" : "Email Not Valid") : null,
                      errorStyle: TextStyle(color: Colors.red),

                      border: new OutlineInputBorder(

                        borderSide: BorderSide(

//                          style: BorderStyle.none,
                            color: txtfield

                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Email",
                      fillColor: txtfield),
//                          validator: (input) => input.isEmpty?"Email Required":(isvalidateEmail(input) ? null : "Check your email"),
                )),
          ),Container(
            padding: EdgeInsets.only(top: getDeviceheight(context, 0.02),left: fixsize),
            child: Text("Password",
                style: TextStyle(fontFamily: 'worksans', color: txtbold, fontSize: 16,fontWeight: FontWeight.w600)),
          ),
          Container(
              padding: EdgeInsets.only(top: getDeviceheight(context, 0.02),left: fixsize,right: fixsize),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: theme,
//                          primaryColorDark: Colors.red,
                ),
                child:
                TextFormField(
                  focusNode: password,
                  onChanged: (text){_update1(text, 1);},
                  onFieldSubmitted:(text1){
                    if(!isEmpty(text1)){
                      if (isValidPassword(text1)) {
                        setState(() {
                          _userpasswordErrorValid = false;
                        });
                        FocusScope.of(context).unfocus();
                      } else {
                        setState(() {
                          _userpasswordValid = true;
                          _userpasswordErrorValid =true;
                        });
                      }
                    } else {
                      setState(() {
                        _userpasswordValid = true;
                        _userpasswordErrorValid = true;
                      });
                    }
                  } ,

                  autovalidate: true,
                  decoration: new InputDecoration(
                      errorText: _userpasswordErrorValid ? (isEmpty(passWord) ? "Password Required" : "passwword Not Valid") : null,
                      errorStyle: TextStyle(color: Colors.red),

                      suffixIcon:GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child:IconButton(
                              onPressed:_toggle,
                              icon: new Icon(_obscureText ?  Icons.visibility_off:Icons.visibility ))),
//                              suffixIcon: _toggle()? FlatButton.icon(onPressed:(){ print('pressed');}, icon: Icon(Icons.remove_red_eye), label: Text('')):FlatButton.icon(onPressed:(){ print('pressed');}, icon: Icon(Icons.panorama_fisheye), label: Text('')),
                      border: new OutlineInputBorder(

                        borderSide: BorderSide(
//                          width: 1.0,

                          style: BorderStyle.none,
//                          color: Colors.white,

                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: txtfield),
                  obscureText: _obscureText,
//                          validator: (input) => input.isEmpty?"Password Required":(isValidPassword(input) ? null : "Password should cointain 1-uppercase,1-lower case,1-numeric,1-special character"),
                ),


              )),
//           Container(child:InkWell(child: Container(
//
//             padding: EdgeInsets.only(top: getDeviceheight(context, 0.03),left: fixsize,right: fixsize),
//             child: Text("Forgot password?",
//               style: TextStyle(fontFamily: 'worksans', color: theme, fontSize: 16,fontWeight: FontWeight.w600,),textAlign: TextAlign.end,),
//           ),
//             onTap:(){
// //                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ForgetPassword()));
// //              Navigator.pushNamed(context, '/forgotpassword');
// //            showAlertDialog(context);
//               showModalBottomSheet(
//                   backgroundColor: Colors.transparent,
//                   context: context,
//                   isScrollControlled:true,
//                   builder: (BuildContext context){
//                     return DraggableScrollableSheet(
//                         initialChildSize: 0.9,
//                         maxChildSize: 0.9,
//                         minChildSize: 0.25,
//                         builder: (BuildContext context, ScrollController scrollController) {
//                           return ForgetPassword();
//                         }
//                     );
//                   }
//               );
//             },
//
//           )),
          Container(
            padding: EdgeInsets.only(top: getDeviceheight(context, 0.05),left: fixsize,right: fixsize),
            child: CustomButtom('Sign In',350.0,55.0,(){},theme,Colors.white,Icons.login),
          ),
          SizedBox(height: getDeviceheight(context, 0.05),),
          Container(
            padding: EdgeInsets.only(top: getDeviceheight(context, 0.02),left: fixsize),
            child: Center(child:Text("Sign in With",
                style: TextStyle(fontFamily: 'worksans', color: txtbold, fontSize: 16,fontWeight: FontWeight.w600))),
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebookSquare),),
              IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagramSquare),),
            ],
          ),





        ],
      ),
    ));
  }
}
