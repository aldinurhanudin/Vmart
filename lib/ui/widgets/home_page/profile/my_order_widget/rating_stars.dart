import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vmart/shared/shared.dart';

class RatingStars extends StatelessWidget {
  final double rate;

  RatingStars(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(3),
      child: Row(
          children: List<Widget>.generate(
                5,
                (index) => Icon(
                  (index < numberOfStars)
                      ? MdiIcons.star
                      : MdiIcons.starOutline,
                  size: 16,
                  color: Colors.amber,
                ),
              ) +
              [
                SizedBox(
                  width: 4,
                ),
                Text(
                  rate.toString(),
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                )
              ]),
    );
  }
}
