import 'package:flutter/material.dart';
import 'package:products_app/core/viewmodels/product_list_viewmodel.dart';
import 'package:products_app/ui/views/product_list_viewer.dart';
import 'package:stacked/stacked.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: ViewModelBuilder<ProductListViewModel>.reactive(
        viewModelBuilder: () => ProductListViewModel(),
        builder: (context, model, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search text field
              TextField(
                onChanged: (value) {
                  model.search(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Display search results
              ProductsListViewer(
                isBusy: model.isBusy,
                modelProducts:model.searchProducts,
              )
            ],
          ),
        ),
      ),
    );
  }
}
