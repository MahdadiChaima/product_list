import 'package:flutter/material.dart';
import 'package:products_app/core/viewmodels/favorite_viewmodel.dart';
import 'package:products_app/ui/views/product_list_viewer.dart';
import 'package:stacked/stacked.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => FavoriteViewModel (),
      builder: (context, favoriteModel, child) {
        // Create a column widget to display the list of favorite products
        return Column(
          children: [
            // Use the productItem widget to display the list of favorite products
            ProductsListViewer(
              isBusy: favoriteModel.isBusy,
              modelProducts: favoriteModel.favoritesProduct,
            ),
          ],
        );
      },
    );
  }
}
