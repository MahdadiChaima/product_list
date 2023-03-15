
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/ui/views/product_detail_screen.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/product.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/viewmodels/favorite_viewmodel.dart';
import '../widgets/widgets.dart';

class ProductsListViewer extends StatelessWidget {
  final bool isBusy;
  final List<Product> modelProducts;

  const ProductsListViewer(
      {Key? key, required this.isBusy, required this.modelProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isBusy
          ? Center(
          child:
          CircularProgressIndicator()) // Display a loading spinner if data is still being fetched

          : ViewModelBuilder<FavoriteViewModel>.reactive(
          disposeViewModel: false, //because is singleton class
          viewModelBuilder: () => FavoriteViewModel(),
          builder: (context, favoriteModel, child) => ListView.builder(
            itemCount: modelProducts.length,
            itemBuilder: (context, index) {
              final product = modelProducts[index];
              final inFavorite =
              FavoriteService.checkProductIsInFavorite(product);
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 50.0,
                      ),
                      title: Text(product.name),
                      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${product.price}'),
                          TextButton(onPressed:()=> navigateTo(
                              context,
                              ProductDetailScreen(
                                product: product,
                              )), child: Text("Show more",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 11,
                            decoration: TextDecoration.underline,
                          ),))
                        ],
                      ),
                      trailing: IconButton(
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
                      ),
                    )),
              );
            },
          )),
    );
  }
}