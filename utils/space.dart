import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:music4mood/utils/colors.dart';

Widget addVerticalSpace(double height){
  return SizedBox(
    height:height,
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
    width:width,
  );
}

Widget decoratedBoxRound(double height,double width,Color? color){
  return SizedBox(
    height:height,
    child:Container(
      decoration:BoxDecoration(
        color:color,
        border:Border.all(color:grey),
        borderRadius:BorderRadius.circular(5.0)
      ),
    ),
  );
}