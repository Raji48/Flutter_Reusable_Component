
import 'package:flutter/material.dart';

class CommonModalLoader extends StatefulWidget {
  final progressIndicatorcolor;
  final backgroundcolor;
  const CommonModalLoader({Key? key,this.progressIndicatorcolor,this.backgroundcolor}) : super(key: key);

  @override
  _CommonModalLoaderState createState() => _CommonModalLoaderState();
}

class _CommonModalLoaderState extends State<CommonModalLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: widget.backgroundcolor,
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(widget.progressIndicatorcolor)
          ),
        )
    ) ;
  }
}
