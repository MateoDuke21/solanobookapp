import 'package:flutter/material.dart';
import 'login.dart'; // Import authentication_screen.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Startup Screen',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SlidersScreen(),
    );
  }
}

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlidersScreenState createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  final List<String> _images = [
    'assets/images/solano-hotel.jpg', // replace with actual image paths
    'assets/images/solano-hotel2.jpg',
    'assets/images/solano-hotel3.jpg',
  ];

  final List<String> _titles = [
    'Delightful Experiences Await',
    'Located in the Hub of Lipa',
    'Generous Spaces',
  ];

  final List<String> _descriptions = [
    'Feel the true warmth of Filipino hospitality at Solano Hotel.',
    'Solano Hotel’s central location makes sure you have convenient access to anywhere and everywhere in Lipa City.',
    'All rooms were designed with inviting ambience and equipped with all the modern comfort for a relaxing stay.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[100], // Set the background color for the entire screen
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              _goToPreviousPage();
            } else if (details.primaryVelocity! < 0) {
              _goToNextPage();
            }
          },
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Image.asset(
                          _images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              _titles[index],
                              style: const TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 2, 83, 50),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Text(
                                _descriptions[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_images.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 10.0,
                      width: _currentPage == index ? 20.0 : 10.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.amber[400]
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: _currentPage != 0
                    ? IconButton(
                        onPressed: _goToPreviousPage,
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                      )
                    : Container(),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: _currentPage < _images.length - 1
                    ? IconButton(
                        onPressed: _goToNextPage,
                        icon: const Icon(Icons.arrow_forward),
                        color: Colors.black,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          // Navigate to Authetication Screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginForm(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[900],
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white, // Change this to your desired color
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

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < _images.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
