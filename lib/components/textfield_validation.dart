

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/components/textfield.dart';


class MyTextFormField extends StatefulWidget {
  String labelText;
   String hintText;
   bool isPassword=false;
   bool isEmail=false;
   bool isnum=false;
   dynamic validateName;
   String errorText;
   String subErrorText;
   dynamic  inputformat;
   FocusNode focusField;
   dynamic nextFocusField;
   TextEditingController textcontroller;

  MyTextFormField(
      this.textcontroller,
      this.labelText,
      this.hintText,
      this.focusField,
      this.nextFocusField,
      this.inputformat,
      this.isPassword ,
      this.isEmail ,
      this.isnum,
      this.validateName,
      this.errorText,
      this.subErrorText,
  );

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

String emailValue="";
String name='';

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool _textErrorValid=false;
  bool _textValid=false;
  String userName='';
  bool showPassword = true;
  void initState(){
    _textErrorValid=false;
    _textValid=false;
    userName='';
    showPassword = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return //Padding(
      //padding: EdgeInsets.all(8.0),
      // child:
      TextFormField(
        controller: widget.textcontroller,
        focusNode:widget.focusField,
        inputFormatters:widget.inputformat,
        maxLength: widget.isnum?10:null,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          errorText: _textErrorValid ? (userName.isEmpty ? widget.errorText : widget.subErrorText) : null,
          contentPadding: EdgeInsets.all(15.0),
          border: enableborder,
          filled: true,
        //  fillColor: Colors.grey[200],
          counterText: "",
           suffixIcon:
           widget.isPassword ? IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon:showPassword ? Icon(Icons.visibility_off,color:Colors.black26,):Icon(Icons.visibility,color: Colors.grey,),

          ):null,
        ),
        obscureText: widget.isPassword ? showPassword :false,
        onChanged: (text) {
          _update(text, 1);
          if (text.isNotEmpty) {
            if (widget.validateName(text)) {
              setState(() {
                _textErrorValid = false;
              });
            //  FocusScope.of(context).unfocus();
            } else {
              setState(() {
                _textValid = true;
                _textErrorValid = true;
              });
            }
          } else {
            setState(() {
              _textValid = true;
              _textErrorValid = true;
            });
          }
        },
        onFieldSubmitted: (text) {
          if (text.isNotEmpty) {
            if (widget.validateName(text)) {
              setState(() {
                _textErrorValid = false;
              });
              FocusScope.of(context).requestFocus(widget.nextFocusField);
            } else {
              setState(() {
                _textValid = true;
                _textErrorValid = true;
              });
              FocusScope.of(context).requestFocus(widget.focusField);
            }
          } else {
            setState(() {
              _textValid = true;
              _textErrorValid = true;
            });
            FocusScope.of(context).requestFocus(widget.focusField);
          }
        },
        keyboardType: widget.isEmail ? TextInputType.emailAddress : widget.isnum?TextInputType.number:TextInputType.text,
      );
  }

  _update(text, type) {
    if (widget.validateName(text)) {
      setState(() {
       userName = text;
       if(widget.labelText=="email")
           emailValue=userName;

       if(widget.labelText=='name')
         name=userName;

      _textErrorValid = false;
      });
      return userName;
    } else {
      setState(() {
        userName = text;
      });
    }
  }
}


validateEmail(text) {
  Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(pattern.toString());
  return regExp.hasMatch(text);
}

validatename(value){
  Pattern pattern =r"^[a-zA-Z](\/?[0-9a-z])*";
  RegExp regExp = new RegExp(pattern.toString());
  return regExp.hasMatch(value);
}

validateNumber(text){
  Pattern pattern=r"^\d{10}$";
  RegExp regExp =RegExp(pattern.toString());
  return regExp.hasMatch(text) ;
}

validatePassword(text){
  Pattern pattern=r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regExp =RegExp(pattern.toString());
  return regExp.hasMatch(text) ;
}
//
// validateConPassword(text){
//   String xxx="username";
//  if ("username"==text)
//
// }
