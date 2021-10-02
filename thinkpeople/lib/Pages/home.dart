import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:thinkpeople/Buttons/custom_btn.dart';
import 'package:thinkpeople/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
              child: SvgPicture.asset(
                "assets/woman_pin.svg",
                height: 200,
              ),
            ),
            Text("Discover New Places",
                style: TextStyle(
                    color: color1,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Vulputate vitae",
                  style: TextStyle(color: color2, letterSpacing: 5)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("enim .Vulputate",
                  style: TextStyle(color: color2, letterSpacing: 5)),
            ),
            Text("vitae", style: TextStyle(color: color2, letterSpacing: 5)),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: customBtn(color1, "G E T   S T A R T E D", "/signIn")),
          ],
        ),
      ),
    );
  }
}
