import 'package:flutter/material.dart';

// Color & Typography Constants
const Color kPrimaryGreen = Color(0xFF4B6F55); // dark moss-green for active elements
const Color kCardGreen = Color(0xFFDCE8D4); // light muted green for card backgrounds
const Color kAccentGreen = Color(0xFF8BAE82); // medium green for icons/buttons
const Color kPurpleBadgeColor = Colors.purple; // For the badge icon

const TextStyle kScreenTitleStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPrimaryGreen);
const TextStyle kSectionHeaderStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87);
const TextStyle kCardTitleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87);
const TextStyle kCardSubtitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87);
const TextStyle kCardDetailStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54);

const double kPadding = 16.0;
const double kSmallSpacer = 8.0;
const double kMediumSpacer = 12.0;
const double kLargeSpacer = 24.0;

class RideInformationScreen extends StatefulWidget {
  final String? rideDestination;
  final String? rideTime;
  final String? rideDate;
  final String? pickupLocation;
  final String? driverName;
  final double? driverRating;

  const RideInformationScreen({
    Key? key,
    this.rideDestination,
    this.rideTime,
    this.rideDate,
    this.pickupLocation,
    this.driverName,
    this.driverRating,
  }) : super(key: key);

  @override
  _RideInformationScreenState createState() => _RideInformationScreenState();
}

