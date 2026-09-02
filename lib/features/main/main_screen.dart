import 'package:cool_maill_flutter/features/cart/cart_screen.dart';
import 'package:cool_maill_flutter/features/category/category_screen.dart';
import 'package:cool_maill_flutter/features/home/home_screen.dart';
import 'package:cool_maill_flutter/features/mine/mine_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   int _currentIndex = 0;
   final List<Widget> _pages = <Widget> [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    MineScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}

