import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: "Montserrat",
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/signIn', page: () => LogIn()),
          GetPage(name: '/signUp', page: () => SignUp()),



        ],
        routingCallback: (routing) {
         
        });
  }
}
