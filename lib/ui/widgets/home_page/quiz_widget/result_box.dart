import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmart/shared/shared.dart';

class ResultBox extends StatefulWidget {
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
  State<ResultBox> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Color circleColor;
    Color textColor;
    String text;
    IconData icon;

    if (widget.result < 300) {
      circleColor = incorrect;
      textColor = incorrect;
      text = 'Coba lagi';
      icon = Icons.refresh;
    } else {
      circleColor = correct;
      textColor = blackColor;
      text = 'Kerja bagus';
      icon = Icons.thumb_up;
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Nilai :',
            style: TextStyle(color: blackColor, fontSize: 22),
          ),
          SizedBox(height: 10),
          CircleAvatar(
            child: Text(
              '${widget.result}/${widget.questionLength}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            radius: 70,
            backgroundColor: circleColor,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
              Icon(
                icon,
                color: textColor,
                size: 24.0,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Selamat Kamu dapat '),
                Text(
                  '${widget.result}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                Text(' Koin!'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(
                    AnimationController(
                      vsync: this,
                      duration: Duration(seconds: 2),
                    )..repeat(),
                  ),
                  child: Transform.scale(
                    scale: 5,
                    child: Image.asset(
                      'assets/sunrey.png',
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/koin.png',
                width: 50,
                height: 50,
              ),
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: widget.onPressed,
            child: Text(
              'Main lagi',
              style: TextStyle(
                color: primaryColor,
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(height: 10),
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
    );
  }
}
