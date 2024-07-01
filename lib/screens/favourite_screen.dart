import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Cocktail Name'),
            subtitle: Text('Category'),
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        }, 
      itemCount: 10
      ),
    );
  }
}