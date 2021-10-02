import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../color.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = false;
  var submitted = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool boolEmail = false;
  bool boolPass = false;
  void _submit() async {}

  @override
  void initState() {
    super.initState();
    _emailController.addListener(setEmail);
    _passController.addListener(setPass);
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

  void invalidEmail() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.grey[800],
              ),
              height: 190,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            'Incorrect Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 25, top: 15),
                          child: Text(
                            "The email you entered doesn't appear to belong to an account. Please check your email and try again",
                            style: TextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0,
                    height: 0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void invalidPass() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.grey[800],
              ),
              height: 170,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            'Incorrect Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 25, top: 15),
                          child: Text(
                            'The password you entered is incorrect. Please try again.',
                            style: TextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0,
                    height: 0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //decoration: BoxDecoration( image: DecorationImage(image: Svg("assets/Mask Group.svg",size: Size(150, 150), ))),
            child: Column(children: [
      Row(
        children: [
          SvgPicture.asset("assets/Mask Group.svg", height: 150, width: 150)
        ],
      ),
      Text("Welcome Onboard",
          style: TextStyle(
              color: color1, letterSpacing: 5, fontWeight: FontWeight.bold)),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SvgPicture.asset(
          "assets/woman_withCar.svg",
          height: 200,
        ),
      ),
      
    
       Column(children: <Widget>[
         
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: color1),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: color3,
                    filled: true,
                    hintText: 'Username',
                    hintStyle: TextStyle(color: color1, fontSize: 13, letterSpacing: 5),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:color3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextField(
                  onChanged: (text) {
                    if (text.length == 0) {
                      boolPass = false;
                    } else
                      boolPass = true;
                  },
                  controller: _passController,
                  obscureText: !passwordVisible,
                  style: TextStyle(color: color1),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: color3,
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: color1, fontSize: 13, letterSpacing: 5),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: passwordVisible ? color1 : Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
                GestureDetector(
                      onTap: () {
                        Get.toNamed("/signIn");
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: color2, fontSize: 10),
                      ),
                    ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  onPressed:
                      (boolPass == true && boolEmail == true) ? _submit : null,
                  color: Colors.white,
                  disabledColor: color1,
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
                                AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        )
                      : Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 13.0,
                            letterSpacing: 5,
                            color: Colors.white
                          ),
                        ),
                ),
              ),
              SizedBox(height: 8.0),
           
               
                  
                 
                    Row(
                      children: [Text("Don't have an account?", style: TextStyle()),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/signUp");
                          },
                          child: Text(
                            "Sign ",
                            style: TextStyle(color: color1, fontWeight:FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Up",
                            style: TextStyle(color: color1,),
                          ),
                      ],
                    ),
                
        
            ],
          ),
        ]),
   
    ])));
  }
}
