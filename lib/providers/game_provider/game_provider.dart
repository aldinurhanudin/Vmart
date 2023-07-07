import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/hidden.png";
  List<String> cards_list = [
    "assets/kangkung.png",
    "assets/VMART.png",
    "assets/kangkung.png",
    "assets/image_brokoli.png",
    "assets/paprika.png",
    "assets/VMART.png",
    "assets/paprika.png",
    "assets/image_brokoli.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
