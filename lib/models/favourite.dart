import 'package:flutter_cocktail/models/cocktail.dart';

class Favourite {
  final int id;
  final String name;
  final String image;

  Favourite({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  Map<String, dynamic> toMapFromCocktail(Cocktail cocktail) {
    return {
      'id': cocktail.idDrink,
      'name': cocktail.strDrink,
      'image': cocktail.strDrinkThumb,
    };
  }
}