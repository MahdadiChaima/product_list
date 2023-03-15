import 'package:products_app/core/models/product.dart';
import 'package:stacked/stacked.dart';

class ProductListViewModel extends BaseViewModel {
  List<Product> _products = [
    Product(
        name: '2023 Smart Watch 8 Ultra S8',
        price: 9.0,
        image: 'assets/images/1.jpg',
        description: 'description 1'),
    Product(
        name: 'Kronus 2023 Smart Watch 8 Ultra S8',
        price: 10.0,
        image: 'assets/images/2.jpg',
        description: 'description 2'),
    Product(
        name: 'SENBONO P8',
        price: 15.0,
        image: 'assets/images/3.jpeg',
        description: 'description 3'),
  ];

  List<Product> get products => _products;
//initial value of favorite product and make it all false

  List<Product> get filteredProducts {
    return _products;
  }

  List<Product> searchProducts = [];
  void search(String query) {
    searchProducts = _products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
