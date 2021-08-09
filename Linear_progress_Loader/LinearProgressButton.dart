
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:videoplugin_example/LinearProgressButton.dart';

class LinearProgressButton extends StatefulWidget {
  final String initialbtntext;
  final String lodingbtntext;
  final String successbtntext;
  final Color btncolor;
  final double btnheight;
  final double btnwidth;
  final Color txtcolor;
  final double txtsize;
  final int state;
  const LinearProgressButton(this.initialbtntext,this.lodingbtntext,this.successbtntext,this.btncolor,
      this.btnheight,this.btnwidth,this.txtcolor,this.txtsize,this.state) ;

  @override
  _LinearProgressButtonState createState() => _LinearProgressButtonState();
}

class _LinearProgressButtonState extends State<LinearProgressButton> with TickerProviderStateMixin{
  int _state = 0;
  // Color txtclr=widget.txtcolor;
  // double size=widget.txtsize;
  double progress = 0;
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {
        if (progress > MediaQuery.of(context).size.width) {
          progress = 0;
        } else {
          progress += 10;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          // Material(
          //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
          //     clipBehavior: Clip.antiAliasWithSaveLayer,
          //     child: MaterialButton(
          //
          //       child: setUpButtonChild(),
          //       onPressed: () {
          //         setState(() {
          //           if (_state == 0) {
          //             animateButton();
          //           }
          //         });
          //       },
          //       // elevation: 4.0,
          //       minWidth: double.infinity,
          //       height: 60.0,
          //       color: Colors.blue,
          //     )),
          InkWell(
            onTap: () {
            setState(() {
              if (_state == 0) {
                animateButton();
              }
            });
          },
            child: Container(
                height: widget.btnheight,
                width: widget.btnwidth,

                decoration: BoxDecoration(
                    color: widget.btncolor,

                    borderRadius: BorderRadius.all(Radius.circular(22.0))
                ),
                child: setUpButtonChild(widget.initialbtntext,widget.lodingbtntext,widget.successbtntext,widget.txtsize,widget.txtcolor,widget.btnwidth,widget.btnheight)
            ),
          )
        ),
      ],
    );

  }

   setUpButtonChild(intialtxt,loadingtxt,successtxt,txtsize,txtcolor,btnwidth,btnheight) {

    if (_state == 0) {
      return Center(child:Text(
        intialtxt,
        style:  TextStyle(
          color: txtcolor,
          fontSize: txtsize,
        ),
      ));
    } else if (_state == 1) {
      return ClipRRect(
            borderRadius: BorderRadius.circular(22.0),
            child:
         Container(
                height: btnheight,
                width: btnwidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    ),
                child: Stack(
                  children: <Widget>[
                    AnimatedContainer(
                      color: Colors.white70,
                      width: progress,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.fastOutSlowIn,
                    ),
                    Center(child: Text(loadingtxt+"....",
                    style:   TextStyle(
                      color: txtcolor,
                      fontSize: txtsize,
                    ),)),
                  ],
                )));

      return Stack(
        children: <Widget>[
          AnimatedContainer(
            color: Colors.white70,
            width: progress,
            duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn,
          ),
          Center(child: Text("Processing...")),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check, color: txtcolor,size: 28.0,),
          // Container(width: 20.0,),
          Text(
            successtxt,
            style:  TextStyle(
              color: txtcolor,
              fontSize: txtsize,
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

    Timer(Duration(milliseconds: 4300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
