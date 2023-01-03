import 'package:flutter/material.dart';

// use this class for dynamic size
class SizeApps{
  // this constructor prevents instantiation and extension.
  SizeApps._();

  //Size based on width of screen
  //{:size} = 0.1 - 1
  static double width(BuildContext context, {required double size}){
    var sized = MediaQuery.of(context).size.width * size;
    return sized;
  }

  //Size based on height of screen
  //{:size} = 0.1 - 1
  static double height(BuildContext context, {required double size}){
    var sized = MediaQuery.of(context).size.height * size;
    return sized;
  }
}

