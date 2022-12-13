import 'package:flutter/material.dart';
import 'package:games_project/favouriteProvider.dart';
import 'package:provider/provider.dart';
import 'Game.dart';
import 'gamePage.dart';
import 'gameList.dart';

void main() => runApp(const Favourites());

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliverAppBar_(),
    );
  }
}

class SliverAppBar_ extends StatefulWidget {
  const SliverAppBar_({super.key});

  @override
  State<SliverAppBar_> createState() => _SliverAppBarState();
}

class _SliverAppBarState extends State<SliverAppBar_> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  List<Game> games = List.from(gameList);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    List<Game> favouriteGames = provider
        .favouriteGame; //it enables that communication between each stateful states that  is related to favourites
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            //sliver enables collapsing, fitting on screen etc. features with properties such as pinned,snap,floating
            backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.only(left: 16),
              title: favouriteGames
                      .isEmpty //ternary operators , it is same if block
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Favourites",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Favourites (${favouriteGames.length})",
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ),
          SliverList(
            //scrolling list and it provides that each container create when new game is added like for loop
            delegate: SliverChildBuilderDelegate(
              childCount: favouriteGames.isEmpty ? 1 : favouriteGames.length,
              (BuildContext context, int index) {
                return favouriteGames.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 36),
                        child: Center(
                            child: Text(
                          "There is no favourites found",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                      )
                    : Container(
                        color: const Color.fromRGBO(224, 224, 224, 1.0),
                        height: 120.0,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    GamePage(game: favouriteGames[index]),
                              ),
                            );
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.zero)),
                          child: Container(
                            //game info container
                            height: 120,
                            color: index % 2 ==
                                    0 // if index can divide 2 , container background is like first step, if not it is like second step
                                ? const Color.fromARGB(255, 230, 230, 230)
                                : Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              // because it has row structure
                              children: [
                                Container(
                                    height: 100,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: favouriteGames[index].image),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      150, //it provides that image can cover over up to page width
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 65,
                                        child: Text(
                                          '${favouriteGames[index].name}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'metacritic: ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                '${favouriteGames[index].metacritic}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          Text(
                                            '${favouriteGames[index].genre}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          )
        ]),
      ),
    );
  }
}
