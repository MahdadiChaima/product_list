import 'package:flutter/material.dart';
import 'package:products_app/core/viewmodels/favorite_viewmodel.dart';
import 'package:products_app/ui/views/product_list_viewer.dart';
import 'package:products_app/ui/views/search_screen.dart';
import 'package:stacked/stacked.dart';
import '../../core/viewmodels/product_list_viewmodel.dart';
import '../widgets/widgets.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 10.0, bottom: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 28,
                color: Colors.deepOrange,
              ),
              onPressed: () => navigateTo(context, SearchScreen()),
            ),
          ),
        ),
        ViewModelBuilder<FavoriteViewModel>.reactive(
            viewModelBuilder: () => FavoriteViewModel(),
            builder: (context, model, child) =>Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(children: [
                Text( 'Number of favourite products:',style: TextStyle(fontWeight: FontWeight.w500,) ),
                Text( '${model.numberFavouriteProducts}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange), )
              ],),
            )
               ),

                 
        ViewModelBuilder<ProductListViewModel>.reactive(
            viewModelBuilder: () => ProductListViewModel(),
            builder: (context, model, child) =>
            // Widget that displays a list of products
            ProductsListViewer(
                  isBusy: model.isBusy,
                  modelProducts: model.products,
                ))
      ],
    );
  }
}
