import 'package:flutter/material.dart';
import 'package:products_app/core/viewmodels/bottom_nav_bar_viewmodel.dart';
import 'package:products_app/ui/views/favorites_screen.dart';
import 'package:products_app/ui/views/product_list_screen.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavBarViewModel>.reactive(
      viewModelBuilder: () => BottomNavBarViewModel(),
      builder: (context, model, child) => Scaffold(
          body: IndexedStack(
            index: model.currentIndex, // Set the index of the currently selected tab based on the value in the bottom navigation bar
            children:const [
              ProductListScreen(), // Show the product list screen
             FavoriteScreen(), // Show the favorites screen
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              items:const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
              ],
              currentIndex: model.currentIndex,// Set the currently selected tab based on the value in the bottom navigation bar
              onTap: (index) {
                // Update the currently selected tab in the bottom navigation bar  when a new tab is selected
               model.updateBottomBarIndex(index);
              })),
    );
  }
}
