import 'package:flutter/material.dart';

class DiningPage extends StatelessWidget {
  const DiningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dining Details'),
        backgroundColor: Colors.teal[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/dining-background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  'Dining Options',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore our diverse dining options, offering a range of delectable dishes and unique dining experiences.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            // Dining Details Section
            // Add the detailed content here, similar to RoomsTab
          ],
        ),
      ),
    );
  }
}
