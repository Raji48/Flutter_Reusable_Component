

import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final GestureTapCallback onPressed;
//  final bool showIcon;
  final String btnName;
  final double width;
  final double height;
  final Color btnColor;
  final Color txtColor;
  final IconData  icon;

  CustomButtom( this.btnName, this.width, this.height, this.onPressed,this.btnColor,this.txtColor,this.icon);
  _CustomeButtom createState() => _CustomeButtom();
}

class _CustomeButtom extends State<CustomButtom> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget> [
          Material(
              child: InkWell(
                  onTap: (){
                    widget.onPressed();
                  },
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.btnColor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(widget.btnName,
                            style: TextStyle(fontFamily: 'Work Sans', color: widget.txtColor, fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                          (widget.icon!=null)? Icon(widget.icon,color: Colors.white,size: 16.0,):Container()
//                          widget.showIcon ? (SizedBox(width: 40)) : Container(),
//                          widget.showIcon ? (Icon(Icons.arrow_forward, size: 30, color: white,)) : Container()
                        ]
                    ),
                  )
              )
          )
        ]
    );
  }
}