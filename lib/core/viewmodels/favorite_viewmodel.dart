import 'package:products_app/core/models/product.dart';
import 'package:stacked/stacked.dart';
import '../services/local_storage_service.dart';

class FavoriteViewModel extends BaseViewModel {

  FavoriteViewModel._internal(){
    init();
  }
  static FavoriteViewModel? _instance;
  // this singleton class // one instance for app
  factory FavoriteViewModel() => _instance ??= FavoriteViewModel._internal();



  init() {
    favoritesProduct = getFavoritesProduct();
    setOnModelReadyCalled(true);
  }
  int numberFavouriteProducts=0;
  List<Product> favoritesProduct = [];


  Future<void> toggleProductInFavorite(Product product) async {
    if (FavoriteService.checkProductIsInFavorite(product)) {
      favoritesProduct.removeWhere((p) => p == product);
    } else {
      favoritesProduct.add(product);
    }
    numberFavouriteProducts=favoritesProduct.length;
    // save the updated list of favorite products to shared preferences
    await FavoriteService.saveProductsFavoriteInFavoriteList(favoritesProduct);

    notifyListeners();
  }

  // retrieve the list of favorite products
  static getFavoritesProduct() {
    return FavoriteService.getFavorites();
  }
}
