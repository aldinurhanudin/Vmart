import 'package:flutter/material.dart';
import 'package:vmart/shared/shared.dart';

Widget orderStatus({data, icon, color, title, showDone}) {
  return ListTile(
    leading: Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: color,

          // width: 2.0,
        ),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ),
    trailing: SizedBox(
      height: 100,
      width: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: secondaryTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          showDone
              ? const Icon(
                  Icons.done,
                  color: Colors.red,
                )
              : Container(),
        ],
      ),
    ),
  );
}
