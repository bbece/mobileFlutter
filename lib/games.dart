import 'package:flutter/material.dart';
import 'Game.dart';
import 'gamePage.dart';
import 'gameList.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  // declaration of list which is the same type with gameList
  List<Game> games = List.from(gameList);

  // searching algorithm
  void search(String value) {
    setState(() {
      games = gameList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.genre!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80, left: 16),
            child: Text(
              'Games',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // design of search box
            child: TextField(
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
                fillColor: const Color.fromARGB(255, 230, 230, 230),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Search for the games',
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[350],
          ),
          Expanded(
            // it provides scrolling
            child: games.isEmpty
                ? const Center(
                    child: Text(
                      'No game has been searched',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    //it provides list scrolling view , it has builder because we should use onpressed so that we can access specific games with materialPageroute
                    padding: const EdgeInsets.all(0),
                    itemCount: games.length,
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        //by materialpageroute navigate which page we want to go and through Navigator.push pass specifed page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(game: games[index]),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          // specified textbutton's style
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
                                child: games[index].image),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  150, //it provides that image can cover  up to page width
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 65,
                                    child: Text(
                                      '${games[index].name}',
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
                                            '${games[index].metacritic}',
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '${games[index].genre}',
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
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
                  ),
          )
        ],
      ),
    );
  }
}
