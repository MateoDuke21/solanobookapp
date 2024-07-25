  import 'package:flutter/material.dart';
  import 'package:solanobookapp/favorites.dart';
  import 'profile.dart';
  import 'rooms_tab.dart';
  import 'dining.dart';
  import 'my_bookings.dart';

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key});

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    int _selectedIndex = 0;

    static const List<Widget> _widgetOptions = <Widget>[
      HomeTab(),
      SearchTab(),
      RoomsTab(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Solano Book',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 202, 173, 4),
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: Colors.teal[900],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 70, 52),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Home',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Search',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
              ListTile(
                leading: const Icon(Icons.door_front_door, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Rooms',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(2);
                },
              ),
              ListTile(
                leading: const Icon(Icons.dinner_dining, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Dining',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DiningPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Favorites',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavoritesPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.book, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('My Bookings',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyBookingsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Color.fromARGB(255, 0, 59, 42),),
                title: const Text('Profile',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              ),
              
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_front_door),
              label: 'Rooms',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal[900],
          onTap: _onItemTapped,
        ),
      );
    }
  }

  class HomeTab extends StatelessWidget {
    const HomeTab({super.key});

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2, // Adjust height as needed
              child: Stack(
                children: [
                  // Background image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/solano-hotel3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  // Content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between children
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/solanologo.png', width: 50, height: 50),
                                const SizedBox(width: 10),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite, color: Colors.amber),
                              onPressed: () {
                                // Navigate to Dining page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Welcome to Solano Hotel',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Rooms Section
            _buildSectionTitle('Rooms'),
            SizedBox(
              height: 600, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  final cardData = [
                    {'image': 'assets/images/deluxe-room.jpg', 'title': '\$120', 'description': 'Deluxe Room'},
                    {'image': 'assets/images/suite-room-I.jpg', 'title': '\$150', 'description': 'Suite Room I'},
                    {'image': 'assets/images/suite-room-II.jpg', 'title': '\$180', 'description': 'Suite Room II'},
                    {'image': 'assets/images/superior-room.jpg', 'title': '\$200', 'description': 'Superior Room'},
                    {'image': 'assets/images/executive-room-I.jpg', 'title': '\$230', 'description': 'Executive Suite Room I'},
                    {'image': 'assets/images/executive-room-II.jpg', 'title': '\$250', 'description': 'Executive Suite Room II'}
                  ];
                  final data = cardData[index];
                  return _buildCardRoomButton(data['image']!, data['title']!, data['description']!, context);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Dining Section
            _buildSectionTitle('Dining'),
            SizedBox(
              height: 600, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final cardData = [
                    {'image': 'assets/images/paul-restaurant.jpg', 'title': 'Paul Restaurant', 'description': 'Experience dining at a restaurant that delights your palate'},
                    {'image': 'assets/images/Caffe-Ysabel.jpg', 'title': 'Caffe Ysabel', 'description': 'The cafe for irresistible pastries, authentic coffee, and other comfort foods'},
                    {'image': 'assets/images/Charlies.jpg', 'title': 'Charlies Bar & Grill', 'description': 'Offers a relaxing and friendly atmosphere all our guests can enjoy.'}
                  ];
                  final data = cardData[index];
                  return _buildCardDiningButton(data['image']!, data['title']!, data['description']!, context);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Meetings & Celebrations Section
            _buildSectionTitle('Meetings & Celebrations'),
            SizedBox(
              height: 600, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final cardData = [
                    {'image': 'assets/images/asher-hall.jpg', 'title': 'Asher Hall', 'description': 'Our versatile hall for meetings, seminars, or virtual assemblies.'},
                    {'image': 'assets/images/ashley-grandballroom.jpg', 'title': 'Ashley Grand Ballroom', 'description': 'It is best suited for large conferences and social events.'},
                    {'image': 'assets/images/cloud-meetingroom.jpg', 'title': 'Cloud Meeting Room', 'description': 'Provides a versatile space suitable for board meetings and intimate gatherings.'}
                  ];
                  final data = cardData[index];
                  return _buildCardWithoutButton(data['image']!, data['title']!, data['description']!, context);
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildSectionTitle(String title) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      );
    }

    Widget _buildCardRoomButton(String imagePath, String title, String description, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the RoomsTab page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RoomsTab()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('View Details',
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

    Widget _buildCardDiningButton(String imagePath, String title, String description, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Dining page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DiningPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                    ),
                    child: const Text('View Details',
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


    Widget _buildCardWithoutButton(String imagePath, String title, String description, BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }


  class SearchTab extends StatefulWidget {
    const SearchTab({super.key});

    @override
    // ignore: library_private_types_in_public_api
    _SearchTabState createState() => _SearchTabState();
  }

  class _SearchTabState extends State<SearchTab> {
    final TextEditingController _searchController = TextEditingController();
    String _searchText = '';

    // Sample data for Rooms, Dining, and Meetings & Celebrations with images
    final List<Map<String, String>> _rooms = [
      {'title': 'Deluxe Room', 'description': 'Bed Configuration: Two (2) Double Beds \n Capacity: 2 adults, 2 Children (11 years old and below) \n Size:33 sq.m.', 'image': 'assets/images/deluxe-room.jpg'},
      {'title': 'Suite Room I', 'description': 'Bed Configuration: One (1) California King Bed \n Capacity: 2 adults, 2 Children (11 years old and below) \n Size: 53 sq.m.', 'image': 'assets/images/suite-room-I.jpg'},
      {'title': 'Suite Room II', 'description': 'Bed Configuration: One (1) King Bed and One (1) Double Bed \n Capacity: 3 adults, 2 Children (11 years old and below) \n Size: 53 sq.m.', 'image': 'assets/images/suite-room-II.jpg'},
      {'title': 'Superior Room', 'description': 'Bed Configuration: Choice of One (1) King Bed or Two (2) Double Beds \n Capacity: 2 adults, 2 Children (11 years old and below) \n Size: 29 sq.m.', 'image': 'assets/images/superior-room.jpg'},
      {'title': 'Executive Suite Room I', 'description': 'Bed Configuration: One (1) California King Bed \n Capacity: 2 adults, 2 Children (11 years old and below) \n Size: 55 sq.m.', 'image': 'assets/images/executive-room-I.jpg'},
      {'title': 'Executive Suite Room II', 'description': 'Bed Configuration: One (1) King Bed and One (1) Double Bed \n Capacity: 3 adults, 2 Children (11 years old and below) \n Size: 55 sq.m.', 'image': 'assets/images/executive-room-II.jpg'},
    ];

    final List<Map<String, String>> _dining = [
      {'title': 'Paul Restaurant', 'description': 'Dine at Paul Restaurant, located on the 3rd floor of the hotel. Experience dining at a restaurant that delights your palate, with a menu that showcases elevated dishes inspired by cuisines from around the Philippines, expertly prepared by our seasoned chefs.', 'image': 'assets/images/paul-restaurant.jpg'},
      {'title': 'Caffe Ysabel', 'description': 'Caffe Ysabel is the cafe to be if you are looking for irresistible pastries, authentic coffee, and other comfort foods in Lipa City. The menu features contemporary-infused Ysabel’s Favorites that everyone must try.', 'image': 'assets/images/Caffe-Ysabel.jpg'},
      {'title': 'Charlies Bar & Grill', 'description': 'Adjacent to Paul Restaurant, Charlie’s Bar and Grill offers a relaxing and friendly atmosphere all our guests can enjoy. Expect freshly cooked meals and hand-crafted cocktails while enjoying the serene view from this alfresco dining spot', 'image': 'assets/images/Charlies.jpg'},
    ];

    final List<Map<String, String>> _meetings = [
      {'title': 'Asher Hall', 'description': 'Situated on the 3rd level, our versatile hall offers a flexible capacity of up to 110 guests, making it an ideal choice for meetings, seminars, or virtual assemblies. \n Size: 102.59 sqm', 'image': 'assets/images/asher-hall.jpg'},
      {'title': 'Ashley Grand Ballroom', 'description': 'This vast and pillarless event center is located on the 5th floor of the hotel. This impressive venue can comfortably accommodate a flexible capacity of up to a maximum of 800 guests and boasts a breathtaking view of Malarayat Mountain. It is best suited for large conferences and social events. \n Size: 843 sqm', 'image': 'assets/images/ashley-grandballroom.jpg'},
      {'title': 'Cloud Meeting Room', 'description': 'This meeting room, located on the 2nd level of the hotel, provides a versatile space suitable for board meetings and intimate gatherings. With a fixed table designed for 22 persons, it offers a professional and collaborative atmosphere, perfect for small-scale discussions, strategic planning sessions, and other intimate events. \n Size: 40 sqm', 'image': 'assets/images/cloud-meetingroom.jpg'},
    ];

    List<Map<String, String>> _filteredResults = [];

    @override
    void initState() {
      super.initState();
      _filteredResults = [..._rooms, ..._dining, ..._meetings];
    }

    void _filterResults() {
      setState(() {
        _filteredResults = [..._rooms, ..._dining, ..._meetings]
            .where((item) =>
                item['title']!.toLowerCase().contains(_searchText.toLowerCase()) ||
                item['description']!.toLowerCase().contains(_searchText.toLowerCase()))
            .toList();
      });
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (text) {
                _searchText = text;
                _filterResults();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                final item = _filteredResults[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      item['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item['title']!),
                    subtitle: Text(item['description']!, textAlign: TextAlign.justify,),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }


