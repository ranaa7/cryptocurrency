import 'package:cryptocurrency/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class BottomNavyProvider extends ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;


  set current(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}