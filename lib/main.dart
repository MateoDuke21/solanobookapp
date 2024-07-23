import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'favorites.dart';
import 'my_bookings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solano Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
      routes: {
        '/favorites': (context) => const FavoritesPage(),
        '/my_bookings': (context) => const MyBookingsPage(),
      },
    );
  }
}
