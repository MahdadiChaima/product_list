import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateBottomBarIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
