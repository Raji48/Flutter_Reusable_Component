
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wait4me/components/textfieldValidation.dart';
import 'package:wait4me/res/index.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

enum SingingCharacter {Male,Female}
class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _userNameErrorValid = false;
  bool _userNameValid=false;
  String userName = '';
  FocusNode firstNameField = FocusNode();
  FocusNode lastNameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();
  FocusNode confirmPasswordField = FocusNode();
  FocusNode phoneField = FocusNode();
  FocusNode addressField = FocusNode();
  FocusNode dateField = FocusNode();
  var emailController= TextEditingController();
  var firstNameController= TextEditingController();
  var lastNameController= TextEditingController();
  var passwordController= TextEditingController();
  var cpasswordController= TextEditingController();
  var phoneController= TextEditingController();
  var dateController= TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool showPassword1 = true;
  String groupValue='';
  SingingCharacter? _character = SingingCharacter.Male;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
          title: Text('SIGN UP'),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
        children: [
        GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
            child:SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        MyTextFormField(firstNameController, "FirstName",firstNameField,lastNameField,[WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false, validatename,false,false,"Firstname Required","", null,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*"),false),
                        MyTextFormField(lastNameController,"LsatName",lastNameField,emailField, [WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false, validatename,false,false,"Lastname Required","", null,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*"),false),
                        MyTextFormField(emailController,"email",emailField,phoneField,null,false,null,true,false, "EmailRequired", "Email not valid",null, RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),false),

                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                         // ignoreBlank: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          initialValue: PhoneNumber(isoCode: 'NG'),
                          textFieldController: controller,
                        //  inputBorder: OutlineInputBorder(),
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                        ),

                        MyTextFormField(phoneController,"PhoneNumber", phoneField,addressField,[FilteringTextInputFormatter.digitsOnly],false,null,false,true,"Phonenumber Required","",null,RegExp(r"^\d{10}$"),false),
                        MyTextFormField(passwordController,"Password",passwordField,confirmPasswordField,null,true, validatepass,false,false,"Required Password","Password not valid",null,RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$'),true),
                    TextFormField(
                  focusNode: confirmPasswordField,
                  controller:confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: showPassword1,
                  decoration: InputDecoration(
                    suffixIcon:
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword1 =
                          !showPassword1;
                        });
                      },
                      icon:showPassword1 ? Icon(Icons.visibility_off,color:Colors.black26,):Icon(Icons.visibility,color: Colors.grey,),
                    ),
                    //enabledBorder: enableborder,
                   // focusedBorder: focusborder,
                  //  border: enableborder,
                    labelText: "conpassword",
                    labelStyle: TextStyle(color:Colors.grey,fontFamily: 'ProximaNova-Regular',fontSize: 15),
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    //formkey.currentState!.validate();
                    validatepass(value);
                  },
                  onFieldSubmitted: (value) {
                    formkey.currentState!.validate();
                    if (validatepass(value) == null) {
                      FocusScope.of(context).unfocus();
                    } else {
                      FocusScope.of(context).requestFocus(
                          confirmPasswordField);
                    }
                  },
                //  onSaved: (input) => cpassword = input,
                  validator: ( value) {
                    if (value!.isEmpty) {
                      return "reenterpassword";
                    }
                    if (passwordController.text != confirmPasswordController.text) {
                      return "passwordnotmatch";
                    }
                    return null;
                  },
                ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                         child: Radio<SingingCharacter>(
                              value: SingingCharacter.Male,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value){
                                setState(() {
                                  _character=value;
                                });
                              },
                              activeColor:Colors.red,
                          )),
                          Text("Male",style:TextStyle(fontSize: 14,fontFamily: 'ProximaNova-Medium',)),
                          Radio<SingingCharacter>(
                              value: SingingCharacter.Female,
                              groupValue: _character,
                              activeColor:Colors.red,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              }
                          ),
                          Text("Female",style:TextStyle(fontSize: 14,fontFamily: 'ProximaNova-Medium',))
                        ],
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        )
    ])
    );
  }
}
