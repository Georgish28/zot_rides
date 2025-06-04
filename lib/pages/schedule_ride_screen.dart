import 'package:flutter/material.dart';

const Color _backgroundColor = Color(0xFFFEFEEF);
const Color _sageGreen = Color(0xFF7A8E6D);
const Color _darkSageGreen = Color(0xFF556B2F); // For titles
const Color _textFieldInputColor = Color(0xFF4F5B4A);
const Color _lightGrayBackground = Color(0xFFF8F8F8);

class ScheduleRideScreen extends StatefulWidget {
  const ScheduleRideScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleRideScreen> createState() => _ScheduleRideScreenState();
}

class _ScheduleRideScreenState extends State<ScheduleRideScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;
  List<Map<String, dynamic>> _searchResults = [];

  // Dummy search function
  void _performSearch() {
    // In a real app, this would fetch data based on _searchController.text, date, time
    setState(() {
      _hasSearched = true;
      // Simulate API call delay
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _searchResults = [
            {
              'title': 'Kendrick Lamar and SZA Concert in LA',
              'time': 'June 20, 2025 - 1:00 PM',
              'spotsLeft': 2,
              'pickupLocation': 'Flagpoles',
              'price': '\$10',
            },
            {
              'title': 'Billie Eilish Concert in Anaheim',
              'time': 'June 21, 2025 - 9:00 AM',
              'spotsLeft': 1,
              'pickupLocation': 'UTC',
              'price': '\$9.50',
            },
            {
              'title': 'Concert Ride - The Forum',
              'time': 'June 22, 2025 - 7:00 PM',
              'spotsLeft': 4,
              'pickupLocation': 'Camino Del Sol',
              'price': '\$4.99',
            },
          ];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor, // Match scaffold background
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _sageGreen, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Find a Ride', // Changed title
          style: TextStyle(
            fontSize: 28, // Adjusted from Figma prompt for consistency
            fontWeight: FontWeight.w600, // Adjusted from Figma prompt
            color: _darkSageGreen,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8), // Reduced top padding as AppBar is present
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: _lightGrayBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    const Icon(Icons.search, color: _sageGreen, size: 24),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(color: _textFieldInputColor, fontSize: 16),
                        cursorColor: _sageGreen,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search destination...', // Changed hint text
                          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                          contentPadding: const EdgeInsets.symmetric(vertical: 14), // Adjusted for vertical centering
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Filter Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildFilterPill('6/20/25'), // Static date
                  const SizedBox(width: 8),
                  _buildFilterPill('2:00–5:00 PM'), // Static time range
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _performSearch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _sageGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(60, 32),
                    ),
                    child: const Text(
                      'Go',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Results Area
            Expanded(
              child: _hasSearched
                  ? _searchResults.isEmpty
                      ? Center(child: Text('No rides found for "${_searchController.text}".', style: TextStyle(color: Colors.grey[600])))
                      : ListView.builder(
                          padding: const EdgeInsets.only(bottom: 16),
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final ride = _searchResults[index];
                            return _buildRideResultCard(
                              title: ride['title']!,
                              time: ride['time']!,
                              spotsLeft: ride['spotsLeft']!,
                              pickupLocation: ride['pickupLocation']!,
                              price: ride['price']!,
                            );
                          },
                        )
                  : Center(child: Text('Enter a destination and tap "Go" to find rides.', style: TextStyle(color: Colors.grey[600]))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterPill(String text) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: _sageGreen, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildRideResultCard({
    required String title,
    required String time,
    required int spotsLeft,
    required String pickupLocation,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _sageGreen, // forest/ sage-green
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0,3),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title + Price
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Ride Time
          Text(
            time,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          // Spots Left
          Text(
            '$spotsLeft ${spotsLeft == 1 ? "Spot" : "Spots"} Left',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          // Pickup Location
          Text(
            'Pickup: $pickupLocation', // Simplified label
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          // Buttons Row
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: navigate to scheduling flow for this specific ride
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Schedule action for: $title')),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // white background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size.fromHeight(36), // Adjusted height
                  ),
                  child: const Text(
                    'Schedule',
                    style: TextStyle(
                      color: _sageGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: request pickup logic for this specific ride
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request Pickup action for: $title')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1.5), // Adjusted width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size.fromHeight(36), // Adjusted height
                  ),
                  child: const Text(
                    'Request Pickup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}