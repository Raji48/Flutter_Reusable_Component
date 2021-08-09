
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:videoplugin_example/LinearProgressButton.dart';

class CircularProgressButton extends StatefulWidget {
  final String initialbtntext;
  final String lodingbtntext;
  final String successbtntext;
  final Color btncolor;
  final double btnheight;
  final double btnwidth;
  final Color txtcolor;
  final double txtsize;
  final int state;
  const CircularProgressButton(this.initialbtntext,this.lodingbtntext,this.successbtntext,this.btncolor,
      this.btnheight,this.btnwidth,this.txtcolor,this.txtsize,this.state) ;

  @override
  _CircularProgressButtonState createState() => _CircularProgressButtonState();
}

class _CircularProgressButtonState extends State<CircularProgressButton> with TickerProviderStateMixin{
  int _state = 0;
  // Color txtclr=widget.txtcolor;
  // double size=widget.txtsize;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(

                child: setUpButtonChild(),
                onPressed: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                },
                elevation: 4.0,
                minWidth: widget.btnwidth,
                height: widget.btnheight,
                color: widget.btncolor,
              )),
            )
          ],
        );

  }

  Widget setUpButtonChild() {

    if (_state == 0) {
      return new Text(
        widget.initialbtntext,
        style:  TextStyle(
          color: widget.txtcolor,
          fontSize: widget.txtsize,
        ),
      );
    } else if (_state == 1) {
      return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          Container(width: 20.0,),
          Text(
            widget.lodingbtntext,
            style:  TextStyle(
              color: widget.txtcolor,
              fontSize: widget.txtsize,
            ),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check, color: widget.txtcolor,size: 28.0,),
          Container(width: 20.0,),
          Text(
            widget.successbtntext,
            style:  TextStyle(
              color: widget.txtcolor,
              fontSize: widget.txtsize,
            ),
          )
        ],
      );
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
