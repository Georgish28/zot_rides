import 'package:flutter/material.dart';
import '/pages/home.dart';

class DriverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become a Driver'),
        backgroundColor: const Color(0xFFD5E2D5),
        foregroundColor: const Color(0xFF204E34),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // Navigate back to home page
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 100, color: Color(0xFF204E34)),
            SizedBox(height: 20),
            Text(
              'Ready to drive?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Start earning by giving rides to fellow Anteaters',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
