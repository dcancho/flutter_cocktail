import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/models/favourite.dart';
import 'package:flutter_cocktail/persistence/favourite_dao.dart';
import 'package:flutter_cocktail/screens/cocktail_screen.dart';
import 'package:flutter_cocktail/services/cocktail_service.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: FutureBuilder<List<Favourite>>(
          future: FavouriteDao().getFavourites(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FavouriteTile(favourite: snapshot.data![index]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class FavouriteTile extends StatelessWidget {
  const FavouriteTile({super.key, required this.favourite});
  final Favourite favourite;

  onPressed(BuildContext context) async {
    Cocktail cocktail = await CocktailService().getCocktail(favourite.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CocktailScreen(cocktail: cocktail),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(favourite.name),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            onPressed(context);
          },
        ));
  }
}
