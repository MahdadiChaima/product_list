import 'dart:convert';

import 'package:products_app/core/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String FAVORITE_LIST_KEY= 'favorite_list';

class FavoriteService {
  static late SharedPreferences  prefs;

  // Initializes SharedPreferences
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Saves list of favorite products to SharedPreferences
  static Future saveProductsFavoriteInFavoriteList(List<Product> products) async {
    List<String> encodedProducts =
    products.map((product) => jsonEncode(product.toJson())).toList();
    print(encodedProducts);
    await prefs.setStringList(FAVORITE_LIST_KEY, encodedProducts);
  }

  // Retrieves list of favorite products from SharedPreferences
  static List<Product> getFavorites() {
    final encodedProducts = prefs.getStringList(FAVORITE_LIST_KEY) ?? [];
    final products = encodedProducts
        .map((product) => Product.fromJson(json.decode(product)))
        .toList();
    return products;
  }

  static bool checkProductIsInFavorite(Product product){
    return getFavorites().any((e) => e==product );
  }
}
