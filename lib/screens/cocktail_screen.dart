import 'package:flutter/material.dart';

class CocktailScreen extends StatefulWidget {
  const CocktailScreen({super.key});

  @override
  State<CocktailScreen> createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Cocktail Screen'),
    );
  }
}