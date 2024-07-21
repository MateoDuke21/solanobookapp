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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Charlies.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'Dining',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Treat your taste buds to the rich culinary history of the Philippines. Solano Hotel offers three in-house dining options, all of which serve irresistibly bold flavors that will satisfy your cravings. Enjoy signature dining experiences only at Solano Hotel.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            // Paul Restaurant Section
            const DiningSection(
              title: 'Paul Restaurant',
              imagePath: 'assets/images/paul-restaurant2.jpg',
              description: 'Dine at Paul Restaurant, located on the 3rd floor of the hotel. Experience dining at a restaurant that delights your palate, with a menu that showcases elevated dishes inspired by cuisines from around the Philippines, expertly prepared by our seasoned chefs.',
              menuImagePaths: [
                '/assets/images/pr_menu1.jpg',
                '/assets/images/pr_menu2.jpg',
                '/assets/images/pr_menu3.jpg',
                '/assets/images/pr_menu4.jpg',
                '/assets/images/pr_menu5.jpg',
                '/assets/images/pr_menu6.jpg',
                '/assets/images/pr_menu7.jpg',
                '/assets/images/pr_menu8.jpg',
                '/assets/images/pr_menu9.jpg',
              ],
            ),
            // Charlie’s Bar & Grill Section
            const DiningSection(
              title: 'Charlie’s Bar & Grill',
              imagePath: 'assets/images/Charlies2.jpg',
              description: 'Adjacent to Paul Restaurant, Charlie’s Bar and Grill offers a relaxing and friendly atmosphere all our guests can enjoy. Expect freshly cooked meals and hand-crafted cocktails while enjoying the serene view from this alfresco dining spot.',
              menuImagePaths: [
                '/assets/images/char_drinks1.jpg',
                '/assets/images/char_drinks2.jpg',
              ],
            ),
            // Caffe Ysabel Section
            const DiningSection(
              title: 'Caffe Ysabel',
              imagePath: 'assets/images/Caffe-Ysabel2.jpg',
              description: 'Caffe Ysabel is the cafe to be if you are looking for irresistible pastries, authentic coffee, and other comfort foods in Lipa City. The menu features contemporary-infused Ysabel’s Favorites that everyone must try.',
              menuImagePaths: [
                '/assets/images/caffe_menu1.jpg',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiningSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuImagePaths.length,
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
                            Image.asset(menuImagePaths[index], fit: BoxFit.cover),
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
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(menuImagePaths[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
