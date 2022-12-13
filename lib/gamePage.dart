import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:games_project/favouriteProvider.dart';
import 'package:provider/provider.dart';
import 'Game.dart';

import "package:url_launcher/url_launcher.dart";

class GamePage extends StatefulWidget {
  Game game;
  GamePage(
      {required this.game}); // it enables that going to gamepage and makes games which game page has available

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(
        context); //it enables that communication between each stateful states that  is related to favourites
    List<Game> favouriteGame =
        provider.favouriteGame; // it can pull list thanks to provider
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 100,
          leading: TextButton(
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 20.5,
                  color: Colors.blue,
                ),
                Text(
                  "Games",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: -0.41,
                      color: Color.fromRGBO(0, 122, 255, 1)),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context); // enables return last page
            },
          ),
          actions: [
            TextButton(
              onPressed: (() {
                if (favouriteGame.contains(widget.game)) {
                  //adding situation happening before,anymore text button turns removing which includes alertdialog
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Are you sure?"),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  provider.removeFavourites(widget.game);
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  provider.addFavourites(widget.game);
                }
              }),
              child: Text(
                favouriteGame.contains(widget
                        .game) //if this game was added before, textbutton's text is remove
                    ? "Remove Favourite"
                    : "Add Favourite",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: -0.41,
                    color: Color.fromRGBO(0, 122, 255, 1)),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          //using scrollview because we used expansion panel so when panel is being opened , other contents doesnt fit on the screen but thanks to this,it is fixed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 291,
                          child: widget.game.image), //Container
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            // it enables text which is fitted on the image more visuable
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(5, 0, 0, 0),
                              Color.fromARGB(255, 0, 0, 0),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "${widget.game.name}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.38,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionPanelList(
                      //like collapsible panel
                      expansionCallback: (panelIndex, isExpanded) {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      children: [
                        ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Game Description",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text("${widget.game.description}"),
                            ),
                            isExpanded: isOpen,
                            canTapOnHeader: true,
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 0.92))
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                        //when using urlLaunchable, it should been used
                        text: TextSpan(children: [
                      TextSpan(
                        text: "View Reddit",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Uri url = Uri.https(
                                "${widget.game.redditUrlAuthority}",
                                "${widget.game.redditUrlUnencodedPath}");
                            var urllaunchable = await canLaunchUrl(
                                url); //canLaunch is from url_launcher package
                            if (urllaunchable) {
                              await launchUrl(
                                  url); //launch is from url_launcher package to launch URL
                            } else {
                              print("URL can't be launched.");
                            }
                          },
                      ),
                    ])),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "View Website",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 17),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Uri url = Uri.https(
                                    "${widget.game.websiteUrlAuthority}",
                                    "${widget.game.websiteUrlUnencodedPath}");
                                var urllaunchable = await canLaunchUrl(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  await launchUrl(Uri.https(
                                      "${widget.game.websiteUrlAuthority}",
                                      "${widget.game.websiteUrlUnencodedPath}")); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
