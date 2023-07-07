import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmart/shared/shared.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/VMART.png',
              width: 250,
            ),
            Text(
              'Total Nilai :',
              style: TextStyle(color: blackColor, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              radius: 70,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result == questionLength / 2
                      ? 'Ayo sedikit lagi'
                      : result < questionLength / 2
                          ? 'Coba lagi'
                          : 'Kerja bagus',
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
                Icon(
                  result == questionLength / 2
                      ? Icons.sports_handball
                      : result < questionLength / 2
                          ? Icons.refresh
                          : Icons.thumb_up,
                  color: blackColor,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                'Main lagi',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Keluar',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 23,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
