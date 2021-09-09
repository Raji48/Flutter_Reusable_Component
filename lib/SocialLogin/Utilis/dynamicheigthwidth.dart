

import 'dart:io';


import 'package:flutter/material.dart';

getDevicewidth(BuildContext context,double percentage) {
//  print(MediaQuery.of(context).size.width);
  var width=MediaQuery.of(context).size.width;
  double wid=width*percentage;

  return wid;
}

getDeviceheight(BuildContext context,double percentage) {
//  print(MediaQuery.of(context).size.height);
  var height= MediaQuery.of(context).size.height;
  double heg=height*percentage;

  return heg;


}

getheightwithoutsafeArea(BuildContext context,int percentage) {
  // height without SafeArea
  var padding = MediaQuery.of(context).padding;
  var height = MediaQuery.of(context).size.height;
  var sheight= height - padding.top - padding.bottom;
  double heg=sheight*percentage;

  return heg;
}

getheightwithoutstatusBar(BuildContext context,int percentage) {
  // height without status bar
  var padding = MediaQuery.of(context).padding;
  var height = MediaQuery.of(context).size.height;
  var sheight= height - padding.top;
  double heg=sheight*percentage;

  return heg;
}

getheightwithoutStatusToolBar(BuildContext context,int percentage) {
  // height without status and toolbar
  var padding = MediaQuery.of(context).padding;
  var height = MediaQuery.of(context).size.height;
  var sheight= height - padding.top - kToolbarHeight;
  double heg=sheight*percentage;

  return heg;
}

isEmpty(text) {
  return (
      text.trim().length == 0 ||
          text == null ||
          text == "null" ||
          text == ""
  );
}

isvalidateEmail(mail) {
  String  pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(mail);
}

isvalidateName(text) {
  String  pattern = r"^[a-zA-Z](\/?[0-9a-z])*";
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(text);
}

isValidPassword(text) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(text);
}
isValidNumber(text){
  String pattern=r'^([1-9][0-9]*)';
  RegExp regExp =RegExp(pattern);
  return regExp.hasMatch(text);
}

isAndroid() {
  return (Platform.isAndroid);
}
