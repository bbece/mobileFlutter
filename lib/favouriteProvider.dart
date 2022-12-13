import 'package:flutter/cupertino.dart';
import 'package:games_project/Game.dart';

class FavouriteProvider extends ChangeNotifier {
  //provider is subclass of ChangeNotifier, so we should extends provider to ChangeNotifier
  List<Game> _favouriteGames = [];
  List<Game> get favouriteGame => _favouriteGames;

  void addFavourites(Game game) {
    _favouriteGames.add(game);
    notifyListeners(); //it notifies users of this provider
  }

  void removeFavourites(Game game) {
    _favouriteGames.remove(game);
    notifyListeners(); //it notifies users of this provider
  }
}
