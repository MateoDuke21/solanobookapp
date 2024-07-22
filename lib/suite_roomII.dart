import 'package:flutter/material.dart';
import 'favorites_manager.dart';  // Import favorites manager

class SuiteRoomII extends StatefulWidget {
  const SuiteRoomII({super.key});

  @override
  _SuiteRoomIIState createState() => _SuiteRoomIIState();
}

class _SuiteRoomIIState extends State<SuiteRoomII> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    final roomDetails = {
      'title': 'Suite Room II',
    };
    isFavorite = FavoritesManager.isFavorite(roomDetails['title']!);
  }

  @override
  Widget build(BuildContext context) {
    final roomDetails = {
      'title': 'Suite Room II',
      'imageUrl': 'assets/images/suite-room-II.jpg', // Make sure this path is correct
      'price': '\$180 per night',
      'reviews': '4.9 (85 reviews)',
      'features': 'Ideal for families or groups, our Suite Room II offers exceptional comfort and versatility. With a combination of a King Bed and a Double Bed, this 53 sqm suite provides ample space for everyone. Enjoy the convenience of a kitchenette, small living room, work desk, and dining table, all encompassed by a modern design and elegant atmosphere.',
      'guests': '3 adults, 2 Children (11 years old and below)',
      'facilities': 'In Room Dining Service, Air Conditioning, 220V Outlet, High Speed Internet, Telephone, Smart TV, In-room Safety Box, Coffee and Tea Makers, Toiletries Set, Bath Amenities, Hot and Cold Showers, Hair Dryer, Kitchenette, Dining Table',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suite Room II',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 199, 164, 9),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.teal[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              roomDetails['imageUrl']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomDetails['title']!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        FavoritesManager.toggleFavorite(roomDetails);
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    roomDetails['price']!,
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('4.9 (85 reviews)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Features',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(roomDetails['features']!),
                  const SizedBox(height: 16),
                  const Text(
                    'Capacity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(roomDetails['guests']!),
                  const SizedBox(height: 16),
                  const Text(
                    'Amenities',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      FacilityIcon(icon: Icons.room_service, label: 'Room Service'),
                      FacilityIcon(icon: Icons.ac_unit, label: 'AC'),
                      FacilityIcon(icon: Icons.power, label: '220V Outlet'),
                      FacilityIcon(icon: Icons.wifi, label: 'Internet'),
                      FacilityIcon(icon: Icons.phone, label: 'Telephone'),
                      FacilityIcon(icon: Icons.tv, label: 'Smart TV'),
                      FacilityIcon(icon: Icons.lock, label: 'Safety Box'),
                      FacilityIcon(icon: Icons.coffee, label: 'Coffee Maker'),
                      FacilityIcon(icon: Icons.bathroom, label: 'Toiletries'),
                      FacilityIcon(icon: Icons.shower, label: 'Hot Shower'),
                      FacilityIcon(icon: Icons.bathroom, label: 'Bath Amenities'),
                      FacilityIcon(icon: Icons.air, label: 'Hair Dryer'),
                      FacilityIcon(icon: Icons.kitchen, label: 'Kitchenette'),
                      FacilityIcon(icon: Icons.dining, label: 'Dining Table'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add booking functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[900],
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
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

class FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const FacilityIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.teal[900]),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
