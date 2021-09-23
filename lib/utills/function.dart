
import 'package:wait4me/res/index.dart';

String? validatename(value){
  if(value.isEmpty){
    return firstnamereq;
  }
  return null;
}


String? validatelname(value){
  if(value.isEmpty){
    return lastnamereq;
  }
  return null;
}



String? validateaddress(value){
  if(value.isEmpty){
    return addressreq;
  }
  return null;
}


String? validateemail(value) {
  if (value.isEmpty) {
    return emailreq;
  }
  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
    return emailnotvalid;
  }
  return null;
}


String? validatepass(value){
  if(value.isEmpty){
    return passwordreq;
  } if(!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(value)){
    return  passwordnotvalid; //"Password length should be 6-10,at least one upper case,\nlower case,digit and Special character";
  }
  // else if(value.length<6){
  //   return "Should be At Least 6 characters";
  // }else if(value.length>10) {
  //   return "Should not be more than 10 characters";
  // }
  return null;
}

