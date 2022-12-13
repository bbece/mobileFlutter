import 'package:flutter/material.dart';
import 'Game.dart';

// declaration the list of default games
List<Game> gameList = [
  Game(
      "Grand Theft Auto V",
      96,
      "Action, Shooter",
      Image.asset(
        'assets/images/gta5.jpg',
        fit: BoxFit.cover,
      ),
      "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update.",
      "www.reddit.com",
      "/r/GrandTheftAutoV/",
      "www.rockstargames.com",
      "/gta-v"),
  Game(
      "Portal 2",
      95,
      "Action, Puzzle",
      Image.asset('assets/images/portal2.jpg', fit: BoxFit.cover),
      "Portal 2 is a 2011 puzzle-platform video game developed by Valve for Windows, Mac OS X, Linux, PlayStation 3, and Xbox 360. The digital PC version is distributed online by Valve's Steam service, while all retail editions were distributed by Electronic Arts. A port for the Nintendo Switch was included as part of Portal: Companion Collection.",
      "www.reddit.com",
      "/r/Portal/",
      "www.thinkwithportals.com",
      "/media_19.php"),
  Game(
      "Witcher 3: The Wild Hunt",
      89,
      "Action, Puzzle",
      Image.asset('assets/images/witcher3.jpeg', fit: BoxFit.cover),
      "The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by CD Projekt. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third game in The Witcher video game series, played in an open world with a third-person perspective. The games follow the The Witcher series of fantasy novels written by Andrzej Sapkowski.",
      "www.reddit.com",
      "/r/Witcher3/",
      "www.thewitcher.com",
      "/en"),
  Game(
      "Left 4 Dead 2",
      89,
      "Action, Puzzle",
      Image.asset('assets/images/left4dead2.jpg', fit: BoxFit.cover),
      "Left 4 Dead 2 is a 2009 first-person shooter game developed and published by Valve. The sequel to Turtle Rock Studios's Left 4 Dead (2008) and the second game in the Left 4 Dead series, it was released for Microsoft Windows and Xbox 360 in November 2009, Mac OS X in October 2010, and Linux in July 2013.",
      "www.reddit.com",
      "/r/l4d2/",
      "www.l4d.com",
      "/game.html"),
];
