import 'dart:developer';

import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CocktailService {
  final String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';
  CocktailService._internal();

  static final CocktailService _instance = CocktailService._internal();

  factory CocktailService() {
    return _instance;
  }

  Future<List<Cocktail>> getCocktails(String query) async {
    final requestUrl = '$baseUrl/search.php?s=$query';

    log(requestUrl);

    final response = await http.get(
      Uri.parse(requestUrl),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load cocktails');
    }

    final json = response.body;
    final data = jsonDecode(json) as Map<String, dynamic>;
    final drinks = data['drinks'] as List;
    return drinks.map((json) => Cocktail.fromJson(json)).toList();
  }
}