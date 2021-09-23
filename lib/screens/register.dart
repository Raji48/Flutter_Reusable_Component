
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wait4me/components/button.dart';
import 'package:wait4me/components/textfieldValidation.dart';
import 'package:wait4me/res/index.dart';
import 'package:wait4me/utills/dynamic_widthandheight.dart';
import 'package:wait4me/utills/function.dart';
import 'package:wait4me/utills/styles.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

enum SingingCharacter {Male,Female}
class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
  var addressController= TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool showPassword1 = true;
  String groupValue='';
  SingingCharacter? _character = SingingCharacter.Male;
  bool conpassErrorValid=false;
  bool conpassValid=false;
  String conpass='';
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
             )),
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
          title: Text(signup,style: titleStyle,),
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(
        children: [
        GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
            child:SafeArea(
              child: SingleChildScrollView(
                child:Form(
                  key: formkey,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.all(17),
                    child: Column(
                      children: [
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        MyTextFormField(firstNameController, firstname,firstNameField,lastNameField,[WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false, validatename,false,false,firstnamereq,"", null,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*"),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        MyTextFormField(lastNameController,lastname,lastNameField,emailField, [WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))],false, validatelname,false,false,lastnamereq,"", null,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*"),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        MyTextFormField(emailController,email,emailField,phoneField,null,false,validateemail,true,false, emailreq, emailnotvalid,null, RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
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
                       // SizedBox(height:getDeviceheight(context, 0.01),),
                       // MyTextFormField(phoneController,phonenumber, phoneField,addressField,[FilteringTextInputFormatter.digitsOnly],false,null,false,true,phonenumreq,"",null,RegExp(r"^\d{10}$"),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        MyTextFormField(addressController, address,addressField,passwordField,null,false, validateaddress,false,false,addressreq,"", null,RegExp(r"^[a-zA-Z](\/?[0-9a-z])*"),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        MyTextFormField(passwordController,password,passwordField,confirmPasswordField,null,true, validatepass,false,false,passwordreq,passwordnotvalid,null,RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$'),false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
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

                    border: underlineborderstyle,
                    labelText: confirmpassword,
                    labelStyle: TextStyle(fontSize: 18,fontFamily: 'Lato-Regular',color:greytext),
                    errorText: conpassErrorValid ?conpass.isEmpty ? reenterpassword : passwordnotmatch : null,
                    // errorStyle: TextStyle(color: Colors.red),

                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    if(value.isNotEmpty) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        setState(() {
                          conpassErrorValid = true;
                          conpass=value;
                        });
                      } else {
                        setState(() {
                          conpassErrorValid = false;
                          conpass=value;
                        });
                      }
                    }else{
                      setState(() {
                        conpass='';
                        conpassErrorValid=true;
                      });
                    }

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
                  validator: ( value) {
                    if (value!.isEmpty) {
                      return reenterpassword;
                    }
                    if (passwordController.text != confirmPasswordController.text) {
                      return passwordnotmatch;
                    }
                    return null;
                  },
                ),
                        SizedBox(height:getDeviceheight(context, 0.02),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Text(male,style:TextStyle(fontSize: 14,fontFamily: 'ProximaNova-Medium',)),
                          Transform.scale(
                            scale: 1.5,
                          child:Radio<SingingCharacter>(
                              value: SingingCharacter.Female,
                              groupValue: _character,
                              activeColor:Colors.red,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              }
                          ),
                          ),
                          Text(female,style:TextStyle(fontSize: 14,fontFamily: 'ProximaNova-Medium',))
                        ],
                      ),
                        SizedBox(height:getDeviceheight(context, 0.02),),
                        CustomButtom(false,register, getDevicewidth(context, 0.9),
                            getDeviceheight(context, 0.07), () {
                              formkey.currentState!.validate();
                             // final form = formkey.currentState;
                             // if (form!.validate()) {
                             //   print('validatetrue');
                             // }
                            },false),
                        SizedBox(height:getDeviceheight(context, 0.01),),
                        TextButton(onPressed: (){}, child:Text(login,style: titleStyleblack,))
                      ],
                    ),
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
