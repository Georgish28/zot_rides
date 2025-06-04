import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/post_drive.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_outline, size: 100, color: Color(0xFF204E34)),
            const SizedBox(height: 20),
            const Text(
              'Ready to drive?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start earning by giving rides to fellow Anteaters',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF204E34),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDrivePage()),
                );
              },
              child: const Text('Post a Ride'),
            ),
          ],
        ),
      ),
    );
  }
}
