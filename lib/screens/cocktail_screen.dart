import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';

class CocktailScreen extends StatefulWidget {
  const CocktailScreen({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  State<CocktailScreen> createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            Hero(
              tag: 'cocktail-image-${widget.cocktail.idDrink}',
              child: Image.network(
                widget.cocktail.strDrinkThumb,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.cocktail.strCategory),
                Text(widget.cocktail.strDrink,
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 16),
                Text(
                  widget.cocktail.strInstructions,
                ),
              ],
            )
          ]),
        ));
  }
}
