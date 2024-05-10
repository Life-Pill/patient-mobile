import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patientmobileapplication/features/main_screens/camera_tab/camera_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/cart_tab/cart_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/home_tab/home_tab_screen.dart';
import 'package:patientmobileapplication/features/main_screens/other_accounts_tab/other_accounts_screen.dart';

import 'package:patientmobileapplication/features/searching/search_results/ui/search_tabs.dart';

import '../../view_profile_tab/ui/view_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("In Home Screen");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                // Home Tab
                Home(),
                // Cart Tab
                CartTabScreen(),
                // Camera Tab
                CameraTabScreen(),
                // People Tab
                OtherAccountsScreen(),
                // Profile Tab
                ViewProfileScreen(),
              ],
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), label: 'Camera'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'People'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            elevation: 5.0,
            showSelectedLabels: false,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[800],
            onTap: _onItemTapped,
            unselectedItemColor: Colors.lightBlue[100],
          ),
        ],
      ),
    );
  }
}
