import 'package:flutter/material.dart';
import 'package:stream_music/model/colors.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'images/img.png',
            fit: BoxFit.fill,
          )),
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              spreadRadius: -2,
              blurRadius: 10)
        ],
      ),
    );
  }
}
