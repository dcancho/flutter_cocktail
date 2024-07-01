import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/screens/cocktail_screen.dart';
import 'package:flutter_cocktail/services/cocktail_service.dart';
import 'package:flutter_cocktail/widgets/cocktail_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                controller: _searchController,
                onChanged: (query) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: FutureBuilder(
                    future:
                        CocktailService().getCocktails(_searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data == null) {
                        return Center(
                          child: Text(
                              'No cocktails named ${_searchController.text} were found.'),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error fetching data'),
                        );
                      } else {
                        final cocktails = snapshot.data as List<Cocktail>;
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.70),
                          itemCount: cocktails.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CocktailScreen(
                                              cocktail: cocktails[index])));
                                },
                                child:
                                    CocktailTile(cocktail: cocktails[index]));
                          },
                        );
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