class _RideInformationScreenState extends State<RideInformationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // State to manage ride requests and upcoming rides
  List<Map<String, dynamic>> _rideRequests = [];
  
  List<Map<String, dynamic>> _upcomingRideRiders = [
    {'name': 'Megan S', 'location': 'UTC'},
    {'name': 'Kayla A', 'location': 'UTC'},
    {'name': 'Lanie P', 'location': '1234 Anteater Drive'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging || _tabController.index != _tabController.previousIndex) {
        setState(() {});
      }
    });
    
    // Initialize ride requests with passed data or default data
    _initializeRideRequests();
  }

  void _initializeRideRequests() {
    // Add the current ride request using passed data or defaults
    _rideRequests = [
      {
        'id': 1,
        'destination': widget.rideDestination ?? 'Diamond Jamboree',
        'date': widget.rideDate ?? '5/28',
        'time': widget.rideTime ?? '1:00 PM',
        'pickupLocation': widget.pickupLocation ?? 'Costa Mesa (3.4 miles away)',
        'riderName': 'Maria',
        'riderRating': 3.8,
      }
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Accept ride request logic
  void _acceptRideRequest(Map<String, dynamic> request) {
    setState(() {
      // Add rider to upcoming rides list
      _upcomingRideRiders.add({
        'name': request['riderName'],
        'location': 'Pickup Location',
      });
      
      // Remove from requests list
      _rideRequests.removeWhere((req) => req['id'] == request['id']);
    });
    
    // Show success message using your app's color scheme
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${request['riderName']} has been added to your upcoming ride'),
        backgroundColor: const Color(0xFF2D5A3D),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Reject ride request logic
  void _rejectRideRequest(Map<String, dynamic> request) {
    setState(() {
      // Remove from requests list
      _rideRequests.removeWhere((req) => req['id'] == request['id']);
    });
    
    // Show rejection message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ride request from ${request['riderName']} has been rejected'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildIconTextRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: kAccentGreen),
        const SizedBox(width: kSmallSpacer),
        Expanded(child: Text(text, style: kCardDetailStyle)),
      ],
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Tab(
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAF9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.grey.withOpacity(0.2),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: kPrimaryGreen, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Ride Information", style: kScreenTitleStyle),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: kPrimaryGreen,
            indicatorWeight: 3.0,
            labelColor: kPrimaryGreen,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            tabs: const [
              Tab(text: "Driver"),
              Tab(text: "Rider"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildDriverTab(),
            _buildRiderTab(),
            Container(
              alignment: Alignment.center,
              child: const Text("History - Placeholder", style: kSectionHeaderStyle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiderTab() {
    // Use passed data or fallback to defaults
    String destination = widget.rideDestination ?? 'Diamond Jamboree';
    String time = widget.rideTime ?? '1:00 PM';
    String date = widget.rideDate ?? '5/28';
    String pickupLoc = widget.pickupLocation ?? 'Flagpoles';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Requested Rides", style: kSectionHeaderStyle),
          const SizedBox(height: kSmallSpacer),
          Container(
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
              color: kCardGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(destination, style: kCardTitleStyle),
                    Text(date, style: kCardDetailStyle.copyWith(color: kPrimaryGreen)),
                  ],
                ),
                const SizedBox(height: kSmallSpacer),
                Text(time, style: kCardSubtitleStyle),
                const SizedBox(height: kSmallSpacer / 2),
                Text(
                  "pending driver action",
                  style: kCardDetailStyle.copyWith(fontStyle: FontStyle.italic, color: kPrimaryGreen.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          const SizedBox(height: kLargeSpacer),
          const Text("Upcoming Rides", style: kSectionHeaderStyle),
          const SizedBox(height: kSmallSpacer),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(kPadding),
                decoration: BoxDecoration(
                  color: kCardGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(destination, style: kCardTitleStyle),
                        Text(date, style: kCardDetailStyle.copyWith(color: kPrimaryGreen)),
                      ],
                    ),
                    const SizedBox(height: kMediumSpacer),
                    _buildIconTextRow(Icons.directions_car, "Ride to: $destination"),
                    const SizedBox(height: kSmallSpacer),
                    _buildIconTextRow(Icons.location_on, "Pickup Location: $pickupLoc"),
                    const SizedBox(height: kSmallSpacer),
                    _buildIconTextRow(Icons.access_time, "Be there by: $time"),
                  ],
                ),
              ),
              Positioned(
                top: kPadding / 2,
                right: kPadding / 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kPurpleBadgeColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.local_offer, size: 16, color: kPurpleBadgeColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: kLargeSpacer),
        ],
      ),
    );
  }

  Widget _buildDriverTab() {
    // Use passed data or fallback to defaults for driver tab as well
    String destination = widget.rideDestination ?? 'Diamond Jamboree';
    String date = widget.rideDate ?? '5/28';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: Requested Rides
          const Text("Requested Rides", style: kSectionHeaderStyle),
          const SizedBox(height: kSmallSpacer),
          
          // Show message if no requests
          if (_rideRequests.isEmpty)
            Container(
              padding: const EdgeInsets.all(kPadding * 2),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Center(
                child: Column(
                  children: [
                    Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      "No pending ride requests",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            // Show ride requests using dynamic data
            Column(
              children: _rideRequests.map((request) => Container(
                margin: const EdgeInsets.only(bottom: kSmallSpacer),
                padding: const EdgeInsets.all(kPadding),
                decoration: BoxDecoration(
                  color: kCardGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(request['destination'], style: kCardTitleStyle),
                        Text(request['date'], style: kCardDetailStyle.copyWith(color: kPrimaryGreen)),
                      ],
                    ),
                    const SizedBox(height: kSmallSpacer),
                    Text("Pick up: ${request['pickupLocation']}", style: kCardSubtitleStyle),
                    const SizedBox(height: kMediumSpacer),
                    Row(
                      children: [
                        CircleAvatar(radius: 16, backgroundColor: Colors.grey[300]),
                        const SizedBox(width: kSmallSpacer),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(request['riderName'], style: kCardSubtitleStyle),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber[600], size: 14),
                                const SizedBox(width: 4),
                                Text(request['riderRating'].toString(), style: kCardDetailStyle.copyWith(color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3, offset: const Offset(0, 1)),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.redAccent),
                            onPressed: () => _rejectRideRequest(request),
                            splashRadius: 20,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(width: kSmallSpacer),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3, offset: const Offset(0, 1)),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.check, color: kAccentGreen),
                            onPressed: () => _acceptRideRequest(request),
                            splashRadius: 20,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )).toList(),
            ),
            
          const SizedBox(height: kLargeSpacer),
          
          // Section 2: Upcoming Rides
          const Text("Upcoming Rides", style: kSectionHeaderStyle),
          const SizedBox(height: kSmallSpacer),
          Container(
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
              color: kCardGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(destination, style: kCardTitleStyle),
                    Text(date, style: kCardDetailStyle.copyWith(color: kPrimaryGreen)),
                  ],
                ),
                const SizedBox(height: kSmallSpacer),
                Text(widget.rideTime ?? "1:00 PM", style: kCardSubtitleStyle),
                const SizedBox(height: kMediumSpacer),
                const Text("Riders:", style: kCardSubtitleStyle),
                const SizedBox(height: kSmallSpacer / 2),
                // Dynamic list of riders
                ..._upcomingRideRiders.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> rider = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: kSmallSpacer / 2),
                    child: Text(
                      "${index + 1}. ${rider['name']} : ${rider['location']}", 
                      style: kCardDetailStyle.copyWith(height: 1.5),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          const SizedBox(height: kLargeSpacer),
        ],
      ),
    );
  }
}