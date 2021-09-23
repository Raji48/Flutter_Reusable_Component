import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
class MyTextFormField extends StatefulWidget {
  String labelText;
  // String hintText;
=======
import 'package:wait4me/utills/styles.dart';

class MyTextFormField extends StatefulWidget {
  String labelText;
 // String hintText;
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
  bool isPassword=false;
  dynamic validator;
  bool isEmail=false;
  bool isnum=false;
  String errorText;
  String subErrorText;
  dynamic  inputformat;
  FocusNode focusField;
  dynamic nextFocusField;
  TextEditingController textcontroller;
  dynamic onTap;
<<<<<<< HEAD
  // bool isDatepicker;
  RegExp regExp;
  final bool underlineborderDecoration;
  MyTextFormField(
      this.textcontroller,
      this.labelText,
      // this.hintText,
=======
 // bool isDatepicker;
  RegExp regExp;
  final bool underlineborderDecoration;

  MyTextFormField(
      this.textcontroller,
      this.labelText,
     // this.hintText,
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
      this.focusField,
      this.nextFocusField,
      this.inputformat,
      this.isPassword ,
      this.validator,
      this.isEmail ,
      this.isnum,
      this.errorText,
      this.subErrorText,
      this.onTap,
<<<<<<< HEAD
      // this.isDatepicker,
=======
     // this.isDatepicker,
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
      this.regExp,
      this.underlineborderDecoration,
      );
  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

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
<<<<<<< HEAD
        //   readOnly: widget.isDatepicker,
=======
     //   readOnly: widget.isDatepicker,
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
        controller: widget.textcontroller,
        focusNode:widget.focusField,
        inputFormatters:widget.inputformat,
        maxLength: widget.isnum?10:widget.isPassword?8:null,
        decoration: InputDecoration(
          labelText: widget.labelText,
<<<<<<< HEAD
          // hintText: widget.hintText,
          errorText: _textErrorValid ? (userName.isEmpty ? widget.errorText : widget.subErrorText) : null,
          //   contentPadding: EdgeInsets.all(15.0),
          enabledBorder: widget.underlineborderDecoration?null:borderstyle,
          focusedBorder: widget.underlineborderDecoration?null:borderstyle,
          //   filled: true,
=======
         labelStyle:widget.underlineborderDecoration?labelStylewhite:labelStylegrey,
         // hintText: widget.hintText,
          errorText: _textErrorValid ? (userName.isEmpty ? widget.errorText : widget.subErrorText) : null,
       //   contentPadding: EdgeInsets.all(15.0),
         enabledBorder: widget.underlineborderDecoration?borderstyle:underlineborderstyle,
       //   filled: true,
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
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
          //_update(text, 1);
          if (text.isNotEmpty) {
            if (widget.regExp.hasMatch(text)) {
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
            if (widget.regExp.hasMatch(text)) {
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
        onTap: widget.onTap,
        validator: widget.validator,
      );
  }
  _update(text, type) {
    // if (widget.validateName(text)) {
    if(widget.regExp.hasMatch(text)){
      setState(() {
        userName = text;
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

<<<<<<< HEAD
String? validatename(value){
  if(value.isEmpty){
    return "Please enter firstname";
  }
  return null;
}

String? validatepass(value){
  if(value.isEmpty){
    return "Please enter password";
  } if(!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(value)){
    return "Password length should be 6-10,at least one upper case,\nlower case,digit and Special character";
  }
  else if(value.length<6){
    return "Should be At Least 6 characters";
  }else if(value.length>10) {
    return "Should not be more than 10 characters";
  }
  return null;
}
final borderstyle=new OutlineInputBorder(borderSide: BorderSide(
    style: BorderStyle.solid, color: Colors.white, width: 1.0),
  borderRadius: const BorderRadius.all(const Radius.circular(0.0),),);
=======
>>>>>>> f2112f14099cac3dcebb923240585f798e3a0985
