import 'package:flutter/material.dart';
import 'Game.dart';

class GameInfo extends StatefulWidget {
  //declaration game class , use it in so much areas
  Game game;
  GameInfo({required this.game});

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
