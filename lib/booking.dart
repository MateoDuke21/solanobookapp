import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

void main() => runApp(const BookingApp());

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Screen',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numberOfDays = 0;
  double _totalAmount = 0.0;
  final double _bookingPricePerDay = 110.0; // Example price per day

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
            _checkOutDate = null; // Reset check-out date if it's before check-in
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
      _totalAmount = _numberOfDays * _bookingPricePerDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Select Date',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Check in',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              _checkInDate != null
                                  ? DateFormat('yyyy-MM-dd').format(_checkInDate!)
                                  : 'Select Date',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Check out',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              _checkOutDate != null
                                  ? DateFormat('yyyy-MM-dd').format(_checkOutDate!)
                                  : 'Select Date',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoRow('Number of Days', _numberOfDays.toString()),
              const SizedBox(height: 16),
              _buildInfoRow('Total Amount', '\$$_totalAmount'),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Transaction Completed Successfully!',
                      autoCloseDuration: const Duration(seconds: 2),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // background color
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white, // text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.grey,
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
