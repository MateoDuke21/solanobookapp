import 'package:flutter/material.dart';
import 'my_bookings_manager.dart'; // Import your bookings manager

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  _MyBookingsPageState createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookings',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 199, 164, 9),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.teal[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MyBookingsManager.bookings.isEmpty
          ? const Center(child: Text('No bookings yet.',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              fontFamily: 'Poppins',
            ),
          ))
          : ListView.builder(
              itemCount: MyBookingsManager.bookings.length,
              itemBuilder: (context, index) {
                final booking = MyBookingsManager.bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      booking['imageUrl']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(booking['title']!),
                    subtitle: Text(booking['price']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          MyBookingsManager.removeBooking(booking);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
