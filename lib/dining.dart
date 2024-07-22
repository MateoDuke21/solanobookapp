import 'package:flutter/material.dart';

class DiningPage extends StatelessWidget {
  const DiningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dining Details',
          style: TextStyle(
            fontSize: 26,
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
            // Top Section
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3, // Adjust height as needed
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    'assets/images/dining.jpg', // Replace with your background image
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
                
                  // Content
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40), // Adjust this space to leave room for the back icon
                        Text(
                          'Dining',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Treat your taste buds to the rich culinary history of the Philippines. Solano Hotel offers three in-house dining options, all of which serve irresistibly bold flavors that will satisfy your cravings. Enjoy signature dining experiences only at Solano Hotel.',
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

            // Paul Restaurant Section
            const DiningSection(
              title: 'Paul Restaurant',
              imagePath: 'assets/images/paul-restaurant2.jpg',
              description: 'Dine at Paul Restaurant, located on the 3rd floor of the hotel. Experience dining at a restaurant that delights your palate, with a menu that showcases elevated dishes inspired by cuisines from around the Philippines, expertly prepared by our seasoned chefs.',
              menuImagePaths: [
                'assets/images/pr_menu1.jpg',
                'assets/images/pr_menu2.jpg',
                'assets/images/pr_menu3.jpg',
                'assets/images/pr_menu4.jpg',
                'assets/images/pr_menu5.jpg',
                'assets/images/pr_menu6.jpg',
                'assets/images/pr_menu7.jpg',
                'assets/images/pr_menu8.jpg',
                'assets/images/pr_menu9.jpg',
              ],
            ),
            // Charlie’s Bar & Grill Section
            const DiningSection(
              title: 'Charlie’s Bar & Grill',
              imagePath: 'assets/images/Charlies2.jpg',
              description: 'Adjacent to Paul Restaurant, Charlie’s Bar and Grill offers a relaxing and friendly atmosphere all our guests can enjoy. Expect freshly cooked meals and hand-crafted cocktails while enjoying the serene view from this alfresco dining spot.',
              menuImagePaths: [
                'assets/images/char_drinks1.jpg',
                'assets/images/char_drinks2.jpg',
              ],
            ),
            // Caffe Ysabel Section
            const DiningSection(
              title: 'Caffe Ysabel',
              imagePath: 'assets/images/Caffe-Ysabel2.jpg',
              description: 'Caffe Ysabel is the cafe to be if you are looking for irresistible pastries, authentic coffee, and other comfort foods in Lipa City. The menu features contemporary-infused Ysabel’s Favorites that everyone must try.',
              menuImagePaths: [
                'assets/images/caffe_menu.jpg',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiningSection extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final List<String> menuImagePaths;

  const DiningSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.menuImagePaths,
  });

  @override
  _DiningSectionState createState() => _DiningSectionState();
}

class _DiningSectionState extends State<DiningSection> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(widget.imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.menuImagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(widget.menuImagePaths[index], fit: BoxFit.cover),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(widget.menuImagePaths[index], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_left, size: 32, color: Colors.teal),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_right, size: 32, color: Colors.teal),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
