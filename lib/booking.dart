import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'my_bookings_manager.dart'; // Import your bookings manager
// ignore: unused_import
import 'my_bookings.dart'; // Import your bookings page
import 'rooms_tab.dart'; 

class BookingPage extends StatefulWidget {
  final String roomTitle;
  final double pricePerDay;

  const BookingPage({
    Key? key,
    required this.roomTitle,
    required this.pricePerDay,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numberOfDays = 0;
  double _totalAmount = 0.0;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != (isCheckIn ? _checkInDate : _checkOutDate)) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
          if (_checkOutDate != null && _checkOutDate!.isBefore(_checkInDate!)) {
            _checkOutDate = null;
          }
        } else {
          _checkOutDate = picked;
        }
        _calculateNumberOfDays();
      });
    }
  }

  void _calculateNumberOfDays() {
    if (_checkInDate != null && _checkOutDate != null) {
      _numberOfDays = _checkOutDate!.difference(_checkInDate!).inDays;
      _totalAmount = _numberOfDays * widget.pricePerDay;
    }
  }

  void _continueBooking() {
    // Save booking details
    final bookingDetails = {
      'title': widget.roomTitle,
      'imageUrl': 'assets/images/${widget.roomTitle.toLowerCase().replaceAll(' ', '-')}.jpg',
      'price': '\$${_totalAmount.toStringAsFixed(2)}',
    };

    MyBookingsManager.addBooking(bookingDetails);

    // Show success dialog
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Booking Completed Successfully!',
      confirmBtnColor: Colors.amber,
      //autoCloseDuration: const Duration(seconds: 2),
      onConfirmBtnTap: () {
        Navigator.pop(context); // Close the dialog
        Navigator.pop(context); // Go back to the previous screen
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoomsTab()),
            );
          },
        ),
        title: Text(
          'Booking ${widget.roomTitle}',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.yellow,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Solano-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDateSelector(context, 'Check in', _checkInDate, true),
                  const SizedBox(height: 10),
                  _buildDateSelector(context, 'Check out', _checkOutDate, false),
                  const SizedBox(height: 20),
                  _buildInfoRow('Number of Days', _numberOfDays.toString()),
                  const SizedBox(height: 16),
                  _buildInfoRow('Total Amount', '\$${_totalAmount.toStringAsFixed(2)}'),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _checkInDate == null || _checkOutDate == null || _numberOfDays <= 0
                          ? null
                          : _continueBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context, String label, DateTime? date, bool isCheckIn) {
    return GestureDetector(
      onTap: () => _selectDate(context, isCheckIn),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.teal[700],
              ),
            ),
            Text(
              date != null
                  ? DateFormat('yyyy-MM-dd').format(date)
                  : 'Select Date',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.teal,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
