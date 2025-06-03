import 'package:flutter/material.dart';
import './pages/home.dart';
import '/components/navbar.dart';
import './pages/rides.dart';
import './pages/driver_page.dart';
import './pages/ride_info_page.dart';
import './pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zot Rides',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 60),
          headlineMedium: TextStyle(fontSize: 25),
        )
      ),
      home: const HomePage(), // Start with HomePage (no navbar)
      routes: {
        '/navbar': (context) => const CustomNavBar(),
        '/rider': (context) => RidesPage(),
        '/driver': (context) => DriverPage(),
        '/rideInfo': (context) => RideInfoPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

