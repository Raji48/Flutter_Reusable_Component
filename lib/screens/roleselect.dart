
import 'package:flutter/material.dart';
import 'package:wait4me/res/index.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';
import 'package:wait4me/utills/styles.dart';

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
          title: Text(selectroletype,style: titleStyle,),
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
                color:skyblue,//select?skyblue:white,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // SizedBox(height: getDeviceheight(context,0.03),),
                    Center(
                    child: Container(
                      // height: getDeviceheight(context,0.05),
                       width: getDevicewidth(context,0.15),
                     child: Image(
                        image: customer,fit: BoxFit.cover,)
                    ),
                    ),
                    SizedBox(height: getDeviceheight(context,0.15),),
                    Text(customerr,style: titleStyle,)
                  ],
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
                color:white ,//!select?skyblue:white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          width: getDevicewidth(context,0.15),
                          child: Image(
                            image:waiter,fit: BoxFit.cover,)
                      ),
                    ),
                    SizedBox(height: getDeviceheight(context,0.15),),
                    Text(waiterr,style: TextStyle(fontSize: 16,fontFamily: 'Lato-Bold',color: greyblue),)
                  ],
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
