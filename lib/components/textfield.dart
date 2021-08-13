
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
 final String labelText;
 final  String hintText;
 final bool underlineborderDecoration;
 final Color enableborderColor;
 final Color focusborderColor;

  CustomTextfield(this.labelText,this.hintText,this.underlineborderDecoration,this.enableborderColor,this.focusborderColor);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.red,
       decoration: buildInputDecoration(widget.labelText,widget.hintText,widget.underlineborderDecoration,widget.enableborderColor,widget.focusborderColor)
     //  InputDecoration(labelText:widget.labelText,focusedBorder: focusborder,enabledBorder: enableborder),
    );
  }
}

InputDecoration buildInputDecoration(String labeltext,String hinttext,bool lineborderdecoration,Color enablebordercolor, Color focusbordercolor) {
return InputDecoration(
      labelText: labeltext,
      hintText:hinttext,
      labelStyle: TextStyle(color:enablebordercolor,fontFamily: 'ProximaNova-Regular',fontSize: 15),
     focusedBorder:lineborderdecoration?focusedBorder:focusborder,
     border:lineborderdecoration?enabledBorder:enableborder,
    enabledBorder:lineborderdecoration?enabledBorder:enableborder
  );
}


final focusborder= OutlineInputBorder(
    borderSide: BorderSide(
        color:Colors.orangeAccent ,width: 1.3 ));

final enableborder = OutlineInputBorder(
  borderSide: BorderSide(
      color:Colors.green, width: 1.3),);

final enabledBorder= UnderlineInputBorder(
borderSide: BorderSide(color:Colors.blue),
);

final focusedBorder= UnderlineInputBorder(
borderSide: BorderSide(color:Colors.green),
);

