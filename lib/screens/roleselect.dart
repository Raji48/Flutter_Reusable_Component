
import 'package:flutter/material.dart';
import 'package:wait4me/res/index.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';

class RoleSelect extends StatefulWidget {
  const RoleSelect({Key? key}) : super(key: key);

  @override
  _RoleSelectState createState() => _RoleSelectState();
}

class _RoleSelectState extends State<RoleSelect> {
  bool select=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      blue,
                      lightblue
                    ])
            ),
          ),
          //  toolbarHeight: 100,
          title: Text('SELECT ROLE TYPE'),
        ),
      body:  SafeArea(
      child:Column(
        children: [
          Expanded(
              child:GestureDetector(
                onTap: (){
                  if(!select)
                  setState(() {
                    select=!select;
                  });
                   },
             child: Container(
                color:select?skyblue:white,
                child: Center(
                 child: Image(
                    image: customer,)
                ),
              )
              )
          ),

          Expanded(
              child: GestureDetector(
                onTap: (){
                  if(select)
                    setState(() {
                      select=!select;
                    });
                },
          child:Container(
                color:!select?skyblue:white,
                child: Center(
                  child: Image(
                    image: waiter,
                  ),

                ),
              )
              )
          ),
        ],
      ),
      )
    );
  }
}
