import 'package:cryptocurrency/screens/detailed_screen.dart';
import 'package:cryptocurrency/screens/home_screen.dart';
import 'package:cryptocurrency/screens/search_screen.dart';
import 'package:cryptocurrency/view_model/provider/bottom_navy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottomscreen extends StatelessWidget {
  Bottomscreen({Key? key}) : super(key: key);
  var currentTab = [
    Homescreen(),
    Searchscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavyProvider>(builder: (context,provider,child ){
      // var provider1 = Provider.of<ControlProvider>(context);
      return Scaffold(
        body: currentTab[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.current = index;
              },
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.red,
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
      backgroundColor: Colors.purple,
      ),
    ])
      );
    });
  }
}
