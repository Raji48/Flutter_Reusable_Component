


import 'package:flutter/material.dart';

getDevicewidth(BuildContext context,double percentage) {
  print(MediaQuery.of(context).size.width);
  var width=MediaQuery.of(context).size.width;
  double wid=width*percentage;

  return wid;
}

getDeviceheight(BuildContext context,double percentage) {
  print(MediaQuery.of(context).size.height);
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

