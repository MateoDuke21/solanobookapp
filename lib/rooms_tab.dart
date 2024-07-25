import 'package:flutter/material.dart';
import 'package:solanobookapp/deluxe_room.dart';
import 'package:solanobookapp/exec_room.dart';
import 'package:solanobookapp/exec_roomII.dart';
import 'package:solanobookapp/suite_room.dart';
import 'package:solanobookapp/suite_roomII.dart';
import 'package:solanobookapp/superior_room.dart';
import 'home_page.dart';

class RoomsTab extends StatelessWidget {
  const RoomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    'assets/images/suite-room-II.jpg', // Replace with your background image
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  // Back Arrow Icon
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                            // Navigate to the Home page
                          Navigator.pushReplacement(
                            context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()),
                          );
                        },
                    ),
                  ),
                  // Content
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40), // Adjust this space to leave room for the back icon
                        Text(
                          'Our Rooms',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'At Solano Hotel, we take pride in offering exceptional hotel accommodations in Lipa City, where providing guests with the best possible experience is our top priority. All 40 of our rooms are stylish and serene, designed with quality locally made furnishings and modern amenities to make your stay as comfortable as possible. Whether you are in Lipa City for business or are looking for family-friendly accommodations, you are sure to find that there’s an ideal haven waiting for you.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Rooms Section
            _buildSectionTitle('Rooms'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 600, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final cardData = [
                      {'image': 'assets/images/deluxe-room.jpg', 'title': '\$120', 'description': 'Deluxe Room', 'route': const DeluxeRoom()},
                      {'image': 'assets/images/suite-room-I.jpg', 'title': '\$150', 'description': 'Suite Room I', 'route': const SuiteRoom()},
                      {'image': 'assets/images/suite-room-II.jpg', 'title': '\$180', 'description': 'Suite Room II', 'route': const SuiteRoomII()},
                      {'image': 'assets/images/superior-room.jpg', 'title': '\$200', 'description': 'Superior Room', 'route': const SuperiorRoom()},
                      {'image': 'assets/images/executive-room-I.jpg', 'title': '\$230', 'description': 'Executive Suite Room I', 'route': const ExecRoom()},
                      {'image': 'assets/images/executive-room-II.jpg', 'title': '\$250', 'description': 'Executive Suite Room II', 'route': const ExecRoomII()}
                    ];
                    final data = cardData[index];
                    return _buildCardWithRouteButton(data['image'] as String, data['title'] as String, data['description'] as String, context, data['route'] as Widget);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87, // Change the color to black
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _buildCardWithRouteButton(String imagePath, String title, String description, BuildContext context, Widget route) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5, // Added elevation for a better visual effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => route,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
