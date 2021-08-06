 import 'package:flutter/material.dart';

class BaseAlertDialog{
   static dialogbox(iconName ,alertTitle, alertText, BuildContext context,VoidCallback onPressed) {
    return showDialog(
       context:context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                //  width: 10,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                       // Align(
                          //  alignment: Alignment.topLeft,
                             FlatButton.icon(
                              icon: Icon(iconName),
                              label: Text(alertTitle, style: TextStyle(color: Colors.red, fontFamily: 'ProximaNova-Semiboldstyle', fontSize: 16),),
                              onPressed: () {},),
                        SizedBox(height:2),
                        Text(alertText,style: TextStyle(color:Colors.black,fontFamily: 'ProximaNova-Regular',fontSize: 16),),
                        SizedBox(height: 6),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                color:Colors.grey ,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("No", style: TextStyle(color:Colors.black),),
                              ),
                              RaisedButton(
                                onPressed: onPressed,//() async {},
                                color:Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("yes"),
                              ),
                            ])
                      ]))
          );
        });

  }
}
