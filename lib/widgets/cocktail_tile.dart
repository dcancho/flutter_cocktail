import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';

class CocktailTile extends StatelessWidget {
  const CocktailTile({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            cocktail.strDrinkThumb,
            height: 160,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                cocktail.strDrink,
                style: Theme.of(context).textTheme.headlineSmall 
              ),
              const SizedBox(height: 4,),
              Text(
                cocktail.strCategory,
                style: Theme.of(context).textTheme.labelLarge
              ),
            ]),
          )
        ],
      ),
    );
  }
}
