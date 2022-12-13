import 'package:flutter/material.dart';
import 'package:games_project/favouriteProvider.dart';
import 'favourites.dart';
import 'games.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const GameProject());
}

class GameProject extends StatefulWidget {
  const GameProject({Key? key}) : super(key: key);

  @override
  State<GameProject> createState() => _GameProjectState();
}

class _GameProjectState extends State<GameProject> {
  int _selectedIndex =
      0; //it will start with 0. index that means start with games page opening

  void onItemTapped(index) {
    //it will select index automatically
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOption = <Widget>[
    // widgetOption func provides which page is started , 0.index for games page, 1.index for favourties page
    Games(),
    Favourites(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // if you want to use provider , you should write it in changeNotifierProvider
      create: (context) => FavouriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: _widgetOption
                .elementAt(_selectedIndex), //starting page is related to index
          ),
          bottomNavigationBar: BottomNavigationBar(
            // for bottom navigation bar
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/gameIcon.png',
                    height: 30,
                    color: _selectedIndex == 0
                        ? Colors.blue
                        : Colors
                            .grey, //if you select game, its color is blue, or not it is grey
                  ),
                  label: 'Games'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.star, size: 30), label: 'Favourites')
            ],
            currentIndex: _selectedIndex,
            onTap: onItemTapped, //provides clicking
            selectedFontSize: 15,
            unselectedFontSize: 15,
            selectedIconTheme: const IconThemeData(
                color: Colors
                    .blue), //if you select star icon, its color is blue; or not its color is grey
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
