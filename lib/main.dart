
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reusable_components/components/dialogbox.dart';
import 'package:reusable_components/components/textfield.dart';
import 'package:reusable_components/components/textfield_validation.dart';


final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 // MyHomePage({Key? key, ) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var _controller = TextEditingController();
  double progress = 0;
   bool onPress=false;
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {
        if (progress > 120) {
          progress = 0;
        } else {
          progress += 5;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: formkey,
          child: Column(
              children: [
                SizedBox(height: 80,),
                // FloatingTextField
                CustomTextfield("label name", "",false, Colors.orange, Colors.green),
                SizedBox(height: 20,),

                //FloatingTextField with validator
                TextFormField(
                  // controller: _controller,
                    validator: validateemail,
                    decoration: buildInputDecoration("email", "", false, Colors.orangeAccent, Colors.green),
                    onFieldSubmitted: (value) {
                      formkey.currentState!.validate();
                    },
                  onChanged: (value){
                    formkey.currentState!.validate();
                  },
                ),
                SizedBox(height: 20,),
               // TextfieldValidation("fdfddf", "email", false, Colors.orangeAccent, Colors.black, validateemail),
              //  SizedBox(height: 20,),

                // check alermessage dialog box
                MaterialButton(onPressed: () {
                  Future.delayed(const Duration(milliseconds: 100), (){
                   BaseAlertDialog.dialogbox(Icons.logout, "Logout", "Are you sure want to logout",context,()=>check());
                  });
                },
                  child: Text("alertbox"),
                ),
              ]
          ),
        ));
  }

   check(){
     Navigator.of(context).pop(false);
     print("its work");
  }
  }

