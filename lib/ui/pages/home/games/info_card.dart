import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget info_card(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        // horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
