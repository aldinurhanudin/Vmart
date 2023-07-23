import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmart/shared/shared.dart';

Widget OrderPlaceDetails(
    {required String title1,
    required String title2,
    required String d1,
    required String d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "$title1",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          
            SizedBox(width: 80),
            Expanded(
              child: Text(
                "$d1",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "$title2",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(width: 80),
            Expanded(
              child: Text(
                "$d2",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
