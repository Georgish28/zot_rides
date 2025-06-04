import 'package:flutter/material.dart';
import 'home.dart';
import 'ride_popup.dart'; 

class RidesPage extends StatelessWidget {
  const RidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF9DB5A5),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Rides',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D5A3D),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D5A3D),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Today Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9DB5A5),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Rides List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  RideCard(
                    destination: 'Laguna Beach',
                    time: '1:00 PM',
                    price: '\$4.99',
                    spotsLeft: 2,
                    pickupLocation: 'UTC',
                    driverName: 'Sam',
                    driverRating: 4.5,
                  ),
                  SizedBox(height: 16),
                  RideCard(
                    destination: 'Corona Del Mar',
                    time: '6:00 PM',
                    price: '\$3.24',
                    spotsLeft: 3,
                    pickupLocation: 'FP',
                    driverName: 'Sam',
                    driverRating: 4.5,
                  ),
                  SizedBox(height: 16),
                  RideCard(
                    destination: 'Diamond Jamboree',
                    time: '7:30 PM',
                    price: '\$1.89',
                    spotsLeft: 1,
                    pickupLocation: 'FP',
                    driverName: 'Sam',
                    driverRating: 4.5,
                  ),
                  SizedBox(height: 16),
                  RideCard(
                    destination: 'Spectrum',
                    time: '9:00 PM',
                    price: '\$2.54',
                    spotsLeft: 4,
                    pickupLocation: 'UTC',
                    driverName: 'Sam',
                    driverRating: 4.5,
                    hasIndicator: true,
                  ),
                  SizedBox(height: 16),
                  RideCard(
                    destination: 'Spectrum',
                    time: '9:00 PM',
                    price: '\$3.10',
                    spotsLeft: null,
                    pickupLocation: null,
                    driverName: 'Sam',
                    driverRating: 4.5,
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RideCard extends StatelessWidget {
  final String destination;
  final String time;
  final String price;
  final int? spotsLeft;
  final String? pickupLocation;
  final String driverName;
  final double driverRating;
  final bool hasIndicator;

  const RideCard({
    Key? key,
    required this.destination,
    required this.time,
    required this.price,
    required this.driverName,
    required this.driverRating,
    this.spotsLeft,
    this.pickupLocation,
    this.hasIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF9DB5A5),
            Color(0xFF8AAA98),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with destination, price, and indicator
            Row(
              children: [
                Expanded(
                  child: Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                if (hasIndicator)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 4),
            
            // Time
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Info row with spots left and pickup location
            if (spotsLeft != null && pickupLocation != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$spotsLeft Spot${spotsLeft == 1 ? '' : 's'} Left',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Ideal Pickup Location: $pickupLocation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            
            const SizedBox(height: 16),
            
            // Bottom row with driver info and button
            Row(
              children: [
                // Driver info
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driverName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            driverRating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Request Ride Button
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D5A3D),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        showRequestRidePopup(
                          context,
                          destination: destination,
                          time: time,
                          price: price,
                          driverName: driverName,
                          driverRating: driverRating,
                          pickupLocation: pickupLocation,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          'Request Ride',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}