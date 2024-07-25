import 'package:flutter/material.dart';
import 'favorites_manager.dart';  // Import favorites manager
import 'booking.dart';  // Import the booking page

class DeluxeRoom extends StatefulWidget {
  const DeluxeRoom({super.key});

  @override
  _DeluxeRoomState createState() => _DeluxeRoomState();
}

class _DeluxeRoomState extends State<DeluxeRoom> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    final roomDetails = {
      'title': 'Deluxe Room',
    };
    isFavorite = FavoritesManager.isFavorite(roomDetails['title']!);
  }

  @override
  Widget build(BuildContext context) {
    final roomDetails = {
      'title': 'Deluxe Room',
      'imageUrl': 'assets/images/deluxe-room.jpg',
      'price': '\$120 per night',
      'reviews': '4.5 (120 reviews)',
      'features': 'Indulge in the spaciousness of our Deluxe Room. Featuring two comfortable Double Beds and spanning 33 sqm, this room offers ample space for relaxation and productivity. Complete with a work desk, modern design, and elegant touches, it’s a stylish choice for a memorable stay.',
      'guests': '2 adults, 2 Children (11 years old and below)',
      'facilities': 'In Room Dining Service, Air Conditioning, 220V Outlet, High Speed Internet, Telephone, Smart TV, In-room Safety Box, Coffee and Tea Makers, Toiletries Set, Bath Amenities, Hot and Cold Showers, Hair Dryer',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deluxe Room',
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
                    style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 83, 70)),
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
                      Text('4.5 (120 reviews)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Features',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(roomDetails['features']!, textAlign: TextAlign.justify,),
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
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(
                              roomTitle: roomDetails['title']!,
                              pricePerDay: 120.0,
                            ),
                          ),
                        );
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
