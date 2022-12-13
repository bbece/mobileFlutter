import 'package:flutter/material.dart';

// We declared a Game class to specify the standard declaration of game
class Game {
  String? name;
  int? metacritic;
  String? genre;
  Image image;
  String? description;
  String? redditUrlAuthority;
  String? redditUrlUnencodedPath;
  String? websiteUrlAuthority;
  String? websiteUrlUnencodedPath;

  Game(
      this.name,
      this.metacritic,
      this.genre,
      this.image,
      this.description,
      this.redditUrlAuthority,
      this.redditUrlUnencodedPath,
      this.websiteUrlAuthority,
      this.websiteUrlUnencodedPath);
}
