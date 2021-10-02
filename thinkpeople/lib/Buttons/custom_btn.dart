import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thinkpeople/color.dart';

customBtn(color, text, goto) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(goto);
    },
    child: Container(
      height: 50.0,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
         boxShadow: [
                  BoxShadow(
                    color: color2,
                    offset: Offset(2.0, 2.0), //(x,y)
                    blurRadius: 2.0,
                    spreadRadius: 0.0
                  ),
                ],
              
          color: color,
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(5.0)),
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 24.0,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 15, ),
      ),
    ),
  );
}


