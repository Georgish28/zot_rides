import 'package:flutter/material.dart';
import '/pages/rides.dart';
import '/pages/driver_page.dart';
import '/pages/ride_info_page.dart';
import '/pages/profile.dart';

class CustomNavBar extends StatefulWidget {
  final int initialIndex; // Add this to set which tab to start on
  
  const CustomNavBar({super.key, this.initialIndex = 0});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late int _selectedIndex;

  // List of pages to display in the navbar
  final List<Widget> _pages = [
    RidesPage(),     // idx 0
    DriverPage(),    // idx 1
    RideInfoPage(),  // idx 2
    ProfilePage(),   // idx 3
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set initial index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF204E34), width: 1)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFD5E2D5), // soft green background
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF204E34), // dark green
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Rider',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Driver',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Ride Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
