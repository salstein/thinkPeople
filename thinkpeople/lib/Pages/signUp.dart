import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../color.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();


  //country and State selection results
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  bool passwordVisible = false;
  bool submitted = false;
  bool boolEmail = false,
      boolPass = false,
      boolName = false,
      boolUser = false,
      boolPhone = false,
      boolBirth = false,
      invalidError = false,
      passwordError = false;

  void _submit() async {
    setState(() {
      submitted = true;
    });

    passwordError = false;
    invalidError = false;
    //existsError=false;
    final pass = _passController.text.toString().trim();
    final email = _emailController.text.toString().trim();
    final name = _nameController.text.toString().trim();
    final username = _usernameController.text.toString().trim();
    final phone = _phoneController.text.toString().trim();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(setEmail);
    _passController.addListener(setPass);
    _nameController.addListener(setName);
    _usernameController.addListener(setUser);
    _phoneController.addListener(setPhone);
  }

  void setEmail() {
    if (_emailController.text.toString().trim() == '') {
      setState(() {
        boolEmail = false;
      });
    } else
      setState(() {
        boolEmail = true;
      });
  }

  void setPass() {
    if (_passController.text.toString().trim() == '') {
      setState(() {
        boolPass = false;
      });
    } else
      setState(() {
        boolPass = true;
      });
  }

  void setName() {
    if (_nameController.text.toString().trim() == '') {
      setState(() {
        boolName = false;
      });
    } else
      setState(() {
        boolName = true;
      });
  }

  void setPhone() {
    if (_phoneController.text.toString().trim() == '') {
      setState(() {
        boolPhone = false;
      });
    } else
      setState(() {
        boolPhone = true;
      });
  }

  void setUser() {
    if (_usernameController.text.toString().trim() == '') {
      setState(() {
        boolUser = false;
      });
    } else
      setState(() {
        boolUser = true;
      });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //decoration: BoxDecoration( image: DecorationImage(image: Svg("assets/Mask Group.svg",size: Size(150, 150), ))),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/Mask Group.svg",
                    height: 150, width: 150)
              ],
            ),
            Text("Welcome Onboard",
                style: TextStyle(
                    color: color1,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold)),
                    Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 60),
              child: Text("Vulputate vitae enim. Vulputa vitae enim.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: color2, letterSpacing: 5, fontSize: 12)),
            ),
            Flexible(child: ListView(
              children: [
            textField(_nameController, "Name"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 5.0,
              ),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                style: TextStyle(color: color1),
                decoration: InputDecoration(
                  fillColor: color3,
                  filled: true,
                  hintText: 'Email',
                  hintStyle:
                      TextStyle(color: color1, fontSize: 13, letterSpacing: 5),
                  errorText: invalidError ? 'Please enter a valid email' : null,
                  errorStyle: TextStyle(color: Colors.red, fontSize: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            textField(_phoneController, "Username"),
            passwordField(),
           Padding( padding: const EdgeInsets.only(top: 50),),
            signUp_Button(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/signIn");
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: color1, fontSize: 12),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
           ],
            ))
          ],
        ),
      ),
    );
  }

  textField(controller, hintText) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: color1),
        decoration: InputDecoration(
          fillColor: color3,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: color1, fontSize: 13, letterSpacing: 5),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color3),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color3),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      child: TextField(
        controller: _passController,
        obscureText: !passwordVisible,
        cursorColor: Colors.white,
        style: TextStyle(color: color1),
        decoration: InputDecoration(
          fillColor: color3,
          filled: true,
          hintText: 'Password',
          hintStyle: TextStyle(color: color1, fontSize: 13, letterSpacing: 5),
          errorText: passwordError ? 'Weak Password! Min 6 characters' : null,
          errorStyle: TextStyle(color: color1, fontSize: 10),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color1),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color3),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color3),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          /*suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: passwordVisible ? HexColor("#E1A620") : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),*/
        ),
      ),
    );
  }

  signUp_Button() {
    return Padding(
      padding: const EdgeInsets.only(right:20, left:20),
      child: Container(
      
        decoration: BoxDecoration(
          boxShadow: [
          //background color of box
            BoxShadow(
              color: color3,
              blurRadius: 1, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                8.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        width: double.infinity,
      
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          onPressed: (
              _submit
              ),
          color:color1,
          disabledColor: color1,
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          child: submitted
              ? SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(HexColor("#E1A620")),
                  ),
                )
              : Text(
                  'Register',
                  style: TextStyle(fontSize: 13.0, letterSpacing: 5),
                ),
        ),
      ),
    );
  }
}
