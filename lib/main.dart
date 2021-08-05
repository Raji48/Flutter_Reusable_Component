
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: formkey,
          child: Column(
              children: [
                SizedBox(height: 80,),
                // FloatingTextField
                CustomTextfield(
                    "label", "InputText", false, Colors.orange, Colors.green),
                SizedBox(height: 20,),
                //FloatingTextField with validator
                TextFormField(
                  // controller: _controller,
                    validator: validateemail,
                    decoration: buildInputDecoration("email", "", false, Colors.orangeAccent, Colors.green),
                    onFieldSubmitted: (value) {
                      formkey.currentState!.validate();
                    }
                ),

                TextfieldValidation("fdfddf", "email", false, Colors.orangeAccent, Colors.black, validateemail),
                SizedBox(height: 20,),
                // check alermessage dialog box
                MaterialButton(onPressed: () {
                  Future.delayed(const Duration(milliseconds: 100), (){
                   BaseAlertDialog.dialogbox(Icons.logout, "Logout", "Are you sure want to logout",context);
                  });

                },
                  child: Text("alertbox"),
                )
              ]
          ),
        ));
  }

  }
