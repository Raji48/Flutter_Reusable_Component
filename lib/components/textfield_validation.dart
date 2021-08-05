

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/components/textfield.dart';

class TextfieldValidation extends StatefulWidget {
  final String labelText;
  final  String hintText;
  final bool underlineborderDecoration;
  final Color enableborderColor;
  final Color focusborderColor;
  final Function _validator;
  //final TextfieldValidation _validation;

  TextfieldValidation(this.labelText,this.hintText,this.underlineborderDecoration,this.enableborderColor,this.focusborderColor,this._validator);
  @override
  _TextfieldValidationState createState() => _TextfieldValidationState();
}

class _TextfieldValidationState extends State<TextfieldValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formkey,
        cursorColor: Colors.red,
        decoration: buildInputDecoration(widget.labelText,widget.hintText,widget.underlineborderDecoration,widget.enableborderColor,widget.focusborderColor),
        validator:validateemail,
      onFieldSubmitted: (value){
        formkey.currentState!.validate();
      },
    );
  }
}








String validatename(value){
  if(value.isEmpty){
    return "Please enter firstname";
  }
  return "";
}
String validateemail(value){
  if(value.isEmpty){
    return "Please enter email";
  }
  if(!RegExp("^[a-zA-Z0-9+_.-]+@optisolbusiness+.com").hasMatch(value)){
    return "Please enter valid email";
  }
  return "";
}
//
// String validatephone(value) {
//   if (value.isEmpty) {
//     return "Please enter phonenumber";
//   }
//   if (value.length == 10) {
//     return null;
//   } else {
//     return "Please enter valid phonenumber";
//   }
// }
//
//
// String validatepass(value){
//   if(value.isEmpty){
//     return "Please enter password";
//   } if(!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(value)){
//     return "Password length should be 6-10,at least one upper case,\nlower case,digit and Special character";
//   }
//   else if(value.length<6){
//     return "Should be At Least 6 characters";
//   }else if(value.length>10) {
//     return "Should not be more than 10 characters";
//   }
//   return null;
// }
//
// String validatefield(value){
//   if(value.isEmpty){
//     return "This field is Required ";
//   }
//   return null;
// }