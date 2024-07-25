import 'package:flutter/material.dart';
import 'favorites_manager.dart';  // Import favorites manager

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
      body: FavoritesManager.favorites.isEmpty
          ? const Center(child: Text('No favorites yet.', 
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              fontFamily: 'Poppins',
            ),
          )
        )
          : ListView.builder(
              itemCount: FavoritesManager.favorites.length,
              itemBuilder: (context, index) {
                final favorite = FavoritesManager.favorites[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      favorite['imageUrl']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(favorite['title']!),
                    subtitle: Text(favorite['price']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        setState(() {
                          FavoritesManager.toggleFavorite(favorite);
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
