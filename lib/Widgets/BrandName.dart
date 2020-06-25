import 'package:flutter/material.dart';

Widget brandName(){
  return  RichText(
    text: TextSpan(

      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Get', style: TextStyle( color: Colors.deepPurple,)),
        TextSpan(text: 'Wallpaper', style: TextStyle( color: Colors.black)),

      ],
    ),
  );

}