import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double buttonWidth = 80;
  
  String holder(){
    return "";
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Zot Rides',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 20),
            Text(
              "Affordable & Safe Student Rides",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary)
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/zot.png',
              width: 300,
              height: 300),
            ElevatedButton(
              onPressed: holder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary, // Text color
                // minimumSize: Size(buttonWidth, 60), // 👈 Fixed width & height

                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: const TextStyle(fontSize: 30),
              ),
              child: const Text("Ride"),
            ), 
            SizedBox(height: 20,),
            OutlinedButton(
              onPressed: holder,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green[800],
                side: BorderSide(color: Colors.green[800]!, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: const TextStyle(fontSize: 30),
              ),
              child: const Text("Drive"),
            ),
          ],
        ),
      ),
    );
  }
}