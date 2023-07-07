import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vmart/providers/game_provider/game_provider.dart';
import 'package:vmart/ui/pages/home/games/info_card.dart';

import '../../../../shared/shared.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  TextStyle whiteText = TextStyle(color: Colors.white);
  Game _game = Game();

  int percobaan = 0;
  int skor = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  void checkGameCompletion() {
    if (skor == 400) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permainan Selesai'),
            content: Text('Anda telah menyelesaikan permainan!'),
            actions: [
              TextButton(
                child: Text(
                  'Ulangi Lagi',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _game.initGame();
                    percobaan = 0;
                    skor = 0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Vmart Games',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.black,
            height: 1.0,
            thickness: 1.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: header(),
      body: Column(
        children: [
          Image.asset(
            'assets/VMART.png',
            width: 213,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              info_card("Percobaan", "$percobaan"),
              info_card("Skor", "$skor"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              itemCount: _game.gameImg!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(_game.matchCheck);
                    setState(() {
                      percobaan++;
                      _game.gameImg![index] = _game.cards_list[index];
                      _game.matchCheck.add({index: _game.cards_list[index]});
                      print(_game.matchCheck.first);
                    });
                    if (_game.matchCheck.length == 2) {
                      if (_game.matchCheck[0].values.first ==
                          _game.matchCheck[1].values.first) {
                        print("true");

                        skor += 100;
                        _game.matchCheck.clear();
                        checkGameCompletion();
                      } else {
                        print("false");

                        Future.delayed(Duration(milliseconds: 500), () {
                          print(_game.gameColors);
                          setState(() {
                            _game.gameImg![_game.matchCheck[0].keys.first] =
                                _game.hiddenCardpath;

                            _game.gameImg![_game.matchCheck[1].keys.first] =
                                _game.hiddenCardpath;
                            _game.matchCheck.clear();
                          });
                        });
                      }
                    }
                  },
                  child: Container(
                    // padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(_game.gameImg![index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
