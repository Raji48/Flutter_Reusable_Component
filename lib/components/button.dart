
import 'package:flutter/material.dart';
import 'package:wait4me/res/index.dart';
import 'package:wait4me/utills/styles.dart';

class CustomButtom extends StatefulWidget {
  final GestureTapCallback onPressed;
  final bool showIcon;
  final String btnName;
  final double width;
  final double height;
  final bool circleBorder;

  CustomButtom(this.showIcon, this.btnName, this.width, this.height, this.onPressed, this.circleBorder);
  _CustomeButtom createState() => _CustomeButtom();
}

class _CustomeButtom extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget> [
          Material(
            color: Colors.transparent,
              child: InkWell(
                  onTap: (){
                    widget.onPressed();
                  },
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    decoration:widget.circleBorder? BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:red,
                    ):BoxDecoration(
                         color:red,
                   ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(widget.btnName,
                            style: titleStyle),
                          widget.showIcon ? (SizedBox(width: 40)) : Container(),
                          widget.showIcon ? (Icon(Icons.arrow_forward, size: 30, color:Colors. white,)) : Container()
                        ]
                    ),
                  )
              )
          )
        ]
    );
  }

}