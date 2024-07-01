import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/services/cocktail_service.dart';
import 'package:flutter_cocktail/widgets/cocktail_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Cocktail> _cocktails = [
    Cocktail(
      idDrink: 5000,
    strDrink: 'Whiskey Sour', 
    strCategory: 'Cocktail', 
    strDrinkThumb: 'https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg',
    strInstructions: "Shake ingredients in a cocktail shaker with ice. Strain into glass. Garnish and serve.",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: CocktailService().getCocktails('colada'), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  } else {
                    final cocktails = snapshot.data as List<Cocktail>;
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: cocktails.length,
                      itemBuilder: (context, index) {
                        return CocktailTile(cocktail: cocktails[index]);
                      },
                    );
                  }
                }
                ),
            )
          ],
        ),
      )
    );
  }
}