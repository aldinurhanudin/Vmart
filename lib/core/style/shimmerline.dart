import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:shimmer/shimmer.dart';

Widget ShimmerLine({required double width, double height = 15}){
  return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(3.0)
        ),
      )
  );
}