import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';
import 'package:stacked/stacked.dart';

import '../../core/services/local_storage_service.dart';
import '../../core/viewmodels/favorite_viewmodel.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  // Constructor to receive a product object
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.asset(
              product.image,
              height: 200.0,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 24.0),
            Text(
              product.name,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(height: 16.0),
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [Text(
              "price: ${product.price}\$",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
              ViewModelBuilder<FavoriteViewModel>.reactive(
                  viewModelBuilder: () => FavoriteViewModel(),
                  disposeViewModel: false,
                  builder: (context, favoriteModel, child) {
                    final inFavorite = FavoriteService.checkProductIsInFavorite(product);

                    return IconButton(
                      icon: inFavorite
                          ? const Icon(
                        Icons.favorite_outlined,
                        color: Colors.blue,
                      )
                          : const Icon(
                        Icons.favorite_border,
                      ),
                      onPressed: () {
                        favoriteModel.toggleProductInFavorite(
                            product); // Add or remove the product from the user's favorites list
                      },
                    );
                  }),
              ],),

            const SizedBox(height: 16.0),
            Text(
              'Description: ${product.description}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
