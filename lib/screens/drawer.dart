import 'package:flutter/material.dart';
import 'package:wait4me/res/colors.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';

import '../main.dart';


class DrawerSlide extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDevicewidth(context, 0.6),
        child:Drawer(
      child: ListView(
        children: <Widget>[
          Center(child:
          Container(
            width: getDevicewidth(context, 0.6),
              height: getDeviceheight(context, 0.3),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(6, 109, 214, 1),
                    Color.fromRGBO(173, 221, 225, 1),

                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child:Column(
                  children:[
                    SizedBox(height: getDeviceheight(context, 0.04),),
                    CircleAvatar(radius:60,backgroundImage: NetworkImage('https://www.pinkvilla.com/files/styles/contentpreview/public/suriya_1.jpg?itok=PAyhlkot')),
                    SizedBox(height: getDeviceheight(context, 0.02),),
                    Text(
                      "abisheik_cool",
                      style: TextStyle(
                        fontFamily: 'Lato-Bold',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ])
          )),

          ListTile(
            visualDensity: VisualDensity(horizontal:- 4, vertical: 4),
            leading: Icon(Icons.pin_drop,color: Color.fromRGBO(144, 157, 167, 1),size: 21,),
            title: Text("Find Waiter", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.feed,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("My Requests", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.person,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("My Profile", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.language,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("Choose Role", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.lock,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("Change Password", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.feed,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("Terms of Use", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading: Icon(Icons.feed,color: Color.fromRGBO(144, 157, 167, 1)),
            title: Text("Privacy Policy", style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),

            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: 4),
            leading:Icon(Icons.logout_rounded,color: Color.fromRGBO(144, 157, 167, 1)) ,
            title: Text('Logout',style: TextStyle(fontFamily: 'Lato-Bold', color: Color.fromRGBO(144, 157, 167, 1), fontSize: 18,)),
            onTap: () {
              Navigator.of(context)
                  .pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  MyApp()), (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    ));
  }

}