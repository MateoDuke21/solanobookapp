import 'package:flutter/material.dart';
import 'login.dart'; // Import authentication_screen.dart

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _signOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              // ignore: sort_child_properties_last
              child: const Text('CANCEL'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Set text color
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement sign out functionality here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginForm()),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text('SIGN OUT'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Set text color
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Personal Information Section
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Vic Sotoe'),
              subtitle: const Text('vic.sotoe@gmail.com'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to edit profile screen
              },
            ),
          ),
          const Divider(),

          // Settings Section
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
          ),
          const Divider(),

          // Account Management Section
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Navigate to change password screen
              },
            ),
          ),
          const Divider(),

          // Help & Feedback Section
          Card(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Feedback'),
              onTap: () {
                // Navigate to help & feedback screen
              },
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
