import 'package:flutter/material.dart';

class RideInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Info'),
        backgroundColor: const Color(0xFFD5E2D5),
        foregroundColor: const Color(0xFF204E34),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              size: 100,
              color: Color(0xFF204E34),
            ),
            SizedBox(height: 20),
            Text(
              'Ride Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'View your current and past rides',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
