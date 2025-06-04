import 'package:flutter/material.dart';

class RequestRidePopup extends StatefulWidget {
  final String destination;
  final String time;
  final String price;
  final String driverName;
  final double driverRating;
  final String? pickupLocation;

  const RequestRidePopup({
    Key? key,
    required this.destination,
    required this.time,
    required this.price,
    required this.driverName,
    required this.driverRating,
    this.pickupLocation,
  }) : super(key: key);

  @override
  State<RequestRidePopup> createState() => _RequestRidePopupState();
}

class _RequestRidePopupState extends State<RequestRidePopup> {
  bool isIdealPickup = true;
  final TextEditingController _otherLocationController = TextEditingController();
  final TextEditingController _riderNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9DB5A5),
              Color(0xFF8AAA98),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.destination,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Time
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Pickup Location Section
                const Text(
                  'Pickup Location:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Pickup Options
                Row(
                  children: [
                    // Ideal Checkbox
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isIdealPickup = true;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isIdealPickup ? Colors.white : Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: isIdealPickup
                            ? const Icon(
                                Icons.check,
                                color: Color(0xFF2D5A3D),
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Ideal: ${widget.pickupLocation ?? 'UTC'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Other Location Option
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isIdealPickup = false;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: !isIdealPickup ? Colors.white : Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: !isIdealPickup
                            ? const Icon(
                                Icons.check,
                                color: Color(0xFF2D5A3D),
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Other:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: _otherLocationController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                hintText: 'Enter pickup location',
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isIdealPickup = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Notes Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Driver Notes
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Driver Notes',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '• will return around 8pm if interested\n• pick up near target parking lot\n• no food or eating in car pls\n• won\'t pick up more than 15 min from campus',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Driver Info
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.driverName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.driverRating.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Rider Notes
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Rider Notes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: _riderNotesController,
                              maxLines: null,
                              expands: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                                hintText: 'Add any notes for the driver...',
                                hintStyle: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D5A3D),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          // Handle submit request
                          Navigator.of(context).pop();
                          // Show success message or navigate to confirmation
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Ride request submitted for ${widget.destination}'),
                              backgroundColor: const Color(0xFF2D5A3D),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Center(
                            child: Text(
                              'Submit Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otherLocationController.dispose();
    _riderNotesController.dispose();
    super.dispose();
  }
}

// Helper function to show the popup
void showRequestRidePopup(
  BuildContext context, {
  required String destination,
  required String time,
  required String price,
  required String driverName,
  required double driverRating,
  String? pickupLocation,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RequestRidePopup(
      destination: destination,
      time: time,
      price: price,
      driverName: driverName,
      driverRating: driverRating,
      pickupLocation: pickupLocation,
    ),
  );
}