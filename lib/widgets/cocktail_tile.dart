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
          Hero(
              tag: 'cocktail-image-${cocktail.idDrink}',
              child: Image.network(
                cocktail.strDrinkThumb,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(cocktail.strDrink,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
              const SizedBox(
                height: 4,
              ),
              Text(cocktail.strCategory,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ]),
          )
        ],
      ),
    );
  }
}
