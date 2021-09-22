
import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final GestureTapCallback onPressed;
  final bool showIcon;
  final String btnName;
  final double width;
  final double height;

  CustomButtom(this.showIcon, this.btnName, this.width, this.height, this.onPressed,);
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
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(widget.btnName,
                            style: TextStyle(fontFamily: 'MavenBold', color: Colors.white, fontSize: 22),),
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