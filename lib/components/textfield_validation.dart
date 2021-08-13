

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/components/textfield.dart';

class MyTextFormField extends StatefulWidget {
  String labelText;
   String hintText;
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
   bool isDatepicker;
   RegExp regExp;

  MyTextFormField(
      this.textcontroller,
      this.labelText,
      this.hintText,
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
      this.isDatepicker,
      this.regExp,
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
        readOnly: widget.isDatepicker,
        controller: widget.textcontroller,
        focusNode:widget.focusField,
        inputFormatters:widget.inputformat,
        maxLength: widget.isnum?10:widget.isPassword?8:null,
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


 String? validatename(value){
  if(value.isEmpty){
    return "Please enter firstname";
  }
  return null;
}