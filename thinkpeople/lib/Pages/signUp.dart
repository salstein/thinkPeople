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
  final _birthController = TextEditingController();
  final _CountryController = TextEditingController();
  final _religionController = TextEditingController();
  final _chnController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalController = TextEditingController();

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
      boolStreet = false,
      boolPostal = false,
      boolCHN = false,
      boolReligion = false,
      boolCountry = false,
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
    final birth = _birthController.text.toString().trim();
    final Country = _CountryController.text.toString().trim();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(setEmail);
    _passController.addListener(setPass);
    _nameController.addListener(setName);
    _usernameController.addListener(setUser);
    _phoneController.addListener(setPhone);
    _birthController.addListener(setBirth);
    _CountryController.addListener(setCountry);
    _religionController.addListener(setReligion);
    _chnController.addListener(setCHN);
    _streetController.addListener(setStreet);
    _postalController.addListener(setPostal);
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

  void setBirth() {
    if (_birthController.text.toString().trim() == '') {
      setState(() {
        boolBirth = false;
      });
    } else
      setState(() {
        boolBirth = true;
      });
  }

  void setCountry() {
    if (_CountryController.text.toString().trim() == '') {
      setState(() {
        boolCountry = false;
      });
    } else
      setState(() {
        boolCountry = true;
      });
  }

  void setReligion() {
    if (_religionController.text.toString().trim() == '') {
      setState(() {
        boolReligion = false;
      });
    } else
      setState(() {
        boolReligion = true;
      });
  }

  void setCHN() {
    if (_chnController.text.toString().trim() == '') {
      setState(() {
        boolCHN = false;
      });
    } else
      setState(() {
        boolCHN = true;
      });
  }

  void setStreet() {
    if (_streetController.text.toString().trim() == '') {
      setState(() {
        boolStreet = false;
      });
    } else
      setState(() {
        boolStreet = true;
      });
  }

  void setPostal() {
    if (_postalController.text.toString().trim() == '') {
      setState(() {
        boolPostal = false;
      });
    } else
      setState(() {
        boolPostal = true;
      });
  }

// The Nationality and state of Origin Details

  String country = "";
  String state = "";
  String city = "";
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
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SvgPicture.asset(
                "assets/woman_pin.svg",
                height: 200,
              ),
            ),
            textField(_nameController, "Full Name *"),
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
                  fillColor: color2,
                  filled: true,
                  hintText: 'Email Address',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  errorText: invalidError ? 'Please enter a valid email' : null,
                  errorStyle: TextStyle(color: Colors.red, fontSize: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
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
            passwordField(),
            textField(_phoneController, "Phone Number *"),
            textField(_birthController, "DOB (DD/MM/YY)"),
            textField(_CountryController, "Country/Region *"),
            signUp_Button(),
            Divider(
              color: Colors.grey,
              thickness: 0,
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Get.toNamed("/signIn");
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(color: color2),
                ),
              ),
            )
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
          fillColor: color2,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
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
          fillColor: color2,
          filled: true,
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          errorText: passwordError ? 'Weak Password! Min 6 characters' : null,
          errorStyle: TextStyle(color: color1, fontSize: 10),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: passwordVisible ? HexColor("#E1A620") : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  signUp_Button() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: (boolPass != false &&
                boolEmail != false &&
                boolName != false &&
                boolCountry != false &&
                boolBirth != false &&
                boolPhone &&
                boolName != false)
            ? _submit
            : null,
        color: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white60,
        textColor: Colors.black,
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
      ),
    );
  }
}
